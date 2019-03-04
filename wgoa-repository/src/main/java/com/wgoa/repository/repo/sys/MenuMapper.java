package com.wgoa.repository.repo.sys;

import com.wgoa.repository.base.MyBaseMapper;
import com.wgoa.repository.domain.sys.Menu;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

/**
 * 系统菜单mapper
 *@Author Arno
 *@Date 2019/1/22 18:54
 *@Version 1.0
 **/
@Mapper
@Component
public interface MenuMapper extends MyBaseMapper<Menu> {
}