package com.wgoa.quartz;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.EnableAspectJAutoProxy;

@SpringBootApplication
@ComponentScan(value = "com.wgoa")
@EnableAspectJAutoProxy
public class WgoaQuartzApplication {

	public static void main(String[] args) {
		SpringApplication.run(WgoaQuartzApplication.class, args);
	}

}

