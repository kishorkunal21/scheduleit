package com.scheduler.scheduleit.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.scheduler.scheduleit.config.Constants;
import com.scheduler.scheduleit.config.JobEngine;
import com.scheduler.scheduleit.domain.Connections;
import com.scheduler.scheduleit.domain.Job;
import com.scheduler.scheduleit.domain.JobQuery;
import com.scheduler.scheduleit.service.ExportToDatabaseService;
import com.scheduler.scheduleit.service.JobService;

@Controller
@SessionAttributes({ "job", "connections" })
public class SchedulerController {

	@Autowired
	JobService jobService;

	@Autowired
	JobEngine jobEngine;

	@Autowired
	ExportToDatabaseService exportToDatabaseService;

	@RequestMapping("/")
	public String job(Model model, @RequestParam(required = false, name = "msg") String msg) {
		List<Job> list = jobService.getJobList();
		model.addAttribute("jobList", list);
		model.addAttribute("msg", msg);
		return "jobList";
	}

	@RequestMapping(value = "/createJob", method = RequestMethod.GET)
	public String createJobClear(Model model) {
		Job job = new Job();
		model.addAttribute("job", job);
		return "jobForm";
	}

	@RequestMapping(value = "/createJob", method = RequestMethod.POST, params = "Clear")
	public String createJob(Model model) {
		Job job = new Job();
		model.addAttribute("job", job);
		return "jobForm";
	}

	@RequestMapping(value = "/createJob", method = RequestMethod.POST, params = "Save")
	public String createJobProcess(@ModelAttribute("job") Job job) {
		String msg = Constants.EMPTY;
		if (job.getJob_id() > 0)
			msg = jobService.updateJob(job);
		else
			msg = jobService.createJob(job);
		System.out.println("msg : " + msg);
		jobEngine.reload();
		return "redirect:/?msg=" + msg;
	}

	@RequestMapping("/getJobById")
	public String jobForm(@RequestParam("job_id") int job_id, Model model) {
		model.addAttribute("job", jobService.getJobById(job_id));
		return "jobForm";

	}

	@RequestMapping(value = "/connections", method = RequestMethod.GET)
	public String connections(@RequestParam("job_id") int job_id, @RequestParam(required = false) String message,
			Model model) {
		Connections connections = new Connections();
		if (jobService.getConnectionsById(job_id) != null)
			connections = jobService.getConnectionsById(job_id);
		model.addAttribute("job", jobService.getJobById(job_id));
		model.addAttribute("connections", connections);
		model.addAttribute("message", message);
		return "connections";
	}

	@RequestMapping(value = "/create-connections", method = RequestMethod.POST, params = "Save")
	public String saveConnection(@ModelAttribute("connections") Connections connections, Model model) {
		String message = Constants.EMPTY;
		if (connections.getConnection_id() > 0)
			message = jobService.updateConnection(connections);
		else
			message = jobService.createConnection(connections);
		System.out.println("message : " + message);

		return "redirect:/connections?job_id=" + connections.getJob_id() + "&message=" + message;
	}

	@RequestMapping(value = "/create-connections", method = RequestMethod.POST, params = "TestConnection")
	public String testConnection(@ModelAttribute("connections") Connections connections, Model model) {
		String message = Constants.EMPTY;
		if (connections.getConnection_id() > 0) {
			jobService.updateConnection(connections);
			message = jobService.testConnection(connections, connections.getConnection_type());
		}
		return "redirect:/connections?job_id=" + connections.getJob_id() + "&message=" + message;
	}

	@RequestMapping(value = "/jobconfig-database", method = RequestMethod.GET)
	public String jobConfigExportToDatabase(@SessionAttribute("connections") Connections connections, Model model) {
		JobQuery jobQuery = new JobQuery();
		if (exportToDatabaseService.getQueryById(connections) != null)
			jobQuery = exportToDatabaseService.getQueryById(connections);
		model.addAttribute("connections", connections);
		model.addAttribute("jobQuery", jobQuery);
		model.addAttribute("table_name", Constants.EMPTY);
		return "jobConfigExportToDatabase";
	}

	@RequestMapping(value = "/jobconfig-database", method = RequestMethod.POST, params = "FetchMetadata")
	public String jobConfigExportToDatabaseFetchMetadata(@SessionAttribute("connections") Connections connections,
			@ModelAttribute("jobQuery") JobQuery jobQuery, Model model,
			@RequestParam(required = false, name = "table_name") String table_name) {

		ArrayList<String> tableMetadata = new ArrayList<String>();
		if (exportToDatabaseService.getQueryById(connections) != null)
			jobQuery = exportToDatabaseService.getQueryById(connections);
		model.addAttribute("connections", connections);
		model.addAttribute("jobQuery", jobQuery);

		System.out.println("table_name==" + table_name);
		if (table_name != null)
			tableMetadata = exportToDatabaseService.getMetaData(table_name, connections);
		System.out.println(Arrays.toString(tableMetadata.toArray()));
		model.addAttribute("tableMetadata", tableMetadata);
		model.addAttribute("table_name", table_name);
		return "jobConfigExportToDatabase";
	}

	@RequestMapping(value = "/jobconfig-database", method = RequestMethod.POST, params = "Save")
	public String jobConfigExportToDatabaseSave(@SessionAttribute("connections") Connections connections,
			@ModelAttribute("jobQuery") JobQuery jobQuery, Model model,
			@RequestParam(required = false, name = "table_name") String table_name) {
		String message = Constants.EMPTY;
		if (jobQuery.getJob_query_id() > 0)
			message = exportToDatabaseService.updateQuery(jobQuery);
		else
			message = exportToDatabaseService.createQuery(jobQuery);

		System.out.println("message : " + message);
		model.addAttribute("table_name", Constants.EMPTY);
		return "redirect:/jobconfig-database?message=" + message;
	}

	@ModelAttribute
	private Model loadDropdownList(Model model) {
		model.addAttribute("jobMinutesList", Constants.jobMinutes());
		model.addAttribute("jobHoursList", Constants.jobHours());
		model.addAttribute("jobDayMonthsList", Constants.jobDayMonths());
		model.addAttribute("jobTypeList", Constants.jobType());
		model.addAttribute("jobWeekDaysList", Constants.jobWeekDays());
		model.addAttribute("connectionsDriverList", Constants.connectionDriver());
		return model;
	}

}
