package com.wgoa.repository.repo.sys;

import com.wgoa.repository.base.MyBaseMapper;
import com.wgoa.repository.domain.sys.UserRole;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

/**
 * 系统用户角色mapper
 *@Author Arno
 *@Date 2019/1/22 18:54
 *@Version 1.0
 **/
@Mapper
@Component
public interface UserRoleMapper extends MyBaseMapper<UserRole> {
}