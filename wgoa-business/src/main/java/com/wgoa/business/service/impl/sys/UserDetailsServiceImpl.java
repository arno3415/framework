package com.wgoa.business.service.impl.sys;

import com.wgoa.business.base.BaseServiceImpl;
import com.wgoa.business.service.intf.sys.UserDetailsService;
import com.wgoa.repository.domain.sys.UserDetails;
import com.wgoa.repository.repo.sys.UserDetailsMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
  * 系统用户详情信息service实现
  *@Author Arno
  *@Date 2019/1/22 19:29
  *@Version 1.0
  **/
@Service
@Transactional(rollbackFor = { RuntimeException.class, Exception.class })
public class UserDetailsServiceImpl extends BaseServiceImpl<UserDetailsMapper,UserDetails> implements UserDetailsService {

}
