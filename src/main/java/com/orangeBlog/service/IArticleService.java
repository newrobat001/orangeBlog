package com.orangeBlog.service;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.orangeBlog.dto.articleDTO;
import com.orangeBlog.entity.Article;
import com.baomidou.mybatisplus.extension.service.IService;
import com.orangeBlog.req.ArticleForm;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author cdd
 * @since 2023年11月09日
 */
public interface IArticleService extends IService<Article> {
    List<articleDTO> getRecWithType(int type);
    List<articleDTO> getall();

    List<Article> getlistById(Long id);

    void saveArticle(ArticleForm form);

    /**
     * 分页
     * @param page
     * @return
     */
    IPage<Article> getArticlePage(Page<Article> page);

    IPage<Article> getArticlePage(Page<Article> page, LambdaQueryWrapper<Article> qw);

    List<articleDTO> getRecently();
}
