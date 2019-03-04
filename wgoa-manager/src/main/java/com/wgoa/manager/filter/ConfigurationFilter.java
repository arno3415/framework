package com.wgoa.manager.filter;

import org.apache.catalina.filters.RemoteIpFilter;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.servlet.*;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
  *解决跨域的问题
  *@Author Arno
  *@Date 2019/1/25 14:51
  *@Version 1.0
  **/
@Configuration
public class ConfigurationFilter {

    @Bean
    public RemoteIpFilter remoteIpFilter() {
        return new RemoteIpFilter();
    }

    @Bean
    public FilterRegistrationBean testFilterRegistration() {
        FilterRegistrationBean registration = new FilterRegistrationBean();
        registration.setFilter(new MyFilter());//添加过滤器
        registration.addUrlPatterns("/*");//设置过滤路径，/*所有路径
        registration.addInitParameter("name", "alue");//添加默认参数
        registration.setName("MyFilter");//设置优先级
        registration.setOrder(1);//设置优先级
        return registration;
    }

    public class MyFilter implements Filter {
        @Override
        public void destroy() {
        }

        @Override
        public void doFilter(ServletRequest srequest, ServletResponse sresponse, FilterChain
                filterChain)
                throws IOException, ServletException {
            HttpServletResponse res = (HttpServletResponse) sresponse;
            res.setHeader("Access-Control-Allow-Origin", "*");

            //res.setHeader("Access-Control-Allow-Origin", "http://127.0.0.1:5240");

            res.setHeader("Access-Control-Allow-Headers","x-requested-with");
            res.setHeader("Access-Control-Max-Age","86400");
            res.setHeader("Access-Control-Allow-Credentials","true");
            res.setHeader("Access-Control-Allow-Methods","GET, POST, PUT, DELETE, OPTIONS");
            res.setHeader("Access-Control-Allow-Headers","x-requested-with,content-type");
            res.setHeader("Access-Control-Allow-Headers","Origin, No-Cache, X-Requested-With, If-Modified-Since, Pragma, Last-Modified, Cache-Control, Expires, Content-Type, X-E4M-With");

            filterChain.doFilter(srequest, res);
        }

        @Override
        public void init(FilterConfig arg0) throws ServletException {
        }
    }
}
