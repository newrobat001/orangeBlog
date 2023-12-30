package com.orangeBlog.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
import java.time.LocalDateTime;
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
public class Like implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 点赞id
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 动作发起者
     */
    private Long userId;

    /**
     * 被点赞对象id
     */
    private Long operationObj;

    /**
     * 被点赞类型：0-文章，1-评论
     */
    private Integer type;

    /**
     * 状态：0-已点赞，1-已取消
     */
    private Integer status;

    private LocalDateTime createTime;

    private LocalDateTime updateTime;


}
