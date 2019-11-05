package com.ms;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;

/**
 * @Classname MsApplication
 * @Description TODO
 * @Author xiedong
 * @Date 2019/11/5 8:55
 * @Version 1.0
 **/
@SpringBootApplication(exclude = {SecurityAutoConfiguration.class})
@MapperScan(basePackages= {"com.*.mapper"})
public class MsApplication {
    public static void main(String[] args) {
        SpringApplication.run(MsApplication.class,args);
    }
}
