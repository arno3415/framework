package com.wgoa.manager.controller;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

/**
  * 页面跳转Controller
  *@Author Arno
  *@Date 2019/1/25 9:19
  *@Version 1.0
  **/
@Api(value = "页面跳转")
@Controller
@RequestMapping("page")
public class PageController {

	private static final Logger LOGGER = LoggerFactory.getLogger(PageController.class);

	@RequestMapping(value = "{page}",method = RequestMethod.GET)
	@ApiImplicitParam(name = "page",paramType = "path" , value = "页面名称", required = true, dataType = "String")
	public String toPage(@PathVariable("page") String page) {
		return page;
	}

	@RequestMapping(value = "{module}/{page}",method = RequestMethod.GET)
	@ApiImplicitParams({
			@ApiImplicitParam(name = "module",paramType = "path" , value = "页面目录", required = true, dataType = "String"),
			@ApiImplicitParam(name = "page",paramType = "path" , value = "页面名称", required = true, dataType = "String")
	})
	public String toModulePage(@PathVariable("module") String module, @PathVariable("page") String page) {
		return module + "/" + page;
	}

	@RequestMapping(value = "{module1}/{module2}/{page}",method = RequestMethod.GET)
	@ApiImplicitParams({
			@ApiImplicitParam(name = "module1",paramType = "path" , value = "页面目录1", required = true, dataType = "String"),
			@ApiImplicitParam(name = "module2",paramType = "path" , value = "页面目录2", required = true, dataType = "String"),
			@ApiImplicitParam(name = "page",paramType = "path" , value = "页面名称", required = true, dataType = "String")
	})
	public String toModulePages(@PathVariable("module1") String module1, @PathVariable("module2") String module2,
                                @PathVariable("page") String page) {
		return module1 + "/" + module2 + "/" + page;
	}

	@RequestMapping(value = "{module1}/{module2}/{module3}/{page}",method = RequestMethod.GET)
	@ApiImplicitParams({
			@ApiImplicitParam(name = "module1",paramType = "path" , value = "页面目录1", required = true, dataType = "String"),
			@ApiImplicitParam(name = "module2",paramType = "path" , value = "页面目录2", required = true, dataType = "String"),
			@ApiImplicitParam(name = "module3",paramType = "path" , value = "页面目录3", required = true, dataType = "String"),
			@ApiImplicitParam(name = "page",paramType = "path" , value = "页面名称", required = true, dataType = "String")
	})
	public String toModulesPages(@PathVariable("module1") String module1, @PathVariable("module2") String module2,
                                 @PathVariable("module3") String module3, @PathVariable("page") String page) {
		return module1 + "/" + module2 + "/" + module3 + "/" + page;
	}

	@GetMapping("/login")
	public String login(HttpServletRequest request) {
//		LOGGER.info("跳到这边的路径为:" + request.getRequestURI());
		Subject s = SecurityUtils.getSubject();
//		LOGGER.info("是否记住登录--->" + s.isRemembered() + "<-----是否有权限登录----->" + s.isAuthenticated() + "<----");
		if (s.isAuthenticated()) {
			return "redirect:index";
		} else {
			return "login";
		}
	}
}
