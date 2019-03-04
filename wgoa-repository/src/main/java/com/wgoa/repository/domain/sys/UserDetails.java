package com.wgoa.repository.domain.sys;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 系统用户详情实体
 *@Author Arno
 *@Date 2019/1/22 18:51
 *@Version 1.0
 **/
@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserDetails extends WgUser {

    private Integer departmentId;

    private String attendanceNumber;

    private Integer sex;

    private String jobNumber;

    private Integer nationalityId;

    private String birthday;

    private Integer departmentTitleId;

    private String entryDate;

    private String positiveDate;

    private Integer recruitmentChannel;

}