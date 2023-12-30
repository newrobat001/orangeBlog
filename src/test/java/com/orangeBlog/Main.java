package com.orangeBlog;

import com.baomidou.mybatisplus.core.toolkit.IdWorker;
import com.orangeBlog.Util.MarkdownToHtmlConverter;
import com.orangeBlog.dto.articleDTO;
import com.orangeBlog.entity.Category;
import com.orangeBlog.entity.Comment;
import com.orangeBlog.entity.Tag;
import com.orangeBlog.mapper.CommentMapper;
import com.orangeBlog.service.serviceImpl.*;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;
import java.util.Map;

@Slf4j
@SpringBootTest
public class Main {
    @Autowired
    private ArticleServiceImpl articleService;
    @Autowired
    private ArticleDetailServiceImpl articleDetail;
    @Autowired
    private ArticleTagServiceImpl articleTag;
    @Autowired
    private CategoryServiceImpl categoryService;
    @Autowired
    private CommentServiceImpl commentService;
    @Autowired
    private LikeServiceImpl likeService;
    @Autowired
    private TagServiceImpl tagService;
    @Autowired
    private UserFootServiceImpl userFootService;
    @Autowired
    private UserInfoServiceImpl userInfoService;
    @Autowired
    private CommentMapper comService;
    //接口测试
    @Test
    public void testArticleList() {


//        IService[] DataIndex={articleService,
//                articleDetail,
//                articleTag,
//                categoryService,
//                commentService,
//                likeService,
//                tagService,
//                userFootService,
//                userInfoService};
//        List<IService> testData = Arrays.stream(DataIndex).collect(Collectors.toList());

//            List<Article> list = articleService.list();
//            for (Article ar :
//                    list) {
//                System.out.println(ar.getTitle());
//            }

//        List<Tag> allArticle = tagService.getAllTagNames();
//            System.out.println(allArticle.get(1).getTagName());
//        List<Comment> direct = comService.getDirect(863819785L);
//        for (Comment ment :
//                direct) {
//            System.out.println(ment.getContent());
//
//            List<Comment> child = comService.getChild(ment.getId());
//                for (Comment co :
//                        child) {
//                    List<Comment> th = comService.getTh(co.getId());
//
//                    System.out.println(co.getContent());
//                    for (Comment coent :
//                            th) {
//                        System.out.println(coent.getContent());
//                    }
//                }
//        }

        List<articleDTO> allArticle = articleService.getAllArticle();
        for (articleDTO dto :
                allArticle) {
            int i=0;
            System.out.println("第"+i+"条数据"+dto);
            i++;
        }
    }
}
