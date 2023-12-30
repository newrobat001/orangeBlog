package com.orangeBlog.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
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
@TableName("user_info")
public class UserInfo implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * id
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 绑定邮箱
     */
    private String email;

    /**
     * 账号
     */
    private String username;

    /**
     * 用户密码
     */
    private String password;

    /**
     * 0 管理员， 1 用户 ， 2 游客
     */
    private Integer type;

    /**
     * 个人昵称
     */
    private String personName;

    /**
     * 个人简介
     */
    private String profile;

    /**
     * 是否删除：0 未删除；1 已删除
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

    private String headPhoto;
}
