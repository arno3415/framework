package com.wgoa.repository.repo;

import com.wgoa.repository.base.MyBaseMapper;
import com.wgoa.repository.domain.DemoUser;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;


/**
  * 示例Mapper层
  *@Author Arno
  *@Date 2019/1/22 18:54
  *@Version 1.0
  **/
@Mapper
@Component
public interface DemoUserMapper extends MyBaseMapper<DemoUser> {
}