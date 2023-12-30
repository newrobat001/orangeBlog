package com.orangeBlog.service;

import com.orangeBlog.entity.ArticleTag;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 标签与对应文章表，单独分离出来更好管理与应用 服务类
 * </p>
 *
 * @author cdd
 * @since 2023年11月09日
 */
public interface IArticleTagService extends IService<ArticleTag> {

}
