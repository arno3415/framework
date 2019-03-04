package com.wgoa.mobile.interceptor;

import com.wgoa.mobile.config.SystemProperties;
import com.wgoa.repository.domain.DemoUser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * 登录拦截器
 * 
 */
@Component
public class LoginInterceptor implements HandlerInterceptor {

	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);

	@Resource
	SystemProperties systemProperties;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		DemoUser administrator = (DemoUser) request.getSession().getAttribute("admin");
		logger.info("LoginInterceptor admin:" + administrator);
		if (null == administrator) {
			if (request.getHeader("x-requested-with") != null
					&& request.getHeader("x-requested-with").equals("XMLHttpRequest")) {
				response.setStatus(911);// 表示session timeout
			} else {
				response.sendRedirect(systemProperties.getProjectUrl() + request.getContextPath() + "/page/login");
			}
			return false;
		}

		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
                           ModelAndView modelAndView) throws Exception {
		
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {

	}

}
