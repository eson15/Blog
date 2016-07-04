package ssm.blog.service;

import java.util.List;
import java.util.Map;

import ssm.blog.entity.Blog;

/**
 * @Description 博客Service接口
 * @author Ni Shengwu
 *
 */
public interface BlogService {

	public List<Blog> getBlogData();

	// 分页查询博客
	public List<Blog> listBlog(Map<String, Object> map);

	// 获取总记录数
	public Long getTotal(Map<String, Object> map);
}
