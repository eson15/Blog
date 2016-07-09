package ssm.blog.controller.admin;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import ssm.blog.entity.Blog;
import ssm.blog.service.BlogService;
import ssm.blog.util.ResponseUtil;

/**
 * @Description 管理员博客Controller层
 * @author Ni Shengwu
 *
 */
@Controller
@RequestMapping("/admin/blog")
public class BlogAdminController {

	@Resource
	private BlogService blogService;
	
	@RequestMapping("/save")
	public String save(Blog blog, HttpServletResponse response) throws Exception {
		
		int resultTotal = 0; //接收返回结果记录数
		if(blog.getId() == null) { //说明是第一次插入
			resultTotal = blogService.addBlog(blog);
		} else {
			
		}
		
		JSONObject result = new JSONObject();
		if(resultTotal > 0) {
			result.put("success", true);
		} else {
			result.put("success", false);
		}
		ResponseUtil.write(response, result);
		return null;
	}
}
