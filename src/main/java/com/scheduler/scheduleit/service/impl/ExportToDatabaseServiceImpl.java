package com.scheduler.scheduleit.service.impl;

import org.springframework.stereotype.Service;

import com.scheduler.scheduleit.service.ExportToDatabaseService;

@Service
public class ExportToDatabaseServiceImpl implements ExportToDatabaseService {

	@Override
	public void exportData(int job_id) {
		System.out.println(Thread.currentThread().getName());
		System.out.println("inside ExportToDatabaseService for job_id::" + job_id);

	}

}
