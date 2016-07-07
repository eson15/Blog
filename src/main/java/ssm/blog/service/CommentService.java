package ssm.blog.service;

import java.util.List;
import java.util.Map;

import ssm.blog.entity.Comment;

/**
 * @Description 用户评论service接口
 * @author Ni Shengwu
 *
 */
public interface CommentService {

	// 获取评论信息
	public List<Comment> getCommentData(Map<String, Object> map);

	// 添加评论
	public int addComment(Comment comment);
}
