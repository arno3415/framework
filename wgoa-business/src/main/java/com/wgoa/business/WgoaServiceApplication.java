package com.wgoa.business;

import com.wgoa.repository.WgoaRepositoryApplication;
import org.mybatis.spring.annotation.MapperScan;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;


@SpringBootApplication(scanBasePackages="com.wgoa")
@MapperScan("com.wgoa.repository.repo*")
public class WgoaServiceApplication {

	private static Logger log = LoggerFactory.getLogger(WgoaRepositoryApplication.class);

	public static void main(String[] args) {
		SpringApplication.run(WgoaServiceApplication.class, args);
	}
}
