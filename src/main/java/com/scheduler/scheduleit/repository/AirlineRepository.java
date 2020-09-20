package com.scheduler.scheduleit.repository;

import java.util.List;

import com.scheduler.scheduleit.domain.Airline;

public interface AirlineRepository {
	
	List<Airline> getAirlinesList();
	int getCount();
	List<Airline> getById(int sr_no);

}
