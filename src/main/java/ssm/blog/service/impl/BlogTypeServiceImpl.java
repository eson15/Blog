package ssm.blog.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ssm.blog.dao.BlogTypeDao;
import ssm.blog.entity.BlogType;
import ssm.blog.service.BlogTypeService;

/**
 * @Description 博客类别Service实现类
 * @author Ni Shengwu
 *
 */
@Service("blogTypeService")
public class BlogTypeServiceImpl implements BlogTypeService {
	
	@Resource
	private BlogTypeDao blogTypeDao;

	//获取博客类别信息
	public List<BlogType> getBlogTypeData() {
		
		return blogTypeDao.getBlogTypeData();
	}

}
