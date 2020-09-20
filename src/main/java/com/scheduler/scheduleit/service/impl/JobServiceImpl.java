package com.scheduler.scheduleit.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.scheduler.scheduleit.domain.Connections;
import com.scheduler.scheduleit.domain.Job;
import com.scheduler.scheduleit.repository.ConnectionsRepository;
import com.scheduler.scheduleit.repository.JobRepository;
import com.scheduler.scheduleit.service.JobService;

@Service
public class JobServiceImpl implements JobService {

	@Autowired
	private JobRepository jobRepository;

	@Autowired
	private ConnectionsRepository connectionsRepository;

	@Override
	public int getJobCount() {
		return jobRepository.getJobCount();
	}

	@Override
	public List<Job> getJobList() {
		return jobRepository.getJobList();
	}

	@Override
	public Job getJobById(int job_id) {
		if (jobRepository.getJobById(job_id) != null && jobRepository.getJobById(job_id).size() > 0)
			return jobRepository.getJobById(job_id).get(0);
		else
			return null;
	}

	@Override
	public String createJob(Job job) {
		return jobRepository.createJob(job);
	}

	@Override
	public String updateJob(Job job) {
		return jobRepository.updateJob(job);
	}

	@Override
	public Connections getConnectionsById(int job_id) {
		if (connectionsRepository.getConnectionsById(job_id) != null
				&& connectionsRepository.getConnectionsById(job_id).size() > 0)
			return connectionsRepository.getConnectionsById(job_id).get(0);
		else
			return null;
	}

	@Override
	public List<Connections> getConnectionsList() {
		return connectionsRepository.getConnectionsList();
	}

	@Override
	public String createConnection(Connections connections) {
		return connectionsRepository.createConnection(connections);
	}

	@Override
	public String updateConnection(Connections connections) {
		return connectionsRepository.updateConnection(connections);
	}

	@Override
	public String testConnection(Connections connections, int connection_type) {
		return connectionsRepository.testConnection(connections, connection_type);
	}

}
