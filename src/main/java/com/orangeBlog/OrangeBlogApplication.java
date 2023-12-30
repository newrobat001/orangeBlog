package com.orangeBlog;

import lombok.extern.slf4j.Slf4j;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import javax.sound.sampled.Port;

@Slf4j
@SpringBootApplication
@MapperScan("com.orangeBlog.mapper")
public class OrangeBlogApplication {

    public static void main(String[] args) {
        SpringApplication.run(OrangeBlogApplication.class, args);
        log.info("首页：http://localhost:"+ 8088 +"/index");
    }

}
