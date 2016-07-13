package ssm.blog.service.impl;

import java.util.List;
import java.util.Map;

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
	
	public List<Link> listLinkData(Map<String, Object> map) {		
		return linkDao.listLinkData(map);
	}

	public Long getTotal(Map<String, Object> map) {
		return linkDao.getTotal(map);
	}

	public Integer addLink(Link link) {
		return linkDao.addLink(link);
	}

	public Integer updateLink(Link link) {
		return linkDao.updateLink(link);
	}

	public Integer deleteLink(Integer id) {
		return linkDao.deleteLink(id);
	}

}
