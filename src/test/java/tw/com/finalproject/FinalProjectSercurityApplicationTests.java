package tw.com.finalproject;

import java.io.IOException;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.password.PasswordEncoder;

import tw.com.finalproject.yumyu.Initial.DefaultClient;
import tw.com.finalproject.yumyu.Initial.DefaultEmployee;
import tw.com.finalproject.yumyu.Initial.DefaultMember;
import tw.com.finalproject.yumyu.MemberOrder.Service.MemberOrderService;

@SpringBootTest
class FinalProjectSercurityApplicationTests {

	@Autowired
	private MemberOrderService service;
	
	@Test
	void contextLoads() throws IOException {
		
	}

}