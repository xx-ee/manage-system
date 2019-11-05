package com.ms.config;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @Classname： ObjectMapperUtil
 * @Description：ObjectMapper
 * @Author： xiedong
 * @Date： 2019/11/5 15:46
 * @Version： 1.0
 **/
@Configuration
public class ObjectMapperUtil
{
    //jackson xml util
    @Bean
    public ObjectMapper objectMapper(){
        return new ObjectMapper();
    }
}
