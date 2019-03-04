package com.wgoa.manager.filter;

import com.dianping.cat.servlet.CatFilter;
import org.apache.catalina.filters.RemoteIpFilter;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;

import javax.servlet.annotation.WebFilter;

/**
  *Cat MVC过滤器
  *@Author Arno
  *@Date 2019/1/25 14:51
  *@Version 1.0
  **/
@Component
@WebFilter(filterName = "xssFilter", urlPatterns = "/*", asyncSupported = true)
public class CatMvcFilter {

    @Bean
    public RemoteIpFilter remoteIpFilter() {
        return new RemoteIpFilter();
    }

    @Bean
    public FilterRegistrationBean testFilterRegistration() {
        FilterRegistrationBean registration = new FilterRegistrationBean();
        registration.setFilter(new CatFilter());//添加过滤器
        registration.addUrlPatterns("/*");//设置过滤路径，/*所有路径
        registration.addInitParameter("name", "cat-filter");//添加默认参数
        registration.setName("cat-filter");
        registration.setOrder(1);//设置优先级
        return registration;
    }

}
