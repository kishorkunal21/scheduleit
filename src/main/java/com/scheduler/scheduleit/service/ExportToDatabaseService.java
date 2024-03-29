package com.scheduler.scheduleit.service;

import java.util.ArrayList;

import com.scheduler.scheduleit.domain.Connections;
import com.scheduler.scheduleit.domain.JobQuery;

public interface ExportToDatabaseService {

	void executeJob(int job_id);

	JobQuery getQueryById(Connections connections);

	String createQuery(JobQuery query);

	String updateQuery(JobQuery query);

	ArrayList<String> getMetaData(String table_name, Connections connections);
}
