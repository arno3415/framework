package com.wg.commons.generator;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
  *
  *@Author Arno
  *@Date 2019/3/4 16:01
  *@Version 1.0
  **/
@SpringBootApplication
@MapperScan("com.github.wxiaoqi.security.generator.mapper")
public class GeneratorBootstrap {
    public static void main(String[] args) {
        SpringApplication.run(GeneratorBootstrap.class, args);
    }
}
