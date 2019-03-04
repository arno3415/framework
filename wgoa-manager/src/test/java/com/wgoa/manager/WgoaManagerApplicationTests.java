package com.wgoa.manager;

import com.wgoa.business.service.intf.DemoUserService;
import com.wgoa.business.service.intf.sys.MenuService;
import com.wgoa.business.service.intf.sys.RoleService;
import com.wgoa.business.service.intf.sys.UserDetailsService;
import com.wgoa.business.service.intf.sys.WgUserService;
import com.wgoa.repository.domain.sys.WgUser;
import com.wgoa.repository.utils.MyEntityWrapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
public class WgoaManagerApplicationTests {

	@Autowired
	DemoUserService demoUserService;

	@Autowired
	RoleService roleService;

	@Autowired
	MenuService menuService;

	@Autowired
	UserDetailsService userDetailsService;

	@Autowired
	WgUserService wgUserService;

	@Test
	public void contextLoads() {
		try {
//			System.out.println(roleService.findById(1));
//			roleService.update(new Role());
//
//			System.out.println(menuService.findById(1));
//			menuService.update(new Menu());

//			userDetailsService.delete(1);
//			System.out.println(userDetailsService.findById(1));
//			userDetailsService.update(new UserDetails());

//			sysUserMapper.delete(1);
//			System.out.println(sysUserMapper.findById(1));
//			sysUserMapper.update(new SysUser());

			MyEntityWrapper<WgUser> entityWrapper = new MyEntityWrapper<>();
			entityWrapper.like("user_name","ad");
			entityWrapper.ne("status",1);
			System.out.println(wgUserService.selectOne(entityWrapper));
//			wgUserService.delete(1);
//			System.out.println(wgUserService.findById(1));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
