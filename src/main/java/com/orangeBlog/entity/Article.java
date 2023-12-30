package com.orangeBlog.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
import java.time.LocalDateTime;

import com.baomidou.mybatisplus.annotation.TableLogic;
import lombok.Getter;
import lombok.Setter;
import lombok.experimental.Accessors;

/**
 * <p>
 * 
 * </p>
 *
 * @author cdd
 * @since 2023年11月09日
 */
@Getter
@Setter
@Accessors(chain = true)
public class Article implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 用户id，可以理解为作者
     */
    private Long userId;

    /**
     * 标题
     */
    private String title;

    /**
     * 副标题（简介更合适一些）
     */
    private String shortTitle;

    /**
     * 封面图
     */
    private String picture;

    /**
     * 类目ID
     */
    private Long categoryId;

    /**
     * 来源，1.原创 2. 转载
     */
    private Integer source;

    /**
     * 原文链接
     */
    private String sourceUrl;

    /**
     * 状态，0  未发布，1 已发布
     */
    private Integer status;

    /**
     * 逻辑删除
     */
    @TableLogic
    private Integer deleted;

    /**
     * 创建时间
     */
    private LocalDateTime createTime;

    /**
     * 最后更新时间
     */
    private LocalDateTime updateTime;


}
