package com.wgoa.business.service.impl;

import com.wgoa.business.base.BaseServiceImpl;
import com.wgoa.business.service.intf.DemoUserService;
import com.wgoa.repository.domain.DemoUser;
import com.wgoa.repository.repo.DemoUserMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
  * 示例service实现
  *@Author Arno
  *@Date 2019/1/22 19:29
  *@Version 1.0
  **/
@Service
@Transactional(rollbackFor = { RuntimeException.class, Exception.class })
public class DemoUserServiceImpl extends BaseServiceImpl<DemoUserMapper,DemoUser> implements DemoUserService {

}
