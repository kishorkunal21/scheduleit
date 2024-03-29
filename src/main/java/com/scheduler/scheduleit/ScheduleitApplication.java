package com.scheduler.scheduleit;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableScheduling
public class ScheduleitApplication {

	public static void main(String[] args) {
		SpringApplication.run(ScheduleitApplication.class, args);
	}

	/*
	 * @Bean public CommandLineRunner commandLineRunner(ApplicationContext ctx) {
	 * return args -> {
	 * 
	 * System.out.println("Let's inspect the beans provided by Spring Boot:");
	 * 
	 * String[] beanNames = ctx.getBeanDefinitionNames(); Arrays.sort(beanNames);
	 * for (String beanName : beanNames) { System.out.println(beanName); }
	 * 
	 * };
	 * 
	 * }
	 */

}
