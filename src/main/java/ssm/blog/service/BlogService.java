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

	// 根据id获取博客
	public Blog findById(Integer id);

	// 更新博客信息
	public Integer update(Blog blog);
	
	// 获取上一篇博客
	public Blog getPrevBlog(Integer id);

	// 获取下一篇一篇博客
	public Blog getNextBlog(Integer id);
}
