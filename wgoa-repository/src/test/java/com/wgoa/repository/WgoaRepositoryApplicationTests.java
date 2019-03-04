package com.wgoa.repository;

import com.wgoa.repository.domain.sys.WgUser;
import com.wgoa.repository.repo.DemoUserMapper;
import com.wgoa.repository.repo.sys.WgUserMapper;
import org.apache.commons.collections.map.HashedMap;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.Map;

@RunWith(SpringRunner.class)
@SpringBootTest
public class WgoaRepositoryApplicationTests {

	@Autowired
    DemoUserMapper demoUserMapper;

	@Autowired
	WgUserMapper wgUserMapper;

	@Test
	public void contextLoads() throws Exception {

		WgUser user = new WgUser();
		user.setUserName("test11");
		user.setPassword("111111");
		user.setSalt("dsfdsfds");
		user.setType(1);
		user.setId(1);

//		wgUserMapper.update(user,"where user_name = '1'");

		Map<String,Object> map = new HashedMap();
		map.put("queryParams","where id = 1");
		wgUserMapper.selectOne(map);
		wgUserMapper.delete(null);
//		userMapper.insert(user);

//		DemoUser demoUser1 = demoUserMapper.selectById(1);
//		System.out.println(demoUser1.getUserName());

//		DemoUser demoUser = new DemoUser();
//		demoUser.setId(15);
//		demoUser.setUserId(3);
//		demoUser.setUserName("demo");
//		demoUserMapper.update(demoUser);
//		demoUser.insert();
//		demoUserMapper.insert(demoUser);

//		List<SysUser> list = wgUserMapper.list(null);
//		System.out.println("-----" + list.size());
	}
}
