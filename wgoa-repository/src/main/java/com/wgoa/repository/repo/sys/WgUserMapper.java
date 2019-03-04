package com.wgoa.repository.repo.sys;

import com.wgoa.repository.base.MyBaseMapper;
import com.wgoa.repository.domain.sys.WgUser;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

/**
 *
 *@Author Arno
 *@Date 2019/1/22 18:54
 *@Version 1.0
 **/
@Mapper
@Component
public interface WgUserMapper extends MyBaseMapper<WgUser> {

}