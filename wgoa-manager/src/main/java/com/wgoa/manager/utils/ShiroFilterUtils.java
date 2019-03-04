package com.wgoa.manager.utils;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

/**
 * shiro工具类
 * @Author Arno
 * @Date 2018/12/26 19:01
 * @Version 1.0
 **/
public class ShiroFilterUtils {
    private static final Logger logger = LoggerFactory
            .getLogger(ShiroFilterUtils.class);
    private final static ObjectMapper objectMapper = new ObjectMapper();

    /**
     * 验证前端请求类型
     * @param request
     * @return
     */
    public static boolean isAjax(ServletRequest request){
        String header = ((HttpServletRequest) request).getHeader("X-Requested-With");
        if("XMLHttpRequest".equalsIgnoreCase(header)){
            logger.debug("shiro工具类【manager-->ShiroFilterUtils.isAjax】当前请求,为Ajax请求");
            return Boolean.TRUE;
        }
        logger.debug("shiro工具类【manager-->ShiroFilterUtils.isAjax】当前请求,非Ajax请求");
        return Boolean.FALSE;
    }
}
