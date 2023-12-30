package com.orangeBlog.config;

import com.orangeBlog.common.JacksonObjectMapper;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.util.List;

@Configuration
public class MvcConfig implements WebMvcConfigurer {

    @Value("${upload.path}") // 从配置文件中读取上传路径
    private String uploadPath;

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        //图片上传
        registry.addResourceHandler("/image/**")//对应虚拟访问路径
                .addResourceLocations(uploadPath);//实际路径
//                .addResourceLocations("file:/www/wwwroot/image/");//实际路径

    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new MyInterceptor())
                .excludePathPatterns("/user/login", "/user/logout", "/user/register") // 排除登录和退出请求
                .addPathPatterns("/article/edit")
                .addPathPatterns("/userfoot/like")
                .addPathPatterns("/userfoot/comment"); // 拦截其他请求
    }

    @Override
    public void extendMessageConverters(List<HttpMessageConverter<?>> converters) {

        MappingJackson2HttpMessageConverter messageConverter=new MappingJackson2HttpMessageConverter();

        messageConverter.setObjectMapper(new JacksonObjectMapper());
        //设置优先级
        converters.add(0,messageConverter);
    }
}

