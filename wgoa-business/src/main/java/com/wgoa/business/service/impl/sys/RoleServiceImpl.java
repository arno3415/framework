package com.wgoa.business.service.impl.sys;

import com.wgoa.business.base.BaseServiceImpl;
import com.wgoa.business.service.intf.sys.RoleService;
import com.wgoa.repository.domain.sys.Role;
import com.wgoa.repository.repo.sys.RoleMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
  * 系统角色service实现
  *@Author Arno
  *@Date 2019/1/22 19:29
  *@Version 1.0
  **/
@Service
@Transactional(rollbackFor = { RuntimeException.class, Exception.class })
public class RoleServiceImpl extends BaseServiceImpl<RoleMapper,Role> implements RoleService {

}
