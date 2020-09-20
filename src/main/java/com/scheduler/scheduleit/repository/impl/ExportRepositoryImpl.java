package com.scheduler.scheduleit.repository.impl;

import java.beans.Statement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Wrapper;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.scheduler.scheduleit.repository.ExportRepository;
import com.scheduler.scheduleit.repository.impl.JobRepositoryImpl.JobMapper;

@Repository
public class ExportRepositoryImpl implements ExportRepository{

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public void exportData() {
		java.sql.Statement stmt =null;
		try {
			Connection con =   jdbcTemplate.getDataSource().getConnection();
			
			stmt = con.createStatement();
			ResultSet rs =stmt.executeQuery("select * from airline_safety");
			ResultSetMetaData rsmt =rs.getMetaData();
			
			for(int i=1;i<=rsmt.getColumnCount();i++) {
				System.out.println("Columns :"+rsmt.getColumnName(i)+" Type : "+rsmt.getColumnTypeName(i));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
		
		

}
