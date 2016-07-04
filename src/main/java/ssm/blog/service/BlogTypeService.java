package ssm.blog.service;

import java.util.List;

import ssm.blog.entity.BlogType;

/**
 * @Description 博客类别Service接口
 * @author Ni Shengwu
 *
 */
public interface BlogTypeService {
	
	public List<BlogType> getBlogTypeData();
}
