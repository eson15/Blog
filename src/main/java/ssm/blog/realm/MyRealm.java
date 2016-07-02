package ssm.blog.realm;

import javax.annotation.Resource;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;

import ssm.blog.entity.Blogger;
import ssm.blog.service.BloggerService;

/**
 * @Description 自定义realm
 * @author Ni Shengwu
 *
 */
public class MyRealm extends AuthorizingRealm {

	@Resource
	private BloggerService bloggerService;

	/**
	 * 为当前登陆的用户授予角色和权限
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(
			PrincipalCollection principals) {
		// 这个个人博客项目是没有这一项的，因为就一个用户
		return null;
	}

	/**
	 * 对前登陆的用户进行身份认证
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(
			AuthenticationToken token) throws AuthenticationException {

		String username = (String) token.getPrincipal(); // 获取用户名
		Blogger blogger = bloggerService.getByUsername(username); // 根据用户名从数据库中查询出博主信息

		if (blogger != null) {
			SecurityUtils.getSubject().getSession().setAttribute("currentUser", blogger);//把当前用户存到session中
			AuthenticationInfo authcInfo = new SimpleAuthenticationInfo(
					blogger.getUsername(), blogger.getPassword(), "MyRealm");
			return authcInfo;
		} else {
			return null;
		}

	}

}
