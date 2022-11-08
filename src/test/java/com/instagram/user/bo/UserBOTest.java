package com.instagram.user.bo;

import static org.junit.Assert.assertNotNull;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import com.instagram.user.model.User;

@SpringBootTest
class UserBOTest {
	
	@Autowired
	UserBO userBO;

	@Transactional	// rollback
	// @Test
	void 유저추가테스트() {
		userBO.addUser("test11", "test22", "test33", "test44");
	}
	
	@Test
	void 유저가져오기() {
		User user = userBO.getUserByLoginIdPassword("111", "aaa");
		assertNotNull(user);
		
		String a = null;
		if (StringUtils.isEmpty(a)) {
			
		}
		
		//if (CollectionUtils.isEmpty(null)) {
			
		//}
	}
}
