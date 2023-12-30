//package com.orangeBlog;
//
//import com.orangeBlog.entity.Article;
//import com.orangeBlog.entity.UserInfo;
//import com.orangeBlog.service.serviceImpl.*;
//import lombok.extern.slf4j.Slf4j;
//import org.junit.jupiter.api.Test;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.boot.test.context.SpringBootTest;
//
//import java.util.List;
//
//import static com.orangeBlog.Util.MD5Util.generateSaltedMD5;
//
//@Slf4j
//@SpringBootTest
//public class articelTest {
//    @Autowired
//    private ArticleServiceImpl articleService;
//    @Autowired
//    private ArticleDetailServiceImpl articleDetail;
//    @Autowired
//    private ArticleTagServiceImpl articleTag;
//    @Autowired
//    private CategoryServiceImpl categoryService;
//    @Autowired
//    private CommentServiceImpl commentService;
//    @Autowired
//    private LikeServiceImpl likeService;
//    @Autowired
//    private TagServiceImpl tagService;
//    @Autowired
//    private UserFootServiceImpl userFootService;
//    @Autowired
//    private UserInfoServiceImpl userInfoService;
//    @Test
//    public void testmapper(){
//        List<Article> getall = articleService.getall();
//        List<Article> recWithType = articleService.getRecWithType(3);
//        System.out.println(recWithType);
//    }
//
//    @Test
//    public void test02(){
//        List<Article> list1 = articleService.getRecWithType(1);
//        List<Article> list2 = articleService.getRecWithType(2);
//        List<Article> list3 = articleService.getRecWithType(3);
//        List<Article> list4 = articleService.getRecWithType(4);
//        List<Article> list5 = articleService.getRecWithType(5);
//        log.info("首页加载完成:" + list3.get(1).getUpdateTime());
//    }
//
//    @Test
//    public void testCategory(){
//        List<Article> recWithType = articleService.getRecWithType(1);
//        List<UserInfo> list1 = userInfoService.list();
//        List<String> list = categoryService.getAllCategoryNames();
//        userFootService.list();
//        articleService.list();
//        articleDetail.list();
//        articleTag.list();
//        commentService.list();
//        //likeService.list();
//        tagService.list();
//        userFootService.list();
//
//        log.info("文章id=:"+list1+"，所属类目为：" + list);
//    }
//    @Test
//    public void md5(){
//        String password = generateSaltedMD5("123456", "orangedd");
//        System.out.println(password);
//    }
//}
