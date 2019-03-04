package com.wgoa.manager.base;

import com.wgoa.business.service.intf.DemoUserService;
import com.wgoa.manager.config.ComponentProperties;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * 父级controller
 * 所有controller可继承该类
 * @Author Arno
 * @Date 2019/1/24 19:12
 * @Version 1.0
 **/
@AllArgsConstructor
@NoArgsConstructor
@Data
public class BaseController {

    @Autowired
    protected ComponentProperties componentProperties;
    @Autowired
    protected DemoUserService demoUserService;
}
