package ssm.blog.dao;

import java.util.List;

import ssm.blog.entity.Link;

/**
 * @Description 友情链接dao接口
 * @author Ni Shengwu
 *
 */
public interface LinkDao {
	
	//获取友情链接
	public List<Link> getLinkData();
}
