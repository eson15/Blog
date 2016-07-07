package ssm.blog.entity;

import java.util.Date;

/**
 * @Description 评论实体
 * @author Ni Shengwu
 *
 */
public class Comment {

	private Integer id;
	private String userIp; //评论用户的ip
	private String content; //评论内容
	private Date commentDate; //评论日期
	private Integer state; //审核状态，0待审核 1审核通过 2未通过
	private Blog blog; //关联的博客
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUserIp() {
		return userIp;
	}
	public void setUserIp(String userIp) {
		this.userIp = userIp;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getCommentDate() {
		return commentDate;
	}
	public void setCommentDate(Date commentDate) {
		this.commentDate = commentDate;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	public Blog getBlog() {
		return blog;
	}
	public void setBlog(Blog blog) {
		this.blog = blog;
	}

}
