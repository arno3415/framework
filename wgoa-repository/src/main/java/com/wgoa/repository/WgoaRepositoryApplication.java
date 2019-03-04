package com.wgoa.repository;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class WgoaRepositoryApplication {

	private static Logger log = LoggerFactory.getLogger(WgoaRepositoryApplication.class);

	public static void main(String[] args) {
		SpringApplication.run(WgoaRepositoryApplication.class, args);
	}
}
