package com.wgoa.repository.domain.sys;

import com.wgoa.repository.base.DataEntity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 系统角色实体
 *@Author Arno
 *@Date 2019/1/22 18:51
 *@Version 1.0
 **/
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Role extends DataEntity<Role> {

    private String name;

    private Integer roleLevel;

}