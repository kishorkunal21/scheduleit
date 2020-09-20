package com.scheduler.scheduleit.config;

import java.sql.SQLException;

import javax.sql.DataSource;

import org.postgresql.ds.PGSimpleDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.jdbc.core.JdbcTemplate;

import com.mysql.cj.jdbc.MysqlDataSource;

import oracle.jdbc.pool.OracleDataSource;

@Configuration
@ComponentScan
public class DataSourceFactory {

	@Bean
	@Primary
	public DataSource getPGDataSource() throws SQLException {
		PGSimpleDataSource dataSource = new PGSimpleDataSource();
		dataSource.setURL("jdbc:postgresql://localhost:5121/scheduleit");
		dataSource.setUser("scheduleit");
		dataSource.setPassword("admin");
		System.out.println("isCOnnection ::;" + (dataSource.getConnection() == null));
		return dataSource;
	}

	@Bean
	@Autowired
	public JdbcTemplate pgJdbcTemplate() throws SQLException {
		return new JdbcTemplate(getPGDataSource());
	}

	public JdbcTemplate getPostgreSqlJdbcTemplate(String url, String username, String password) {
		try {
			PGSimpleDataSource dataSource = new PGSimpleDataSource();
			dataSource.setURL(url);
			dataSource.setUser(username);
			dataSource.setPassword(password);
			return new JdbcTemplate(dataSource);
		} catch (Exception e) {
			return null;
		}

	}

	public JdbcTemplate getOracleJdbcTemplate(String url, String username, String password) {
		try {
			OracleDataSource dataSource = new OracleDataSource();
			dataSource.setURL(url);
			dataSource.setUser(username);
			dataSource.setPassword(password);
			return new JdbcTemplate(dataSource);
		} catch (Exception e) {
			return null;
		}
	}

	public JdbcTemplate getMysqlJdbcTemplate(String url, String username, String password) {
		try {
			MysqlDataSource dataSource = new MysqlDataSource();
			dataSource.setURL(url);
			dataSource.setUser(username);
			dataSource.setPassword(password);
			return new JdbcTemplate(dataSource);
		} catch (Exception e) {
			return null;
		}
	}

	/*
	 * @Bean public DataSource getSourceDataSource() throws SQLException {
	 * PGSimpleDataSource dataSource = new PGSimpleDataSource();
	 * dataSource.setURL("jdbc:postgresql://localhost:5121/scheduleit");
	 * dataSource.setUser("scheduleit"); dataSource.setPassword("admin");
	 * System.out.println("isCOnnection ::;" + (dataSource.getConnection() ==
	 * null)); return dataSource; }
	 * 
	 * @Bean public DataSource getDestinationDataSource() throws SQLException {
	 * PGSimpleDataSource dataSource = new PGSimpleDataSource();
	 * dataSource.setURL("jdbc:postgresql://localhost:5121/scheduleit");
	 * dataSource.setUser("scheduleit"); dataSource.setPassword("admin");
	 * System.out.println("isCOnnection ::;" + (dataSource.getConnection() ==
	 * null)); return dataSource; }
	 */

	/*
	 * @Bean public DataSource getMysqlDataSource() { MysqlDataSource dataSource =
	 * new MysqlDataSource(); dataSource.setURL(
	 * "jdbc:mysql://localhost:33060/scheduleit?allowMultiQueries=true&useSSL=false"
	 * ); dataSource.setUser("scheduleit"); dataSource.setPassword("scheduleit");
	 * return dataSource; }
	 */
}
