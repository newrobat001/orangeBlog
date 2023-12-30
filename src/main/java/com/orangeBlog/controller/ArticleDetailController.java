package com.orangeBlog.controller;


import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.orangeBlog.Util.MarkdownToHtmlConverter;
import com.orangeBlog.dto.CommentDTO;
import com.orangeBlog.entity.*;
import com.orangeBlog.service.serviceImpl.*;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;
import java.util.zip.Adler32;

/**
 * <p>
 * 文章详情表 前端控制器
 * </p>
 *
 * @author cdd
 * @since 2023年11月09日
 */
@Controller
@Slf4j
public class ArticleDetailController {

    @Autowired
    private ArticleServiceImpl articleService;
    @Autowired
    private ArticleDetailServiceImpl detailService;
    @Autowired
    private TagServiceImpl tagService;
    @Autowired
    private ArticleTagServiceImpl articleTagService;
    @Autowired
    private CategoryServiceImpl categoryService;
    @Autowired
    private UserInfoServiceImpl userinfoSer;
    @Autowired
    private CommentServiceImpl comService;
    @Autowired
    private LikeServiceImpl likeService;
    /**
     * 显示单个博客
     * @param id
     * @param model
     * @return
     */
    @GetMapping("/blog-single.html")
    public String blogSingle(@Param("id")Long id, Model model) {

        LambdaQueryWrapper<Article> artqw = new LambdaQueryWrapper<>();
        LambdaQueryWrapper<ArticleDetail> deqw = new LambdaQueryWrapper<>();
        LambdaQueryWrapper<Category> cateqw = new LambdaQueryWrapper<>();
        LambdaQueryWrapper<ArticleTag> artTagqw = new LambdaQueryWrapper<>();

        //根据id查找文章信息
        artqw.eq(Article::getId, id);
        deqw.eq(ArticleDetail::getArticleId, id)
                .eq(ArticleDetail::getDeleted, 0);//限定未删除的

        //文章内容和信息
        Article article = articleService.getOne(artqw);
        ArticleDetail detail = detailService.getOne(deqw);

        //作者
        String username = userinfoSer.getUsername(article.getUserId());


        //类型
        Category nameById = categoryService.getNameById(article.getCategoryId());

        //标签
        List<Tag> tagsByArticleId = tagService.getTagsByArticleId(id);


        //评论
//        List< List<Comment> > commentList = comService.getCommentlist(id);
        List<CommentDTO> commentList = comService.getCommentlist(id);
        //统计文章评论数
        Integer allCount = comService.getAllCount(id);

        System.out.println("评论内容" + commentList);
        //文章内容，md转换为html
        String content1 = detail.getContent();
        String content = MarkdownToHtmlConverter.convertMarkdownToHtml(detail.getContent());

        //点赞信息
        Integer likeCount = likeService.countArticle(id);

        model.addAttribute("singleArt", article)
                .addAttribute("categoryById", nameById)
                .addAttribute("tags", tagsByArticleId)
                .addAttribute("singleDetail", detail)
                .addAttribute("content", content1)
                .addAttribute("commentList", commentList)
                .addAttribute("commentCount",allCount)
                .addAttribute("likeCount",likeCount)
                .addAttribute("author",username);

        log.info("数据：" + article);
        return "blog-single";
    }

}

