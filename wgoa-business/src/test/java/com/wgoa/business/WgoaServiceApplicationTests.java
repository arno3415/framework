package com.wgoa.business;

import com.wgoa.business.service.intf.DemoUserService;
import com.wgoa.repository.domain.DemoUser;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
public class WgoaServiceApplicationTests {

	@Autowired
	DemoUserService demoUserService;

	@Test
	public void contextLoads() throws Exception{


//		System.out.println(demoUserService.findById(1));
//		for (DemoUser demo : page
//			 ) {
//			System.out.println(demo.getUserName());
//		}
		DemoUser admin = new DemoUser();
		admin.setUserId(123);
//		admin.setUserName("testServiceDemo");
//		demoUserService.insert(admin);

//		User user = new User();
//		user.setUserName("test2");
//		user.setType(1);
//		user.setSalt("1fdsfa");
//		user.setPassword("1231231");
//		userService.insert(user);

//		System.out.println(userService.findById(1));
	}

}
