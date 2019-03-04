package com.wgoa.business.service.impl.sys;

import com.wgoa.business.base.BaseServiceImpl;
import com.wgoa.business.service.intf.sys.DictService;
import com.wgoa.repository.domain.sys.Dict;
import com.wgoa.repository.repo.sys.DictMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
  * 系统字典service实现
  *@Author Arno
  *@Date 2019/1/22 19:29
  *@Version 1.0
  **/
@Service
@Transactional(rollbackFor = { RuntimeException.class, Exception.class })
public class DictServiceImpl extends BaseServiceImpl<DictMapper,Dict> implements DictService {

}
