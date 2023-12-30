package com.orangeBlog.common;

import lombok.Data;

import java.util.HashMap;
import java.util.Map;
@Data
public class Rvo<T> {
    private Integer code; //编码：1成功，0和其它数字为失败

    private String msg; //错误信息

    private T data; //数据

    private Map map = new HashMap(); //动态数据

    public static <T> Rvo<T> success(T object) {
        Rvo<T> r = new Rvo<T>();
        r.data = object;
        r.code = 1;
        return r;
    }

    public static <T> Rvo<T> error(String msg) {
        Rvo r = new Rvo();
        r.msg = msg;
        r.code = 0;
        return r;
    }

    public Rvo<T> add(String key, Object value) {
        this.map.put(key, value);
        return this;
    }
}
