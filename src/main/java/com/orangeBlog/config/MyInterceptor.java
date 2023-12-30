package com.orangeBlog.config;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@Slf4j
public class MyInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        // 在请求处理之前进行拦截操作
        // 这里可以检查用户是否登录，如果未登录可以重定向到登录页面

        // 获取请求的路径
        String requestURI = request.getRequestURI();

        // 排除登录和退出请求
        if (!requestURI.contains("/user/login")
                && !requestURI.contains("/user/logout")) {
            Object user = request.getSession().getAttribute("user");
            if (user != null) return true;
            // 示例：重定向到登录页
            response.sendRedirect("/user/login");
            return false;
        }

        // 放行其他请求
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        // 请求处理之后，渲染视图之前调用
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        // 整个请求处理完毕后调用，通常用于资源清理操作
    }
}
