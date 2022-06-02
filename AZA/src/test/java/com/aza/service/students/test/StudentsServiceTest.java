package com.aza.service.students.test;

import static org.assertj.core.api.Assertions.assertThat;

import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.context.SpringBootTest.WebEnvironment;
import org.springframework.boot.test.web.client.TestRestTemplate;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.PropertySource;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.aza.service.domain.Students;
import com.aza.service.students.StudentsService;

import lombok.extern.slf4j.Slf4j;

@RunWith(SpringRunner.class)
@SpringBootTest(webEnvironment = WebEnvironment.RANDOM_PORT)
@PropertySource("classpath:/application.properties")
@Slf4j
@ComponentScan(basePackages = "com.aza.configuration")
@ContextConfiguration(locations = { "classpath:sql/**Mapper.xml", 
									"classpath:config/context-common.xml",
		 							"classpath:config/context-mybatis.xml", 
									"classpath:config/context-transaction.xml" })
public class StudentsServiceTest {

	@Autowired
	@Qualifier("studentsServiceImpl")
	private StudentsService studentsService;
	
	//@Test
	public void testAddStudentsRecord(Students students) throws Exception {
		
		
		
		
	}
	
	//@Test
	public void testGetStudentsRecord(int recordCode) throws Exception {
		
		System.out.println("시작");
		Students students = new Students();
		
		students = studentsService.getStudentsRecord(1023);
		
		System.out.println(students);
		
	}

}
