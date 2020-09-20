package com.scheduler.scheduleit.repository;

import java.util.List;

import com.scheduler.scheduleit.domain.Job;

public interface JobRepository {

	int getJobCount();

	List<Job> getJobList();

	List<Job> getJobById(int job_id);

	String createJob(Job job);

	String updateJob(Job job);

	int getMaxId(String table_name, String column_name);

}
