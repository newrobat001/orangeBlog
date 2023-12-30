package com.orangeBlog.controller;


import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.orangeBlog.common.Rvo;
import com.orangeBlog.entity.Article;

import com.orangeBlog.entity.ArticleDetail;
import com.orangeBlog.entity.Category;
import com.orangeBlog.entity.Tag;
import com.orangeBlog.req.ArticleForm;
import com.orangeBlog.service.serviceImpl.ArticleDetailServiceImpl;
import com.orangeBlog.service.serviceImpl.ArticleServiceImpl;

import com.orangeBlog.service.serviceImpl.CategoryServiceImpl;
import com.orangeBlog.service.serviceImpl.TagServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


import org.springframework.stereotype.Controller;

import java.util.List;

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
@RequestMapping("/article")

public class ArticleController {
    @Autowired
    private ArticleServiceImpl articleService;

    @Autowired
    private ArticleDetailServiceImpl detailService;

    @Autowired
    private TagServiceImpl tagService;

    @Autowired
    private CategoryServiceImpl categoryService;

    @GetMapping("/{id}")
    public String getArticle(Long id,Model model) {
        LambdaQueryWrapper<Article> qw=new LambdaQueryWrapper<>();
        LambdaQueryWrapper<ArticleDetail> deqw=new LambdaQueryWrapper<>();
        qw.eq(Article::getId,id);
        Article article = articleService.getOne(qw);
        deqw.eq(ArticleDetail::getArticleId,id);
        ArticleDetail articleDetail = detailService.getOne(deqw);
        return "blog-single";
    }

    @GetMapping("/nav")
    @ResponseBody
    public Rvo< List<Article> > articleNav(Model model) {
        List<Article> allArticle = articleService.list();
        model.addAttribute("articles",allArticle);
        return Rvo.success(allArticle);

    }


    /**
     * 文章编辑页
     * @param model
     * @return
     */
    @GetMapping({"/edit","/edit.html"})
    public String editor(Model model){
        List<Tag> allTagNames = tagService.getAllTagNames();

        log.info(allTagNames.get(1).getTagName());

        List<Category> allCategoryNames = categoryService.getAllCategoryNames();
        model.addAttribute("TagNames",allTagNames)
             .addAttribute("CategoryNames", allCategoryNames);
        return "edit";
    }


    /**
     * 提交编辑文章
     String title,
     String creationType,
     Long categoryId,
     Long tagId,
     String description,
     String content,
     Boolean isPublish
     * @return
     */
    @PostMapping({"/getArticle"})
    public String editArticle(ArticleForm form){

        articleService.saveArticle(form);
        form.getUserId();
        return "redirect:/user/info?id="+form.getUserId();
    }

    @GetMapping("/update")
    public String update(Long id) {
        LambdaQueryWrapper<Article> qw=new LambdaQueryWrapper<>();
        qw.eq(Article::getId, id);


        return "edit";
    }

    @DeleteMapping("/delete")
    @ResponseBody
    public Rvo<String> delete(@Param("id") Long id) {

        boolean remove = articleService.removeArticle(id);
        if (remove) {
            System.out.println("删除成功："+id);
            return Rvo.success("删除成功！");
        }
        return Rvo.error("删除失败请重试！");
    }
}

