package com.orangeBlog.dto;

import lombok.Data;

import java.time.LocalDateTime;
import java.util.List;

@Data
public class CommentDTO {
    private Long id;

    /**
     * 文章ID
     */
    private Long articleId;

    /**
     * 用户id
     */
    private Long userId;

    /**
     * 用户id
     */
    private String userName;

    /**
     * 评论内容
     */
    private String content;

    /**
     * 顶级评论
     */
    private Long topCommentId;

    /**
     * 父评论ID
     */
    private Long parentCommentId;

    /**
     * 是否删除
     */
    private Integer deleted;

    /**
     * 创建时间
     */
    private LocalDateTime createTime;

    /**
     * 最后修改时间
     */
    private LocalDateTime updateTime;

    private List<CommentDTO> child;

    private List<CommentDTO> th;

    private String parentName;
}
