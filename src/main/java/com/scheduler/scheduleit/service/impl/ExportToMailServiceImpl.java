package com.scheduler.scheduleit.service.impl;

import org.springframework.stereotype.Service;

import com.scheduler.scheduleit.service.ExportToMailService;

@Service
public class ExportToMailServiceImpl implements ExportToMailService {

	@Override
	public void exportData(int job_id) {
		System.out.println(Thread.currentThread().getName());
		System.out.println("Inside ExportToMailService for job_id::" + job_id);

	}

}
