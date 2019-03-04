package com.wgoa.manager.config;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

/**
 * application文件属性
 * @Author Arno
 * @Date 2019/1/25 14:46
 * @Version 1.0
 **/
@Component
@Data
@NoArgsConstructor
@AllArgsConstructor
public class ComponentProperties {

    /**redis属性**/
    @Value("${spring.redis.host}")
    private String jedisHost;

    @Value("${spring.redis.port}")
    private Integer jedisPort;

    @Value("${spring.redis.password}")
    private String jedisPassword;

    
}
