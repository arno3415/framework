package com.wgoa.business.service.impl.sys;

import com.wgoa.business.base.BaseServiceImpl;
import com.wgoa.business.service.intf.sys.WgUserService;
import com.wgoa.repository.domain.sys.WgUser;
import com.wgoa.repository.repo.sys.WgUserMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
  * 系统用户基础信息service实现
  *@Author Arno
  *@Date 2019/1/22 19:29
  *@Version 1.0
  **/
@Service
@Transactional(rollbackFor = { RuntimeException.class, Exception.class })
public class WgUserServiceImpl extends BaseServiceImpl<WgUserMapper,WgUser> implements WgUserService {

}
