package com.orangeBlog.service;

import com.orangeBlog.entity.Like;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author cdd
 * @since 2023年11月09日
 */
public interface ILikeService extends IService<Like> {
    Integer countArticle(Long id);
}
