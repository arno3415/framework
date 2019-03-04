package com.wgoa.repository.domain.sys;

import com.wgoa.repository.base.DataEntity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 系统菜单实体
 *@Author Arno
 *@Date 2019/1/22 18:51
 *@Version 1.0
 **/
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Menu extends DataEntity<Menu> {

    private String name;

    private Integer parentId;

    private Integer level;

    private String parentIds;

    private Integer sort;

    private Integer isShow;

    private String href;

    private String target;

    private String icon;

    private String bgColor;

    private String permission;
}