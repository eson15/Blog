package ssm.blog.controller;


import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import ssm.blog.service.BloggerService;

/**
 * @Description 博主Controller层，前台部分，不需要认证
 * @author Ni Shengwu
 *
 */
@Controller
@RequestMapping("/blogger")
public class BloggerController {
	
	@Resource
	private BloggerService bloggerService;
}
