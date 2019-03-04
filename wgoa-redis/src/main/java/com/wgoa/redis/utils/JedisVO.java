package com.wgoa.redis.utils;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @Author Arno
 * @Date 2019/1/25 13:43
 * @Version 1.0
 **/
@Data
@NoArgsConstructor
@AllArgsConstructor
public class JedisVO {

    private String jedisHost;
    private Integer jedisPort;
    private String jedisPassword;
}
