package com.scheduler.scheduleit.repository.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.scheduler.scheduleit.repository.MailRepository;

@Repository
public class MailRepositoryImpl implements MailRepository {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	public void getMailingList() {
		java.sql.Statement stmt = null;
		try {
			Connection con = jdbcTemplate.getDataSource().getConnection();

			stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from airline_safety");
			ResultSetMetaData rsmt = rs.getMetaData();

			for (int i = 1; i <= rsmt.getColumnCount(); i++) {
				System.out.println("Columns :" + rsmt.getColumnName(i) + " Type : " + rsmt.getColumnTypeName(i));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
