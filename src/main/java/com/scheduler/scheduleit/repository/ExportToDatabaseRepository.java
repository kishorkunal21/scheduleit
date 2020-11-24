package com.scheduler.scheduleit.repository;

import java.util.ArrayList;
import java.util.List;

import com.scheduler.scheduleit.domain.Connections;
import com.scheduler.scheduleit.domain.JobQuery;

public interface ExportToDatabaseRepository {

	String executeJob(int job_id);

	String createQuery(JobQuery query);

	String updateQuery(JobQuery query);

	List<JobQuery> getQueryById(Connections connections);

	ArrayList<String> getMetaData(String table_name, Connections connections);

}
