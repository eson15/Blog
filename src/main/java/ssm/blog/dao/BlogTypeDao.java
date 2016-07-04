package ssm.blog.dao;

import java.util.List;

import ssm.blog.entity.BlogType;

/**
 * @Description 博客类别dao接口
 * @author Ni Shengwu
 *
 */
public interface BlogTypeDao {

	//获取博客类别信息
	public List<BlogType> getBlogTypeData();
}
