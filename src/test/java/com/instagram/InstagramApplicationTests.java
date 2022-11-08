package com.instagram;

import static org.junit.Assert.assertEquals;

import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class InstagramApplicationTests {

	private Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Test
	void contextLoads() {
	}

	@Test
	void 더하기테스트() {
		log.debug("############## 더하기테스트 수행");
		
		int a = 10;
		int b = 20;
		assertEquals(30, a + b);
	}
}
