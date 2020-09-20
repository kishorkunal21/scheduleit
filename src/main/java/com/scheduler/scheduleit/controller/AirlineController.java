package com.scheduler.scheduleit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.scheduler.scheduleit.domain.Airline;
import com.scheduler.scheduleit.repository.AirlineRepository;
import com.scheduler.scheduleit.service.AirlineService;

@Controller
@RequestMapping("/airline")
public class AirlineController {

	@Autowired
	AirlineService airlineService;

	@RequestMapping("/")
	public String airline(Model model) {
		System.out.println("airlineRepository.getCount()=" + airlineService.getCount());
		List<Airline> list = airlineService.getAirlinesList();
		System.out.println("airlineRepository.size()=" + list.size());
		model.addAttribute("airlineList", list);
		return "airline";
	}

	@RequestMapping("/getById")
	public String airlineDetails(@RequestParam("sr_no") int sr_no, Model model) {
		System.out.println("sr_no=="+sr_no);
		model.addAttribute("airlineList", airlineService.getById(sr_no));
		return "airlineDetails";
	}
}
