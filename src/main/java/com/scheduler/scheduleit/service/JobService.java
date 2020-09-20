package com.scheduler.scheduleit.service;

import java.util.List;

import com.scheduler.scheduleit.domain.Connections;
import com.scheduler.scheduleit.domain.Job;

public interface JobService {

	String createJob(Job job);

	String updateJob(Job job);

	Job getJobById(int job_id);

	List<Job> getJobList();

	int getJobCount();

	Connections getConnectionsById(int job_id);

	List<Connections> getConnectionsList();

	String createConnection(Connections connections);

	String updateConnection(Connections connections);

	String testConnection(Connections connections, int connection_type);

}
