package com.orangeBlog.controller;

import com.orangeBlog.dto.articleDTO;
import com.orangeBlog.dto.categoryIndexDTO;
import com.orangeBlog.entity.Article;
import com.orangeBlog.entity.Category;
import com.orangeBlog.service.IArticleDTO;
import com.orangeBlog.service.serviceImpl.ArticleServiceImpl;
import com.orangeBlog.service.serviceImpl.CategoryServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping({"/index", " ", "/"})
@Slf4j
public class indexController {

    @Autowired
    private ArticleServiceImpl articleService;

    @Autowired
    private CategoryServiceImpl categoryService;

    private static List< List<Article>> indexList;

    @GetMapping({"", "/", "/"})
    public String index(Model model) {

        List<articleDTO> list1 = articleService.getRecWithType(1);
        List<articleDTO> list2 = articleService.getRecWithType(2);
        List<articleDTO> list3 = articleService.getRecWithType(3);
        List<articleDTO> list4 = articleService.getRecWithType(4);

        List<articleDTO> list5 = articleService.getRecently();

        List<categoryIndexDTO> categoryList=new ArrayList<>();
        List<Category> category = categoryService.getAllCategoryNames();

        for (Category cate :
                category) {

            categoryIndexDTO caDTO=new categoryIndexDTO();
            caDTO.setCategoryName(cate.getCategoryName());
            caDTO.setCount( categoryService.getCOUNT (cate.getId()) );
            categoryList.add(caDTO);
        }

        log.info("首页加载完成:" + list3.get(1).getArticleList().getUpdateTime());

        model.addAttribute("articles1", list1)
                .addAttribute("articles2", list2)
                .addAttribute("articles3", list3)
                .addAttribute("articles4", list4)
                .addAttribute("articles5", list5)
                .addAttribute("categoryList",categoryList);
        return "index";
    }
}
