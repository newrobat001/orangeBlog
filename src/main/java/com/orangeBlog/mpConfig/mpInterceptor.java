package com.orangeBlog.mpConfig;

import com.baomidou.mybatisplus.extension.plugins.MybatisPlusInterceptor;
import com.baomidou.mybatisplus.extension.plugins.inner.PaginationInnerInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class mpInterceptor {

    @Bean
    MybatisPlusInterceptor getMybatisPlusInterceptor(){
        MybatisPlusInterceptor mp=new MybatisPlusInterceptor();
        //分页拦截器
        mp.addInnerInterceptor(new PaginationInnerInterceptor());

        return mp;
    }
}
