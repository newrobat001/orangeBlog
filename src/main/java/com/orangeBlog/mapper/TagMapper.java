package com.orangeBlog.mapper;

import com.orangeBlog.entity.Tag;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

/**
 * <p>
 * tag，标签表，一篇文章可拥有多个tag Mapper 接口
 * </p>
 *
 * @author cdd
 * @since 2023年11月09日
 */
public interface TagMapper extends BaseMapper<Tag> {
    List<Tag> getAllTagNames();

    List<Tag> getTagsByArticleId(Long id);
}
