package ssm.blog.service;

import java.util.List;

import ssm.blog.entity.Link;

/**
 * @Description 友情链接Service接口
 * @author Ni Shengwu
 *
 */
public interface LinkService {
	
	public List<Link> getLinkData();
}
