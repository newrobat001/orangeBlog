package com.orangeBlog.controller;


import com.orangeBlog.common.Rvo;
import com.orangeBlog.service.serviceImpl.LikeServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * <p>
 * 用户足迹表 前端控制器
 * </p>
 *
 * @author cdd
 * @since 2023年11月09日
 */
@Controller
@RequestMapping("/userfoot")
public class UserFootController {
    @Autowired
    private LikeServiceImpl likeService;

    @GetMapping("/like")
    @ResponseBody
    public Rvo<String>  like(Long userId, String type, Boolean status){

        return Rvo.success("");
    }

    @GetMapping("/comment")
    @ResponseBody
    public Rvo<String>  comment(Long userId, String type, Boolean status){

        return Rvo.success("");
    }
}

