package com.orangeBlog.filter;

import com.alibaba.fastjson.JSON;
import com.orangeBlog.common.BaseContext;
import com.orangeBlog.common.Rvo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.util.AntPathMatcher;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Slf4j
@WebFilter(filterName = "loginCheckFilter",urlPatterns = "/*")
public class loginCheckFilter implements Filter {
    //开启通配符
    public static final AntPathMatcher PATH_MATCHER=new AntPathMatcher();

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {


        HttpServletRequest request=(HttpServletRequest) servletRequest;
        HttpServletResponse response=(HttpServletResponse) servletResponse;
        log.info("拦截到：{}",request.getRequestURI());


        //获取uri
        String requestURI=request.getRequestURI();
        //过滤器白名单
        String[] urls={
                "/static/**",
                "/user/login",
                "/user/logout",
        };
        //检查是否需要处理
        boolean check = check(urls, requestURI);

        //不需要处理
        if (check){
            filterChain.doFilter(request,response);
            return;
        }

        //后台登陆
        Long id = (Long) request.getSession().getAttribute("employee");

        if (id != null){
            BaseContext.setCurrentId(id);
            filterChain.doFilter(request,response);
            return;
        }

        //前台登录
        if(request.getSession().getAttribute("user") != null){
            log.info("用户已登录，用户id为：{}",request.getSession().getAttribute("user"));

            Long userId = (Long) request.getSession().getAttribute("user");
            BaseContext.setCurrentId(userId);

            filterChain.doFilter(request,response);
            return;
        }

        //未登录则返回未登录结果
        response.getWriter().write(JSON.toJSONString(Rvo.error("NOLOGIN")));
        return;
    }

    //检查是否有冲突
    public boolean check(String[] urls ,String uri){
        for (String url :
                urls) {
            boolean match = PATH_MATCHER.match(url, uri);
            if (match)
                return true;
        }
        return false;
    }
}
