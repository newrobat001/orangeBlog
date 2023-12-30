package com.orangeBlog.service.serviceImpl;

import com.orangeBlog.entity.ArticleTag;
import com.orangeBlog.mapper.ArticleTagMapper;
import com.orangeBlog.service.IArticleTagService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 标签与对应文章表，单独分离出来更好管理与应用 服务实现类
 * </p>
 *
 * @author cdd
 * @since 2023年11月09日
 */
@Service
public class ArticleTagServiceImpl
        extends ServiceImpl<ArticleTagMapper, ArticleTag>
        implements IArticleTagService {

}
