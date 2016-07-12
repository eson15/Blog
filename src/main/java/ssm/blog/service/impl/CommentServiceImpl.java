package ssm.blog.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ssm.blog.dao.CommentDao;
import ssm.blog.entity.Comment;
import ssm.blog.service.CommentService;

/**
 * @Description 用户评论service实现类
 * @author Ni Shengwu
 *
 */
@Service("commentService")
public class CommentServiceImpl implements CommentService {
	
	@Resource
	private CommentDao commentDao;

	public List<Comment> getCommentData(Map<String, Object> map) {
		return commentDao.getCommentData(map);
	}

	public int addComment(Comment comment) {
		return commentDao.addComment(comment);
	}

	public Long getTotal(Map<String, Object> map) {
		return commentDao.getTotal(map);
	}

	public Integer update(Comment comment) {
		return commentDao.update(comment);
	}

	public Integer deleteComment(Integer id) {
		return commentDao.deleteComment(id);
	}

	public Integer deleteCommentByBlogId(Integer blogId) {
		return commentDao.deleteCommentByBlogId(blogId);
	}

}
