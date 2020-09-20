package com.scheduler.scheduleit.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.scheduler.scheduleit.domain.Airline;
import com.scheduler.scheduleit.repository.AirlineRepository;
import com.scheduler.scheduleit.service.AirlineService;

@Service
public class AirlineServiceImpl implements AirlineService {

	@Autowired
	private AirlineRepository airlineRepository;

	@Override
	public void updateAirline(int sr_no) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<Airline> getAirlinesList() {
		return airlineRepository.getAirlinesList();
	}

	@Override
	public int getCount() {
		return airlineRepository.getCount();
	}

	@Override
	public Airline getById(int sr_no) {
		if (airlineRepository.getById(sr_no) != null)
			return airlineRepository.getById(sr_no).get(0);
		else
			return null;

	}

}
