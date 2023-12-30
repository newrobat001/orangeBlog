package com.orangeBlog.service.serviceImpl;

import com.orangeBlog.entity.Tag;
import com.orangeBlog.mapper.TagMapper;
import com.orangeBlog.service.ITagService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * tag，标签表，一篇文章可拥有多个tag 服务实现类
 * </p>
 *
 * @author cdd
 * @since 2023年11月09日
 */
@Service
public class TagServiceImpl extends ServiceImpl<TagMapper, Tag> implements ITagService {
    @Autowired
    private TagMapper tagMapper;

    @Override
    public List<Tag> getAllTagNames() {
        return tagMapper.getAllTagNames();
    }

    @Override
    public List<Tag> getTagsByArticleId(Long id) {
        return tagMapper.getTagsByArticleId(id);
    }
}
