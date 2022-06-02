package com.aza.configuration;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.ImportResource;
import org.springframework.context.annotation.Primary;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.stereotype.Component;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

@Configuration
@PropertySource("classpath:/application.properties")
@Component
public class DBConfiguration {

	@Autowired
	private ApplicationContext applicationContext;
	
	@ConfigurationProperties(prefix="spring.datasource.hikari")
	@Bean
	public HikariConfig hikariConfig() {
		return new HikariConfig();
	}
	
	@Primary
	@Bean
	public DataSource dataSource() {
		return new HikariDataSource(hikariConfig());
	}
	
	@Bean
	public SqlSessionFactory sqlSessionFactory() throws Exception {
		SqlSessionFactoryBean factoryBean = new SqlSessionFactoryBean();
		factoryBean.setDataSource(dataSource());
		factoryBean.setMapperLocations(applicationContext.getResources("classpath:/sql/**/*Mapper.xml"));
		factoryBean.setTypeAliasesPackage("com.aza.service.domain");
		factoryBean.setConfiguration(mybatisConfg());
		
		return factoryBean.getObject();
	}
	
	@Bean
	public SqlSessionTemplate sqlSession() throws Exception {
		return new SqlSessionTemplate(sqlSessionFactory());
	}
	
	@Bean
	@ConfigurationProperties(prefix = "mybatis.configuration")
	public org.apache.ibatis.session.Configuration mybatisConfg() {
		return new org.apache.ibatis.session.Configuration();
	}
	
//	@Bean
//	public DataSource dataSource() throws Exception {
//		DriverManagerDataSource dataSource = new DriverManagerDataSource();
//		
//		dataSource.setDriverClassName("oracle.jdbc.OracleDriver");
//		dataSource.setUrl("jdbc:oracle:thin:@localhost:1521/xe");
//		dataSource.setUsername("aza");
//		dataSource.setPassword("aza");
//		
//		return dataSource;
//	}
	
//    @Bean
//    public DataSource dataSource() {
//        return DataSourceBuilder.create()
//                                .url("jdbc:oracle:thin:@localhost:1521/xe")
//                                .driverClassName("oracle.jdbc.OracleDriver")
//                                .username("aza")
//                                .password("aza")
//                                .build();
//    }
//    
//	
//	@Bean("sqlSessionFactory")
//	public SqlSessionFactory sqlSessionFactory(DataSource dataSource) throws Exception {
//		
//		SqlSessionFactoryBean factoryBean = new SqlSessionFactoryBean();
//		factoryBean.setDataSource(dataSource());
//		
//		factoryBean.setMapperLocations(applicationContext.getResources("classpath:/sql/**.xml"));
//		factoryBean.setTypeAliasesPackage("com.aza.service.domain");
////		factoryBean.setConfiguration(mybatisConfig());
//		
//		return factoryBean.getObject();		
//		
////		SqlSessionFactoryBean sessionFactory = new SqlSessionFactoryBean();
////        sessionFactory.setDataSource(dataSource);
////        
////        Resource[] res = new PathMatchingResourcePatternResolver().getResources("classpath:/sql/**.xml");
////        
////        sessionFactory.setMapperLocations(res);
////        
////        return sessionFactory.getObject();
//	}
//	
//	@Bean
//	public SqlSessionTemplate sqlSession(SqlSessionFactory sqlSessionFactory) throws Exception{
//		return new SqlSessionTemplate(sqlSessionFactory);
//	}
//	
////	@Bean
////	@ConfigurationProperties(prefix = "mybatis.configuration") 
////	public org.apache.ibatis.session.Configuration mybatisConfig() {
////		return new org.apache.ibatis.session.Configuration();
////	}
////	
	

}
