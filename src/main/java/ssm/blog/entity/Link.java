package ssm.blog.entity;

/**
 * @Description 友情链接实体
 * @author Ni Shengwu
 *
 */
public class Link {
	
	private Integer id;
	private String linkname; //链接名称
	private String linkurl; //链接地址
	private Integer linkorder; //链接排序的序号
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getLinkname() {
		return linkname;
	}
	public void setLinkname(String linkname) {
		this.linkname = linkname;
	}
	public String getLinkurl() {
		return linkurl;
	}
	public void setLinkurl(String linkurl) {
		this.linkurl = linkurl;
	}
	public Integer getOrder() {
		return linkorder;
	}
	public void setOrder(Integer linkorder) {
		this.linkorder = linkorder;
	}

	
}
