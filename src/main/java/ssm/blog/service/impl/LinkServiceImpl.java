package ssm.blog.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ssm.blog.dao.LinkDao;
import ssm.blog.entity.Link;
import ssm.blog.service.LinkService;

/**
 * @Description 友情链接Service实现类
 * @author Ni Shengwu
 *
 */
@Service("linkService")
public class LinkServiceImpl implements LinkService {

	@Resource
	private LinkDao linkDao;
	
	public List<Link> getLinkData() {
		
		return linkDao.getLinkData();
	}	

}
