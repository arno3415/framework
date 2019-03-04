package com.wgoa.mobile.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 页面跳转Controller
 *
 */
@Controller
@RequestMapping("page")
public class PageController {

	@RequestMapping("{page}")
	public String toPage(@PathVariable("page") String page) {
		return page;
	}

	@RequestMapping("{module}/{page}")
	public String toModulePage(@PathVariable("module") String module, @PathVariable("page") String page) {
		return module + "/" + page;
	}

	@RequestMapping("{module1}/{module2}/{page}")
	public String toModulePages(@PathVariable("module1") String module1, @PathVariable("module2") String module2,
                                @PathVariable("page") String page) {
		return module1 + "/" + module2 + "/" + page;
	}
	@RequestMapping("{module1}/{module2}/{module3}/{page}")
	public String toModulesPages(@PathVariable("module1") String module1, @PathVariable("module2") String module2,
                                 @PathVariable("module3") String module3, @PathVariable("page") String page) {
		return module1 + "/" + module2 + "/" + module3 + "/" + page;
	}
}
