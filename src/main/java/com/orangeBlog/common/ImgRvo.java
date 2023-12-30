package com.orangeBlog.common;

import lombok.Data;
import org.springframework.beans.factory.annotation.Value;

@Data
public class ImgRvo {
    private int success;
    private String message;
    private String url;

    public ImgRvo(int success, String message, String url) {
        this.success = success;
        this.message = message;
        this.url = url;
    }

    public static ImgRvo success(String url){
//        return new ImgRvo(1, "上传成功", "/image/"+url);
        return new ImgRvo(1, "上传成功", url);
    }

    public static ImgRvo error(String message) {
        return new ImgRvo(0, message,"");
    }
}
