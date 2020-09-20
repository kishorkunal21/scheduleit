package com.scheduler.scheduleit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.scheduler.scheduleit.config.DropdownLists;
import com.scheduler.scheduleit.config.JobEngine;
import com.scheduler.scheduleit.domain.Connections;
import com.scheduler.scheduleit.domain.Job;
import com.scheduler.scheduleit.service.JobService;

@Controller
public class SchedulerController {

	@Autowired
	JobService jobService;

	@Autowired
	JobEngine jobEngine;

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
		String msg = "";
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

	@RequestMapping(value = "/createConnections", method = RequestMethod.POST, params = "Save")
	public String saveConnection(@ModelAttribute("connections") Connections connections, Model model) {
		String message = "";
		if (connections.getConnection_id() > 0)
			message = jobService.updateConnection(connections);
		else
			message = jobService.createConnection(connections);
		System.out.println("message : " + message);

		return "redirect:/connections?job_id=" + connections.getJob_id() + "&message=" + message;
	}

	@RequestMapping(value = "/createConnections", method = RequestMethod.POST, params = "TestConnection")
	public String testConnection(@ModelAttribute("connections") Connections connections, Model model) {
		String message = "";
		if (connections.getConnection_id() > 0) {
			jobService.updateConnection(connections);
			message = jobService.testConnection(connections, connections.getConnection_type());
		}

		return "redirect:/connections?job_id=" + connections.getJob_id() + "&message=" + message;
	}

	@ModelAttribute
	private Model loadDropdownList(Model model) {
		model.addAttribute("jobMinutesList", DropdownLists.jobMinutes());
		model.addAttribute("jobHoursList", DropdownLists.jobHours());
		model.addAttribute("jobDayMonthsList", DropdownLists.jobDayMonths());
		model.addAttribute("jobTypeList", DropdownLists.jobType());
		model.addAttribute("jobWeekDaysList", DropdownLists.jobWeekDays());
		model.addAttribute("connectionsDriverList", DropdownLists.connectionDriver());

		return model;
	}
}
