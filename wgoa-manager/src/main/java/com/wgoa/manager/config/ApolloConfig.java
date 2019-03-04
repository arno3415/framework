package com.wgoa.manager.config;

import com.ctrip.framework.apollo.spring.annotation.EnableApolloConfig;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;

/**
  *指示Apollo注入Redis和Jdbc、Swagger namespace的配置到Spring环境中
  *@Author Arno
  *@Date 2019/2/27 14:18
  *@Version 1.0
  **/
@Configuration
@EnableApolloConfig({"Jdbc", "Redis", "Swagger"})
@Order(1)
public class ApolloConfig {


    private static final Logger LOGGER = LogManager.getLogger(ApolloConfig.class);


}
