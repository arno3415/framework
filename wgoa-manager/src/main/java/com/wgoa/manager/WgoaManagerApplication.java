package com.wgoa.manager;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.support.SpringBootServletInitializer;

@SpringBootApplication(scanBasePackages="com.wgoa")
@MapperScan("com.wgoa.repository.repo*")
public class WgoaManagerApplication extends SpringBootServletInitializer {

	public static void main(String[] args) {
		SpringApplication.run(WgoaManagerApplication.class, args);
	}
}
