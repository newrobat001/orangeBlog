package com.orangeBlog.mapper;

import com.orangeBlog.entity.ArticleTag;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

/**
 * <p>
 * 标签与对应文章表，单独分离出来更好管理与应用 Mapper 接口
 * </p>
 *
 * @author cdd
 * @since 2023年11月09日
 */
public interface ArticleTagMapper extends BaseMapper<ArticleTag> {

}
