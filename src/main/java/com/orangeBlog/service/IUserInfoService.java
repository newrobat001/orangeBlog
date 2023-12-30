package com.orangeBlog.service;

import com.orangeBlog.entity.UserInfo;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author cdd
 * @since 2023年11月09日
 */
public interface IUserInfoService extends IService<UserInfo> {
    public String getUsername(Long id);
}
