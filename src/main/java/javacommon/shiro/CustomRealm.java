package javacommon.shiro;

import java.sql.SQLException;
import java.util.Arrays;
import java.util.Collection;

import javax.annotation.Resource;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.aop.ThrowsAdvice;

import com.bm.gjb5.model.RightsRole;
import com.bm.gjb5.model.RightsUser;
import com.bm.gjb5.service.RightsUserManager;

public class CustomRealm extends AuthorizingRealm {

	/**
	 * 鉴权回调函数，提取当事人的角色和权限 principals 当事人
	 */
	protected AuthorizationInfo doGetAuthorizationInfo(
			PrincipalCollection principals) {
		// 用户名
		String username = (String) principals.fromRealm(getName()).iterator()
				.next();
		SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
		try {
			/* String roleName = getRoleName(username);//获取角色名
			 SimpleRole simpleRole = getRole(roleName);//加载ini中的角色和权限
			 info.addObjectPermissions(simpleRole.getPermissions());
			 info.addStringPermission("/pages/NB.jsp");
			 info.addStringPermission("/pages/User/create.jsp");
			 info.addStringPermission("pages:NB");
			 info.addStringPermission("pages:User:*");*/
			//添加权限字符串,可能是多个,号分隔的
			RightsRole role = getRole(username);
			Collection<String> permissions = Arrays.asList(role.getPerm().split(","));
			info.addStringPermissions(permissions );
			info.addRole(role.getName());
			return info;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	/**
	 * 登录验证
	 */
	protected AuthenticationInfo doGetAuthenticationInfo(
			AuthenticationToken authcToken) throws AuthenticationException {
		// 令牌——基于用户名和密码的令牌
		UsernamePasswordToken token = (UsernamePasswordToken) authcToken;
		// 令牌中可以取出用户名
		String accountName = token.getUsername();
		String password = getPassword(accountName);
		/* 此处无需比对，比对的逻辑Shiro会做，我们只需返回一个和令牌相关的正确的验证信息 */
		return new SimpleAuthenticationInfo(accountName, password, getName());
	}

	private String getPassword(String accountName) {
		RightsUser user = rightsUserManager.findByUsername(accountName);
		if(user.getStatus()==0)
			throw new AuthenticationException("账号已经过期");
		return user.getPassword();
	}

	/**
	 * 获取权限字符串
	 * 
	 * @param username
	 *            用户名
	 * @return 权限字符串
	 * @throws SQLException
	 */
	private String getPermissionFromAccountName(String username)
			throws SQLException {
		return getRole(username).getPerm();
	}

	private RightsRole getRole(String username) throws SQLException {
		RightsUser user = rightsUserManager.findByUsername(username);
		return user.getRightsRole();
	}

	private RightsUserManager rightsUserManager;

	@Resource
	public void setRightsUserManager(RightsUserManager rightsUserManager) {
		this.rightsUserManager = rightsUserManager;
	}
}
