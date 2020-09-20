package com.scheduler.scheduleit.repository;

import java.util.List;

import com.scheduler.scheduleit.domain.Connections;

public interface ConnectionsRepository {

	int getMaxId(String table_name, String column_name);

	List<Connections> getConnectionsById(int job_id);

	List<Connections> getConnectionsList();

	String createConnection(Connections job);

	String updateConnection(Connections job);

	String testConnection(Connections connections, int connection_type);
}
