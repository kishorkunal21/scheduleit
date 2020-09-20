package com.scheduler.scheduleit.service.impl;

import org.springframework.stereotype.Service;

import com.scheduler.scheduleit.service.ExportToFileService;

@Service
public class ExportToFileServiceImpl implements ExportToFileService {

	@Override
	public void exportData(int job_id) {
		System.out.println(Thread.currentThread().getName());
		System.out.println("Inside ExportToFileService for job_id::" + job_id);

	}

}
