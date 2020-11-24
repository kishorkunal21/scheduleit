package com.scheduler.scheduleit.config;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.scheduling.concurrent.ThreadPoolTaskScheduler;
import org.springframework.scheduling.support.CronTrigger;
import org.springframework.stereotype.Component;

import com.scheduler.scheduleit.domain.Job;
import com.scheduler.scheduleit.service.ExportToDatabaseService;
import com.scheduler.scheduleit.service.ExportToFileService;
import com.scheduler.scheduleit.service.ExportToMailService;
import com.scheduler.scheduleit.service.JobService;

@Component
public class JobEngine {
	@Autowired
	ConfigurableApplicationContext context;

	@Autowired
	JobService jobService;

	@Autowired
	ExportToDatabaseService exportToDatabaseService;

	@Autowired
	ExportToFileService exportToFileService;

	@Autowired
	ExportToMailService exportToMailService;

	@Autowired
	ThreadPoolTaskScheduler threadPoolTaskScheduler;

	@Autowired
	AppConfig appConfig;

	private boolean isReload = false;

	@Bean
	public void taskScheduler() {

		threadPoolTaskScheduler.setPoolSize(10);
		List<Job> jobList = jobService.getJobList();

		System.out.println("ActiveCount : " + threadPoolTaskScheduler.getActiveCount() + " | PoolSize : "
				+ threadPoolTaskScheduler.getPoolSize());

		System.out.println("jobList.size::" + jobList.size());
		for (Job job : jobList) {
			if (job.getJob_type() == 1) {
				System.out.println("For " + job.getJob_id() + " " + job.getCron_expression());
				threadPoolTaskScheduler.schedule(() -> {
					Thread.currentThread().setName("JOB_" + job.getJob_id());
					exportToFileService.exportData(job.getJob_id());
				}, new CronTrigger(job.getCron_expression()));

			} else if (job.getJob_type() == 2) {
				Thread.currentThread().setName("JOB_" + job.getJob_id());
				System.out.println("For " + job.getJob_id() + " " + job.getCron_expression());

				threadPoolTaskScheduler.schedule(() -> {
					exportToMailService.exportData(job.getJob_id());
				}, new CronTrigger(job.getCron_expression()));

			} else if (job.getJob_type() == 3) {
				Thread.currentThread().setName("JOB_" + job.getJob_id());
				System.out.println("For " + job.getJob_id() + " " + job.getCron_expression());

				threadPoolTaskScheduler.schedule(() -> {
					exportToDatabaseService.executeJob(job.getJob_id());
				}, new CronTrigger(job.getCron_expression()));
			}

		}

		System.out.println("ActiveCount : " + threadPoolTaskScheduler.getActiveCount() + " | PoolSize : "
				+ threadPoolTaskScheduler.getPoolSize());

	}

	public void reload() {
		this.isReload = true;
		threadPoolTaskScheduler.shutdown();
		threadPoolTaskScheduler = appConfig.jobThreadPoolTaskScheduler();
		taskScheduler();

	}
}
