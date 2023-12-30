package com.orangeBlog.controller;

import com.orangeBlog.Util.MD5Util;
import com.orangeBlog.common.ImgRvo;
import com.orangeBlog.common.Rvo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

@Controller
@Slf4j
public class updateController {
    @Value("${upload.path}") // 从配置文件中读取上传路径
    private String uploadPath;

    @RequestMapping("/update")
    public String index() {
        return "demo/upload";
    }

    @PostMapping("/upload")
    @ResponseBody
    //@RequestParam("editormd-image-file") MultipartFile file,
    public ImgRvo handleFileUpload(MultipartFile file) {
        if (file.isEmpty()) {
            return ImgRvo.error("文件为空");
        }
        try {
            // 获取文件名并重新起名
            String fileName = MD5Util.generateRandomFileName(file.getOriginalFilename());
            // 创建目标目录（如果不存在）
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }
            // 构建目标文件
            File destFile = new File(uploadPath + File.separator + fileName);
            // 保存文件
            file.transferTo(destFile);

            return ImgRvo.success(fileName);
        } catch (IOException e) {
            e.printStackTrace();
            return ImgRvo.error("文件上传失败");
        }
    }

    @GetMapping("/download")
    public void download(String name, HttpServletResponse response){
        log.info("展示的文件名：{}",name);

        try {
            //输入流
            FileInputStream fileInputStream=new FileInputStream(new File(uploadPath+name));
            //输出流
            ServletOutputStream outputStream = response.getOutputStream();

            response.setContentType("image/jpeg");

            int length=0;
            byte[] bytes=new byte[2048];
            while ( (length=fileInputStream.read(bytes)) != -1){
                outputStream.write(bytes, 0, length);
                outputStream.flush();
            }
            //关闭
            outputStream.close();
            fileInputStream.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
