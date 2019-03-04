package com.wgoa.manager.config;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;

/**
  * properties配置文件属性
  *@Author Arno
  *@Date 2019/1/27 22:12
  *@Version 1.0
  **/
@Configuration
@Data
@NoArgsConstructor
@AllArgsConstructor
@PropertySource("classpath:messages.properties")//注意路径
public class SystemProperties {

    @Value("${project_url}")
    private String projectUrl;

}
