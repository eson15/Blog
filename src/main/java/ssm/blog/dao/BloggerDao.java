package ssm.blog.dao;

import ssm.blog.entity.Blogger;

/**
 * @Description 博主dao接口
 * @author Ni Shengwu
 *
 */
public interface BloggerDao {
	
	//通过用户名查询用户
	public Blogger getByUsername(String username);
}
