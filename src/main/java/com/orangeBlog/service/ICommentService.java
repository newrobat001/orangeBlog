package com.orangeBlog.service;

import com.orangeBlog.dto.CommentDTO;
import com.orangeBlog.entity.Comment;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 * 评论表 服务类
 * </p>
 *
 * @author cdd
 * @since 2023年11月09日
 */
public interface ICommentService extends IService<Comment> {
    List<CommentDTO> getDirect(Long articleId);
    List<CommentDTO> getChild(Long getDirectId);

    List<CommentDTO> getTh(Long artigetChildIdcleId);

    Integer getAllCount(Long getDirectId);
}
