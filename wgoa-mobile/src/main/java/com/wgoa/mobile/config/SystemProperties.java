package com.wgoa.mobile.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;

/**
 * Created by Administrator on 2018/9/14 0014.
 */
@Configuration
@PropertySource("classpath:messages.properties")//注意路径
public class SystemProperties {

    @Value("${project_url}")
    private String projectUrl;

    public String getProjectUrl() {
        return projectUrl;
    }

    public void setProjectUrl(String projectUrl) {
        this.projectUrl = projectUrl;
    }
}
