package com.scheduler.scheduleit.service;

import java.util.List;

import com.scheduler.scheduleit.domain.Airline;

public interface AirlineService {
	
	void updateAirline(int sr_no);
	Airline getById(int sr_no);
	List<Airline> getAirlinesList();
	int getCount();
}
