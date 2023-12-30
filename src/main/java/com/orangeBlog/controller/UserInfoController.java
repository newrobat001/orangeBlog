package com.orangeBlog.controller;


import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.orangeBlog.entity.Article;
import com.orangeBlog.entity.UserInfo;
import com.orangeBlog.service.serviceImpl.ArticleServiceImpl;
import com.orangeBlog.service.serviceImpl.UserInfoServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpSession;

import java.util.List;

import static com.orangeBlog.Util.MD5Util.generateSaltedMD5;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author cdd
 * @since 2023年11月09日
 */
@Slf4j
@Controller
@RequestMapping("/user")
public class UserInfoController {
    private static String salt = "orangedd";
    @Autowired
    private UserInfoServiceImpl userInfoService;
    @Autowired
    private ArticleServiceImpl articleService;



    @GetMapping({"/login.html", "/login"})
    public String toLogin() {
        return "login";
    }

    /**
     * 登录
     *
     * @param loginEmail
     * @param loginPassword
     * @param session
     * @return
     */
    @PostMapping("/DoLogin")
    public String doLogin(@Param("loginEmail") String loginEmail,
                          @Param("loginPassword") String loginPassword,
                          HttpSession session,
                          Model model) {
        log.info("有用户登录：" + loginEmail);

        if (loginEmail == null || loginEmail == "") {
            session.setAttribute("error", "请填写账号密码！");
            return "redirect:/user/login";
        }
        // 生成加盐的MD5
        String password = generateSaltedMD5(loginPassword, salt);
        LambdaQueryWrapper<UserInfo> lqw = new LambdaQueryWrapper<>();
        lqw.eq(UserInfo::getUsername, loginEmail)
                .eq(UserInfo::getPassword, password);
        UserInfo userInfo = userInfoService.getOne(lqw);
        if (userInfo != null) {
            model.addAttribute("userinfo",userInfo);
            session.setAttribute("user", userInfo.getPersonName());
            session.setAttribute("userinfo", userInfo);
            return "redirect:/";
        } else {
            model.addAttribute("error", "用户名或密码错误，请重试。");
            return "login";
        }
    }

    /**
     * 退出
     *
     * @param session
     * @return
     */
    @GetMapping("/logout")
    public String logout(HttpSession session, Model model) {
        session.invalidate();
        return "redirect:/";
    }

    /**
     * 注册
     *
     * @param registerEmail
     * @param registerAccount
     * @param registerPassword
     * @return
     */
    @PostMapping("/register")
    public String zhuce(@Param("registerEmail") String registerEmail,
                        @Param("registerAccount") String registerAccount,
                        @Param("registerPassword") String registerPassword,
                        Model model) {

        log.info("新用户：" + registerAccount);
        UserInfo newUser = new UserInfo();

        LambdaQueryWrapper<UserInfo> Username = new LambdaQueryWrapper<>();
        Username.eq(UserInfo::getUsername, registerAccount);
        UserInfo existingUser = userInfoService.getOne(Username);

        LambdaQueryWrapper<UserInfo> Email = new LambdaQueryWrapper<>();
        Email.eq(UserInfo::getEmail, registerEmail);
        UserInfo existingEmail = userInfoService.getOne(Email);
        if (existingUser != null) {
            // 用户名已存在，返回注册页面并显示错误消息
            model.addAttribute("error", "用户名已经被使用，请选择其他用户名。");
            return "login";
        }
        if (existingEmail != null) {
            // 邮箱已存在，返回注册页面并显示错误消息
            model.addAttribute("error", "邮箱已注册！");
            return "login";
        }
        // 用户名可用，进行用户注册
        // 密码加密
        String md5pwd = generateSaltedMD5(registerPassword, salt);

        newUser.setUsername(registerAccount);
        newUser.setPassword(md5pwd);
        newUser.setEmail(registerEmail);

        boolean success = userInfoService.save(newUser);

        if (success) {
            // 注册成功，重定向到登录页面
            model.addAttribute("success", "注册完成，请登录");
            log.info("新用户：" + registerAccount + "注册完成！");

        } else {
            // 注册失败，返回注册页面并显示错误消息
            model.addAttribute("error", "注册失败，请重试。");

        }
        return "login";
    }

    /**
     * 个人主页
     * @param userId
     * @param model
     * @return
     */
    @GetMapping("/info")
    public String userInfo(@RequestParam("id") Long userId,
                           Model model,
                           @RequestParam(defaultValue = "1") int currentPage,
                           @RequestParam(defaultValue = "5") int pageSize) {

        // 处理获取用户信息的逻辑，然后将用户信息传递到模板
        LambdaQueryWrapper<UserInfo> qw=new LambdaQueryWrapper();
        qw.eq(UserInfo::getId, userId);

        LambdaQueryWrapper<Article> qwArticle=new LambdaQueryWrapper();
        //匹配用户文章
        qwArticle.eq(Article::getUserId,userId);
        //排序最新编辑
        qwArticle.orderByDesc(Article::getCreateTime);

        UserInfo userInfo = userInfoService.getOne(qw);
        model.addAttribute("userinfo",userInfo);

        //获取分页
        // 使用 MyBatis-Plus 的 Page 对象
        Page<Article> page = new Page<>(currentPage, pageSize);

        // 查询数据库并获取分页数据
//        todo: 分页对象
        IPage<Article> articlePage = articleService.getArticlePage(page,qwArticle);



        List<Article> byId = articleService.getlistById(userId);
        //articlePage.setRecords(byId);
//        model.addAttribute("userArticleList",byId);
        //分页对象
        model.addAttribute("currentPage", currentPage);
        //每页数量
        model.addAttribute("pageSize", pageSize);
        //当前页数
        model.addAttribute("totalPages", articlePage.getPages());
        //
        model.addAttribute("currentPageData", articlePage.getRecords());

        return "userinfo"; // 返回模板名称，根据你的实际情况更改
    }

    @GetMapping("/setHeadPhoto")
    public String setHeadPhoto() {
        return "";
    }

}

