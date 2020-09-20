package com.scheduler.scheduleit.repository.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.scheduler.scheduleit.config.DataSourceFactory;
import com.scheduler.scheduleit.domain.Connections;
import com.scheduler.scheduleit.repository.ConnectionsRepository;

@Repository
public class ConnectionsRepositoryImpl implements ConnectionsRepository {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Autowired
	DataSourceFactory dataSourceFactory;

	@Override
	public List<Connections> getConnectionsById(int job_id) {

		return jdbcTemplate.query(
				"select connection_id, job_id, connection_type, connection_name, connection_url, connection_username, "
						+ "connection_password, disabled, connection_driver, connection_driver_target, connection_url_target, "
						+ "connection_username_target, connection_password_target,connection_name_target\r\n"
						+ "	 from connections where job_id=?",
				new Object[] { job_id }, new ConnectionsMapper());
	}

	@Override
	public List<Connections> getConnectionsList() {
		return jdbcTemplate.query(
				"select connection_id, job_id, connection_type, connection_name, connection_url, connection_username, "
						+ "connection_password, disabled, connection_driver, connection_driver_target, connection_url_target, "
						+ "connection_username_target, connection_password_target,connection_name_target from connections",
				new ConnectionsMapper());
	}

	@Override
	public String updateConnection(Connections connections) {
		int result = jdbcTemplate.update(
				"update connections set connection_id=?, connection_type=?, connection_name=?, connection_url=?,"
						+ "connection_username=?, connection_password=?, disabled=?, connection_driver=?,"
						+ "connection_driver_target=?, connection_url_target=?, connection_username_target=?, connection_password_target=?,"
						+ "connection_name_target=? where job_id=?",
				connections.getConnection_id(), connections.getConnection_type(), connections.getConnection_name(),
				connections.getConnection_url(), connections.getConnection_username(),
				connections.getConnection_password(), connections.getDisabled(), connections.getConnection_driver(),
				connections.getConnection_driver_target(), connections.getConnection_url_target(),
				connections.getConnection_username_target(), connections.getConnection_password_target(),
				connections.getConnection_name_target(), connections.getJob_id());

		return result + " record updated for Connections";
	}

	@Override
	public String createConnection(Connections connections) {
		String msg = "Insert Failed !";
		int connection_id = this.getMaxId("connections", "connection_id") + 1;
		int result = jdbcTemplate.update("INSERT INTO connections("
				+ "	connection_id, job_id, connection_type, connection_name, connection_url, "
				+ " connection_username, connection_password, disabled, connection_driver,"
				+ " connection_driver_target, connection_url_target, connection_username_target, connection_password_target,connection_name_target)"
				+ "	VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?)", connection_id, connections.getJob_id(),
				connections.getConnection_type(), connections.getConnection_name(), connections.getConnection_url(),
				connections.getConnection_username(), connections.getConnection_password(), connections.getDisabled(),
				connections.getConnection_driver(), connections.getConnection_driver_target(),
				connections.getConnection_url_target(), connections.getConnection_username_target(),
				connections.getConnection_password_target(), connections.getConnection_name_target());

		if (result == 1)
			msg = "Connection created !!";
		return msg;
	}

	@Override
	public int getMaxId(String table_name, String column_name) {
		int count = 0;
		try {
			count = jdbcTemplate.queryForObject("select max(" + column_name + ") from " + table_name + "",
					Integer.class);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	public static final class ConnectionsMapper implements RowMapper<Connections> {
		@Override
		public Connections mapRow(ResultSet rs, int rowNum) throws SQLException {
			Connections connections = new Connections();
			connections.setJob_id(rs.getInt("job_id"));
			connections.setConnection_id(rs.getInt("connection_id"));
			connections.setConnection_type(rs.getInt("connection_type"));
			connections.setConnection_name(rs.getString("connection_name"));
			connections.setDisabled(rs.getString("disabled"));
			connections.setConnection_url(rs.getString("connection_url"));
			connections.setConnection_username(rs.getString("connection_username"));
			connections.setConnection_password(rs.getString("connection_password"));
			connections.setConnection_driver(rs.getInt("connection_driver"));
			connections.setConnection_driver_target(rs.getInt("connection_driver_target"));
			connections.setConnection_url_target(rs.getString("connection_url_target"));
			connections.setConnection_username_target(rs.getString("connection_username_target"));
			connections.setConnection_password_target(rs.getString("connection_password_target"));
			connections.setConnection_name_target(rs.getString("connection_name_target"));

			return connections;
		}

	}

	@Override
	public String testConnection(Connections connections, int connection_type) {
		JdbcTemplate jdbcTemplate = null;
		if (connection_type == 0) {
			if (connections.getConnection_driver() == 1)
				jdbcTemplate = dataSourceFactory.getPostgreSqlJdbcTemplate(connections.getConnection_url(),
						connections.getConnection_username(), connections.getConnection_password());
			if (connections.getConnection_driver() == 2)
				jdbcTemplate = dataSourceFactory.getOracleJdbcTemplate(connections.getConnection_url(),
						connections.getConnection_username(), connections.getConnection_password());
			if (connections.getConnection_driver() == 3)
				jdbcTemplate = dataSourceFactory.getMysqlJdbcTemplate(connections.getConnection_url(),
						connections.getConnection_username(), connections.getConnection_password());

		} else if (connection_type == 1) {
			if (connections.getConnection_driver_target() == 1)
				jdbcTemplate = dataSourceFactory.getPostgreSqlJdbcTemplate(connections.getConnection_url_target(),
						connections.getConnection_username_target(), connections.getConnection_password_target());
			if (connections.getConnection_driver_target() == 2)
				jdbcTemplate = dataSourceFactory.getOracleJdbcTemplate(connections.getConnection_url_target(),
						connections.getConnection_username(), connections.getConnection_password());
			if (connections.getConnection_driver_target() == 3)
				jdbcTemplate = dataSourceFactory.getMysqlJdbcTemplate(connections.getConnection_url_target(),
						connections.getConnection_username_target(), connections.getConnection_password_target());

		}

		try {
			if (jdbcTemplate.getDataSource().getConnection() != null)
				return "Connected";
			else
				return "Failed to connect";
		} catch (SQLException e) {
			e.printStackTrace();
			return "Failed to connect";
		}

	}

}
