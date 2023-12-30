package com.orangeBlog.common;

public class BaseContext {
    private static ThreadLocal<Long> threadLocal=new InheritableThreadLocal<>();

    public static void setCurrentId(Long id){
        threadLocal.set(id);
    }

    public static Long getCurrentId(){
        return threadLocal.get();
    }
}
