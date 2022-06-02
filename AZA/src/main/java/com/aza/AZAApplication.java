package com.aza;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.boot.autoconfigure.jdbc.DataSourceTransactionManagerAutoConfiguration;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.ImportResource;
import org.springframework.context.annotation.PropertySource;


/*
 * @EnableAutoConfiguration(exclude = {
 * DataSourceTransactionManagerAutoConfiguration.class,
 * DataSourceAutoConfiguration.class })
 */
//@MapperScan(basePackages = "com.aza.*" )
@SpringBootApplication(exclude={DataSourceAutoConfiguration.class})
@PropertySource("application.properties")
@ImportResource(value= {/*"config/context-aspect.xml",*/
						"config/context-common.xml",
						"config/context-mybatis.xml", 
						"config/context-transaction.xml" })
@Configuration
public class AZAApplication {

	public static void main(String[] args) {
		SpringApplication.run(AZAApplication.class, args);
	}

}
