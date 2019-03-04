package com.wgoa.repository.domain;

import com.wgoa.repository.base.DataEntity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
  * 示例实体
  *@Author Arno
  *@Date 2019/1/22 18:51
  *@Version 1.0
  **/
@Data
@NoArgsConstructor
@AllArgsConstructor
public class DemoUser extends DataEntity<DemoUser> {

    private static final long serialVersionUID = 1L;

    /**
     * 注释
     */
    private Integer userId;

    /**
     * 注释
     */
    private String userName;

}