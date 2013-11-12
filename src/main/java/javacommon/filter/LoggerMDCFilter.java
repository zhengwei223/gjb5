package javacommon.filter;

import java.io.IOException;
import java.util.Map;
import java.util.UUID;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.MDC;
import org.springframework.web.filter.OncePerRequestFilter;

/**
 * 存放在MDC中的数据，log4j可以直接引用并作为日志信息打印出来.
 * 把MDC当做一次请求共享数据的地方
 * <pre>
 * 示例使用:
 * log4j.appender.stdout.layout.conversionPattern=%d [%X{loginUserId}/%X{req.remoteAddr}/%X{req.id} - %X{req.requestURI}?%X{req.queryString}] %-5p %c{2} - %m%n
 * </pre>
 * 
 * @author badqiu
 */
public class LoggerMDCFilter extends OncePerRequestFilter implements Filter {

	protected void doFilterInternal(HttpServletRequest request,
			HttpServletResponse response, FilterChain chain)
			throws ServletException, IOException {
		try {
			if (null != request.getSession().getAttribute("username")) {
				MDC.put("loginUserId",
						request.getSession().getAttribute("username"));
				MDC.put("userid",
						request.getSession().getAttribute("userid"));
			}
//			MDC.put("req.contextPath", request.getContextPath());
			// URI
			MDC.put("req.requestURI",
					StringUtils.defaultString(request.getRequestURI()));
			// 查询字符串
			MDC.put("req.queryString",
					StringUtils.defaultString(request.getQueryString()));
			MDC.put("req.requestURIWithQueryString",
					request.getRequestURI()
							+ (request.getQueryString() == null ? "" : "?"
									+ request.getQueryString()));
			// 远程地址
			MDC.put("req.remoteAddr",
					StringUtils.defaultString(request.getRemoteAddr()));

			// 为每一个请求的唯一标识，方便查找日志时可以根据ID查找出一个http请求所有相关日志
			MDC.put("req.id",
					StringUtils.remove(UUID.randomUUID().toString(), "-"));
			chain.doFilter(request, response);
		} finally {
			/*延迟到opensessionInViewFilter中清理， update by zhengwei 20130908
			 * clearMDC();*/
		}
	}

	public static void clearMDC() {
		Map map = MDC.getContext();
		if (map != null) {
			map.clear();
		}
	}
}
