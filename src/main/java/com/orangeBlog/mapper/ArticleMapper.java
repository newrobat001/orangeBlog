package com.orangeBlog.mapper;

import com.orangeBlog.entity.Article;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author cdd
 * @since 2023年11月09日
 */
@Mapper
public interface ArticleMapper extends BaseMapper<Article> {
    public List<Article> getRecWithType(int type);

    public List<Article> getAll();
    List<Article> getlistById(Long id);

    List<Article> getRecently();
}
