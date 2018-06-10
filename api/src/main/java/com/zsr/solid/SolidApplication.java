package com.zsr.solid;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;


@SpringBootApplication
@ServletComponentScan
@MapperScan("com.zsr.solid.mapper")
public class SolidApplication {

    public static void main(String[] args) {
        SpringApplication.run(SolidApplication.class, args);
    }
}
