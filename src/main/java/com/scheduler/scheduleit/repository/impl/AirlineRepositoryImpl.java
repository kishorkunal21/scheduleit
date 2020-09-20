package com.scheduler.scheduleit.repository.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.scheduler.scheduleit.domain.Airline;
import com.scheduler.scheduleit.repository.AirlineRepository;

@Repository
public class AirlineRepositoryImpl implements AirlineRepository {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	public int getCount() {
		int count = 0;
		try {

			count = jdbcTemplate.queryForObject("select count(*) from airline_safety", Integer.class);
			System.out.println("airline_safety count = " + count);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return count;
	}

	@Override
	public List<Airline> getAirlinesList() {
		return jdbcTemplate.query("select sr_no, airline, avail_seat_km_per_week,	incidents_85_99,"
				+ " fatal_accidents_85_99, fatalities_85_99, incidents_00_14,"
				+ " fatal_accidents_00_14, fatalities_00_14 from airline_safety", new AirlineMapper());
	}

	@Override
	public List<Airline> getById(int sr_no) {
		return jdbcTemplate.query(
				"select sr_no, airline, avail_seat_km_per_week,	incidents_85_99,"
						+ " fatal_accidents_85_99, fatalities_85_99, incidents_00_14,"
						+ "	fatal_accidents_00_14, fatalities_00_14 from airline_safety where sr_no=? ",
				new Object[] { sr_no }, new AirlineMapper());
	}

	public static final class AirlineMapper implements RowMapper<Airline> {

		@Override
		public Airline mapRow(ResultSet rs, int rowNum) throws SQLException {
			Airline airline = new Airline();
			airline.setSr_no(rs.getInt("sr_no"));
			airline.setAirline(rs.getString("airline"));
			airline.setAvail_seat_km_per_week(rs.getLong("avail_seat_km_per_week"));
			airline.setIncidents_85_99(rs.getInt("incidents_85_99"));
			airline.setFatal_accidents_85_99(rs.getInt("fatal_accidents_85_99"));
			airline.setFatalities_85_99(rs.getInt("fatalities_85_99"));
			airline.setIncidents_00_14(rs.getInt("incidents_00_14"));
			airline.setFatal_accidents_00_14(rs.getInt("fatal_accidents_00_14"));
			airline.setFatalities_00_14(rs.getInt("fatalities_00_14"));

			return airline;
		}

	}

}
