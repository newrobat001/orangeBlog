package com.orangeBlog.service.serviceImpl;

import com.orangeBlog.entity.ArticleDetail;
import com.orangeBlog.mapper.ArticleDetailMapper;
import com.orangeBlog.service.IArticleDetailService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 文章详情表 服务实现类
 * </p>
 *
 * @author cdd
 * @since 2023年11月09日
 */
@Service
public class ArticleDetailServiceImpl extends ServiceImpl<ArticleDetailMapper, ArticleDetail> implements IArticleDetailService {

}
