package com.scheduler.scheduleit.service.impl;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.scheduler.scheduleit.domain.Connections;
import com.scheduler.scheduleit.domain.JobQuery;
import com.scheduler.scheduleit.repository.ExportToDatabaseRepository;
import com.scheduler.scheduleit.service.ExportToDatabaseService;

@Service
public class ExportToDatabaseServiceImpl implements ExportToDatabaseService {
	@Autowired
	ExportToDatabaseRepository exportToDatabaseRepository;

	@Override
	public void executeJob(int job_id) {
		exportToDatabaseRepository.executeJob(job_id);

	}

	@Override
	public String createQuery(JobQuery query) {
		return exportToDatabaseRepository.createQuery(query);

	}

	@Override
	public JobQuery getQueryById(Connections connections) {
		if (exportToDatabaseRepository.getQueryById(connections) != null
				&& exportToDatabaseRepository.getQueryById(connections).size() > 0)
			return exportToDatabaseRepository.getQueryById(connections).get(0);
		else
			return null;
	}

	@Override
	public String updateQuery(JobQuery query) {
		return exportToDatabaseRepository.updateQuery(query);
	}

	@Override
	public ArrayList<String> getMetaData(String table_name, Connections connections) {
		if (table_name.length() > 0)
			return exportToDatabaseRepository.getMetaData(table_name, connections);
		else
			return null;
	}

}
