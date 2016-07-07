package ssm.blog.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import ssm.blog.entity.Blog;
import ssm.blog.entity.PageBean;
import ssm.blog.service.BlogService;
import ssm.blog.util.PageUtil;
import ssm.blog.util.StringUtil;

/**
 * @Description 主页Controller
 * @author Ni Shengwu
 *
 */
@Controller
@RequestMapping("/")
public class IndexController {

	@Resource
	private BlogService blogService;

	/**
	 * @Description 请求主页
	 * @return
	 */
	@RequestMapping("/index")
	public ModelAndView index(
			@RequestParam(value = "page", required = false) String page,
			@RequestParam(value = "typeId", required = false) String typeId,
			@RequestParam(value = "releaseDateStr", required = false) String releaseDateStr,
			HttpServletRequest request) throws Exception {

		ModelAndView modelAndView = new ModelAndView();

		if (StringUtil.isEmpty(page)) {
			page = "1";
		}
		// 获取分页的bean
		PageBean pageBean = new PageBean(Integer.parseInt(page), 6); //每页显示6条数据

		// map中封装起始页和每页的记录
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", pageBean.getStart());
		map.put("pageSize", pageBean.getPageSize());
		map.put("typeId", typeId);
		map.put("releaseDateStr", releaseDateStr);

		// 获取博客信息
		List<Blog> blogList = blogService.listBlog(map);		

		for(Blog blog : blogList) {
			List<String> imageList = blog.getImageList();
			String blogInfo = blog.getContent(); //获取博客内容
			Document doc = Jsoup.parse(blogInfo); //将博客内容(网页中也就是一些html)转为jsoup的Document
			Elements jpgs = doc.select("img[src$=.jpg]");//获取<img>标签中所有后缀是.jpg的元素
			for(int i = 0; i < jpgs.size(); i++) {
				Element jpg = jpgs.get(i); //获取到单个元素
				imageList.add(jpg.toString()); //把图片信息存到imageList中
				if(i == 2)
					break; //只存三张图片信息
			}
		}
		
		// 分页
		StringBuffer param = new StringBuffer();
		//拼接参数，主要对于点击文章分类或者日期分类后，查出来的分页，要拼接具体的参数
		if(StringUtil.isNotEmpty(typeId)) {
			param.append("typeId=" + typeId + "&");
		}
		if(StringUtil.isNotEmpty(releaseDateStr)) {
			param.append("releaseDateStr=" + releaseDateStr + "&");
		}
		modelAndView.addObject("pageCode", PageUtil.genPagination( //调用代码生成的工具类生成前台显示
				request.getContextPath() + "/index.html", //还是请求该controller的index方法
				blogService.getTotal(map), 
				Integer.parseInt(page), 6,
				param.toString()));
		
		modelAndView.addObject("blogList", blogList);
		modelAndView.addObject("commonPage", "foreground/blog/blogList.jsp");
		modelAndView.addObject("title", "博客主页 - 倪升武的博客");
		modelAndView.setViewName("mainTemp");

		return modelAndView;

	}
}
