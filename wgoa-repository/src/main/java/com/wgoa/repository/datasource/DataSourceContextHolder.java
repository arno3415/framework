package com.wgoa.repository.datasource;

import com.wgoa.repository.enums.DataSourceEnums;
import org.apache.log4j.Logger;

/**
  * 数据源切换
  *@Author Arno
  *@Date 2019/1/23 16:02
  *@Version 1.0
  **/
public class DataSourceContextHolder {

    private static Logger log = Logger.getLogger(DataSourceContextHolder.class);

    private static final ThreadLocal<String> local = new ThreadLocal<String>();

    public static ThreadLocal<String> getLocal() {
        return local;
    }

    /**
     * 读可能是多个库
     */
    public static void read() {
        log.debug("readreadread");
        local.set(DataSourceEnums.read.getType());
    }

    /**
     * 写只有一个库
     */
    public static void write() {
        log.debug("writewritewrite");
        local.set(DataSourceEnums.write.getType());
    }

    public static String getJdbcType() {
        return local.get();
    }
}
