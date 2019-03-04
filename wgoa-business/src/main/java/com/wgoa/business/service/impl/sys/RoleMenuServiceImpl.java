package com.wgoa.business.service.impl.sys;

import com.wgoa.business.base.BaseServiceImpl;
import com.wgoa.business.service.intf.sys.RoleMenuService;
import com.wgoa.repository.domain.sys.RoleMenu;
import com.wgoa.repository.repo.sys.RoleMenuMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
  * 系统角色菜单service实现
  *@Author Arno
  *@Date 2019/1/22 19:29
  *@Version 1.0
  **/
@Service
@Transactional(rollbackFor = { RuntimeException.class, Exception.class })
public class RoleMenuServiceImpl extends BaseServiceImpl<RoleMenuMapper,RoleMenu> implements RoleMenuService {

}
