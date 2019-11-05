package com.ms;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * @Classname MsApplication
 * @Description TODO
 * @Author xiedong
 * @Date 2019/11/5 8:55
 * @Version 1.0
 **/
@SpringBootApplication
@MapperScan(basePackages= {"com.*.mapper"})
public class MsApplication {
    public static void main(String[] args) {
        SpringApplication.run(MsApplication.class,args);
    }
}
