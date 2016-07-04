package ssm.blog.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ssm.blog.dao.BlogDao;
import ssm.blog.entity.Blog;
import ssm.blog.service.BlogService;

/**
 * @Description 博客Service实现类
 * @author Ni Shengwu
 *
 */
@Service("blogService")
public class BlogServiceImpl implements BlogService {

	@Resource
	private BlogDao blogDao;
	
	public List<Blog> getBlogData() {

		return blogDao.getBlogData();
	}

}
