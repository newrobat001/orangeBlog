package com.orangeBlog.service.serviceImpl;

import com.orangeBlog.entity.UserInfo;
import com.orangeBlog.mapper.UserInfoMapper;
import com.orangeBlog.service.IUserInfoService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author cdd
 * @since 2023年11月09日
 */
@Service
public class UserInfoServiceImpl extends ServiceImpl<UserInfoMapper, UserInfo> implements IUserInfoService {
    @Autowired
    private UserInfoMapper userInfoMapper;

    @Override
    public String getUsername(Long id) {
        return userInfoMapper.getUsername(id);
    }
}
