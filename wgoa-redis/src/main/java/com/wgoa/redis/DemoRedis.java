package com.wgoa.redis;

import com.wgoa.redis.operation.JedisStrings;
import com.wgoa.redis.utils.JedisVO;

/**
 * 示例redis
 * @Author Arno
 * @Date 2019/1/25 13:41
 * @Version 1.0
 **/
public class DemoRedis {

    public static void main(String[] args) {
        //字符串
        JedisStrings strings = new JedisStrings(new JedisVO("192.168.50.54",6378,"pwd@123"));
        strings.set("nnn", "nnnn");
        System.out.println("-----"+strings.get("nnn"));


    }
}
