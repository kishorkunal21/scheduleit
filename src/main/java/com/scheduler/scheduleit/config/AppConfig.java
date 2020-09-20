package com.scheduler.scheduleit.config;

import org.springframework.context.annotation.Bean;
import org.springframework.scheduling.concurrent.ThreadPoolTaskScheduler;
import org.springframework.stereotype.Component;

//@Configuration
@Component
public class AppConfig {

	@Bean
	public ThreadPoolTaskScheduler jobThreadPoolTaskScheduler() {
		ThreadPoolTaskScheduler threadPoolTaskScheduler = new ThreadPoolTaskScheduler();
		threadPoolTaskScheduler.setPoolSize(10);
		threadPoolTaskScheduler.initialize();
		return threadPoolTaskScheduler;
	}

}
