package ssm.blog.dao;

import java.util.List;
import java.util.Map;

import ssm.blog.entity.Comment;

/**
 * @Description 评论dao接口
 * @author Ni Shengwu
 *
 */
public interface CommentDao {

	// 获取评论信息
	public List<Comment> getCommentData(Map<String, Object> map);
	
	// 添加评论
	public int addComment(Comment comment);
}
