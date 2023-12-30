package com.orangeBlog.service;

import com.orangeBlog.entity.Tag;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 * tag，标签表，一篇文章可拥有多个tag 服务类
 * </p>
 *
 * @author cdd
 * @since 2023年11月09日
 */
public interface ITagService extends IService<Tag> {
    List<Tag> getAllTagNames();

    List<Tag> getTagsByArticleId(Long id);
}
