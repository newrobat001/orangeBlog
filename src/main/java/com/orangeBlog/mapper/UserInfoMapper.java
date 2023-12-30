package com.orangeBlog.mapper;

import com.orangeBlog.entity.UserInfo;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author cdd
 * @since 2023年11月09日
 */
public interface UserInfoMapper extends BaseMapper<UserInfo> {
    String getUsername(Long id);
}
