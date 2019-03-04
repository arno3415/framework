package com.wgoa.quartz.config;

import com.wgoa.quartz.component.XxlJobConfigBean;
import com.xxl.job.core.executor.XxlJobExecutor;
import com.xxl.job.core.executor.impl.XxlJobSpringExecutor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
  * 初始化xxl-job
  *@Author Arno
  *@Date 2019/2/20 15:46
  *@Version 1.0
  **/
@Configuration
public class XxlJobConfig {

    private Logger logger = LoggerFactory.getLogger(XxlJobConfig.class);


    @Autowired
    XxlJobConfigBean xxlJobConfigBean;

    @Bean(initMethod = "start", destroyMethod = "destroy")
    public XxlJobExecutor xxlJobExecutor() {
        logger.info(">>>>>>>>>>> xxl-job config init.");
        XxlJobSpringExecutor xxlJobExecutor = new XxlJobSpringExecutor();
        xxlJobExecutor.setAdminAddresses(xxlJobConfigBean.getAdminAddresses());
        xxlJobExecutor.setAppName(xxlJobConfigBean.getAppName());
        xxlJobExecutor.setIp(xxlJobConfigBean.getIp());
        xxlJobExecutor.setPort(xxlJobConfigBean.getPort());
        xxlJobExecutor.setAccessToken(xxlJobConfigBean.getAccessToken());
        xxlJobExecutor.setLogPath(xxlJobConfigBean.getLogPath());
        xxlJobExecutor.setLogRetentionDays(xxlJobConfigBean.getLogRetentionDays());
        return xxlJobExecutor;
    }


}
