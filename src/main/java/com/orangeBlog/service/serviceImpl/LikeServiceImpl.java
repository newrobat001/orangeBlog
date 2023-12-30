package com.orangeBlog.service.serviceImpl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.orangeBlog.entity.Like;
import com.orangeBlog.mapper.LikeMapper;
import com.orangeBlog.service.ILikeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author cdd
 * @since 2023年11月17日
 */
@Service
public class LikeServiceImpl extends ServiceImpl<LikeMapper, Like> implements ILikeService {
    @Autowired
    private LikeMapper likeMapper;

    /**
     * 统计文章点赞数
     * @param id
     * @return
     */
    @Override
    public Integer countArticle(Long id) {
        return likeMapper.countArticle(id);
    }
}
