package com.test.spboot;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan
public class SpbootApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpbootApplication.class, args);
	}

}
