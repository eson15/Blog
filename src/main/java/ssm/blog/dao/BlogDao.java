package ssm.blog.dao;

import java.util.List;

import ssm.blog.entity.Blog;

/**
 * @Description 博客Dao接口
 * @author Ni Shengwu
 *
 */
public interface BlogDao {
	
	//获取博客信息，根据日期月份分组查询
	public List<Blog> getBlogData();
}
