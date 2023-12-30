package com.orangeBlog.mapper;

import com.orangeBlog.entity.Like;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author cdd
 * @since 2023年11月09日
 */
public interface LikeMapper extends BaseMapper<Like> {
    Integer countArticle(Long id);

    Integer countComment(Long id);
}
