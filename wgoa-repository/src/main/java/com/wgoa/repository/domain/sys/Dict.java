package com.wgoa.repository.domain.sys;

import com.wgoa.repository.base.DataEntity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 系统字典实体
 *@Author Arno
 *@Date 2019/1/22 18:51
 *@Version 1.0
 **/
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Dict extends DataEntity<Dict> {

    private String name;

    private String data;

    private String typeCode;

    private Integer sort;


}