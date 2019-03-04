package com.wgoa.manager.filter;

import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
  *
  *@Author Arno
  *@Date 2019/2/1 9:20
  *@Version 1.0
  **/
public class CaptchaFormAuthenticationFilter extends FormAuthenticationFilter {
    /**
     * 覆盖默认实现，用sendRedirect直接跳出框架，以免造成js框架重复加载js出错。
     * @param token
     * @param subject
     * @param request
     * @param response
     * @return
     * @throws Exception
     * @see FormAuthenticationFilter#onLoginSuccess(AuthenticationToken, Subject, ServletRequest, ServletResponse)
     */
    @Override
    protected boolean onLoginSuccess(AuthenticationToken token, Subject subject,
                                     ServletRequest request, ServletResponse response) throws Exception {
        //issueSuccessRedirect(request, response);
        //we handled the success redirect directly, prevent the chain from continuing:
        HttpServletRequest httpServletRequest = (HttpServletRequest)request;
        HttpServletResponse httpServletResponse = (HttpServletResponse)response;
        httpServletResponse.sendRedirect(httpServletRequest.getContextPath() + this.getSuccessUrl());

        return true;
    }
}