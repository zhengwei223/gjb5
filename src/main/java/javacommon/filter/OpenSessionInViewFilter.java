package javacommon.filter;

import java.io.IOException;
import java.util.concurrent.Callable;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.FlushMode;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.dao.DataAccessResourceFailureException;
import org.springframework.orm.hibernate4.SessionFactoryUtils;
import org.springframework.orm.hibernate4.SessionHolder;
import org.springframework.transaction.support.TransactionSynchronizationManager;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.context.request.async.CallableProcessingInterceptorAdapter;
import org.springframework.web.context.request.async.WebAsyncManager;
import org.springframework.web.context.request.async.WebAsyncUtils;

/**
 * 单独使用Spring的过滤器会出现异常，特此改进，将FlushMode设为AUTO <p>
 * 20130927 升级为hibernate4 重新编写该类，需要在session关闭前刷新session，因为我们没有在service层刷新
 * 
 * @author zhengwei lastmodified 2013年8月30日
 * 
 */
public class OpenSessionInViewFilter extends
		org.springframework.orm.hibernate4.support.OpenSessionInViewFilter {
	@Override
	protected void doFilterInternal(HttpServletRequest request,
			HttpServletResponse response, FilterChain filterChain)
			throws ServletException, IOException {
		SessionFactory sessionFactory = lookupSessionFactory(request);
		boolean participate = false;

		WebAsyncManager asyncManager = WebAsyncUtils.getAsyncManager(request);
		String key = getAlreadyFilteredAttributeName();

		if (TransactionSynchronizationManager.hasResource(sessionFactory)) {
			// Do not modify the Session: just set the participate flag.
			participate = true;
		} else {
			boolean isFirstRequest = !isAsyncDispatch(request);
			if (isFirstRequest
					|| !applySessionBindingInterceptor(asyncManager, key)) {
				logger.debug("Opening Hibernate Session in OpenSessionInViewFilter");
				Session session = openSession(sessionFactory);
				SessionHolder sessionHolder = new SessionHolder(session);
				TransactionSynchronizationManager.bindResource(sessionFactory,
						sessionHolder);

				asyncManager.registerCallableInterceptor(key,
						new SessionBindingCallableInterceptor(sessionFactory,
								sessionHolder));
			}
		}

		try {
			filterChain.doFilter(request, response);

		}

		finally {
			if (!participate) {
				SessionHolder sessionHolder = (SessionHolder) TransactionSynchronizationManager
						.unbindResource(sessionFactory);
				if (!isAsyncStarted(request)) {
					logger.debug("Closing Hibernate Session in OpenSessionInViewFilter");
					sessionHolder.getSession().flush();
					SessionFactoryUtils
							.closeSession(sessionHolder.getSession());
				}
			}
			LoggerMDCFilter.clearMDC();// 此处清理MDC add by zhengwei 20130908
		}
	}

	@Override
	protected Session openSession(SessionFactory sessionFactory)
			throws DataAccessResourceFailureException {
		// 修改Session的FlushModel
		Session session = super.openSession(sessionFactory);
		session.setFlushMode(FlushMode.AUTO);
		return session;
	}

	private boolean applySessionBindingInterceptor(
			WebAsyncManager asyncManager, String key) {
		if (asyncManager.getCallableInterceptor(key) == null) {
			return false;
		}
		((SessionBindingCallableInterceptor) asyncManager
				.getCallableInterceptor(key)).initializeThread();
		return true;
	}

	private static class SessionBindingCallableInterceptor extends
			CallableProcessingInterceptorAdapter {

		private final SessionFactory sessionFactory;

		private final SessionHolder sessionHolder;

		public SessionBindingCallableInterceptor(SessionFactory sessionFactory,
				SessionHolder sessionHolder) {
			this.sessionFactory = sessionFactory;
			this.sessionHolder = sessionHolder;
		}

		@Override
		public <T> void preProcess(NativeWebRequest request, Callable<T> task) {
			initializeThread();
		}

		@Override
		public <T> void postProcess(NativeWebRequest request, Callable<T> task,
				Object concurrentResult) {
			TransactionSynchronizationManager
					.unbindResource(this.sessionFactory);
		}

		private void initializeThread() {
			TransactionSynchronizationManager.bindResource(this.sessionFactory,
					this.sessionHolder);
		}
	}

}
