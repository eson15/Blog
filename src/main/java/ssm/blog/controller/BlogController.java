package ssm.blog.controller;

import java.util.Arrays;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ssm.blog.entity.Blog;
import ssm.blog.service.BlogService;
import ssm.blog.util.PageUtil;
import ssm.blog.util.StringUtil;

/**
 * @Description 博客Controller层
 * @author Ni Shengwu
 *
 */
@Controller
@RequestMapping("/blog")
public class BlogController {
	
	@Resource
	private BlogService blogService;
	
	//请求博客详细信息
	@RequestMapping("/articles/{id}")
	public ModelAndView details(@PathVariable("id") Integer id, HttpServletRequest request) {
		
		ModelAndView modelAndView = new ModelAndView();
		Blog blog = blogService.findById(id); //根据id获取博客
		
		//获取关键字
		String keyWords = blog.getKeyWord();
		if(StringUtil.isNotEmpty(keyWords)) {
			String[] strArray = keyWords.split(" ");
			List<String> keyWordsList = StringUtil.filterWhite(Arrays.asList(strArray));
			modelAndView.addObject("keyWords", keyWordsList);
		} else {
			modelAndView.addObject("keyWords", null);
		}
		
		modelAndView.addObject("blog", blog);
		blog.setClickHit(blog.getClickHit() + 1); //将博客访问量加1
		blogService.update(blog); //更新博客
		
		modelAndView.addObject("commonPage", "foreground/blog/blogDetail.jsp");
		modelAndView.addObject("title", blog.getTitle() + " - 倪升武的博客");
		
		//存入上一篇和下一篇的显示代码
		modelAndView.addObject("pageCode", PageUtil.getPrevAndNextPageCode(
				blogService.getPrevBlog(id), 
				blogService.getNextBlog(id), 
				request.getServletContext().getContextPath()));
		
		modelAndView.setViewName("mainTemp");
		
		return modelAndView;
	}

}
