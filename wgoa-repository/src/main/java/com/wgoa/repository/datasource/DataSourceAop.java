package com.wgoa.repository.datasource;

import org.apache.log4j.Logger;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

/**
  * 动态切换数据源
  *@Author Arno
  *@Date 2019/1/23 15:59
  *@Version 1.0
  **/
@Aspect
@Component
public class DataSourceAop {

    private static Logger log = Logger.getLogger(DataSourceAop.class);

    /**
     * 查询切换-读库
     */
    @Before("execution(* com.wgoa.repository.repo..*.select*(..)) " +
            "|| execution(* com.wgoa.repository.repo..*.find*(..)) " +
            "|| execution(* com.wgoa.repository.repo..*.get*(..)) " +
            "|| execution(* com.wgoa.repository.repo..*.query*(..))" +
            "|| execution(* com.wgoa.repository.repo..*.list*(..))" +
            "|| execution(* com.wgoa.repository.repo..*.login*(..))")
    public void setReadDataSourceType() {
        DataSourceContextHolder.read();
        log.info("dataSource切换到：Read");
    }

    /**
     * 插入更新切换-写库
     */
    @Before("execution(* com.wgoa.repository.repo..*.insert*(..)) " +
            "|| execution(* com.wgoa.repository.repo..*.delete*(..)) " +
            "|| execution(* com.wgoa.repository.repo..*.update*(..))")
    public void setWriteDataSourceType() {
        DataSourceContextHolder.write();
        log.info("dataSource切换到：write");
    }
}
