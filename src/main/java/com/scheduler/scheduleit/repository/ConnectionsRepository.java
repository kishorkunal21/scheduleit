package com.scheduler.scheduleit.repository;

import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;

import com.scheduler.scheduleit.domain.Connections;

public interface ConnectionsRepository {

	List<Connections> getConnectionsById(int job_id);

	List<Connections> getConnectionsList();

	String createConnection(Connections job);

	String updateConnection(Connections job);

	String testConnection(Connections connections, int connection_type);

	JdbcTemplate getSourceConnection(Connections connections);

	JdbcTemplate getTargetConnection(Connections connections);
}
