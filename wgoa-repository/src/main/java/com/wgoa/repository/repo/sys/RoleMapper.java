package com.wgoa.repository.repo.sys;

import com.wgoa.repository.base.MyBaseMapper;
import com.wgoa.repository.domain.sys.Role;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

/**
 * 系统角色mapper
 *@Author Arno
 *@Date 2019/1/22 18:54
 *@Version 1.0
 **/
@Mapper
@Component
public interface RoleMapper extends MyBaseMapper<Role> {
}