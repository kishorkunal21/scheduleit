package com.scheduler.scheduleit.domain;

public class Airline {

	private int sr_no;

	private String airline;
	
	private long avail_seat_km_per_week;

	private int  incidents_85_99, fatal_accidents_85_99, fatalities_85_99, incidents_00_14,
			fatal_accidents_00_14, fatalities_00_14;

	public Airline(int sr_no, String airline, long avail_seat_km_per_week, int incidents_85_99,
			int fatal_accidents_85_99,int fatalities_85_99,int incidents_00_14,
			int fatal_accidents_00_14,int fatalities_00_14) {
		this.sr_no = sr_no;
		this.airline = airline;
		this.avail_seat_km_per_week = avail_seat_km_per_week;
		this.incidents_85_99=incidents_85_99;
		this.fatal_accidents_85_99=fatal_accidents_85_99;
		this.fatalities_85_99=fatalities_85_99;
		this.incidents_00_14=incidents_00_14;
		this.fatal_accidents_00_14=fatal_accidents_00_14;
		this.fatalities_00_14=fatalities_00_14;
		
	}
	
	public Airline() {}

	public String getAirline() {
		return airline;
	}

	public void setAirline(String airline) {
		this.airline = airline;
	}

	public int getSr_no() {
		return sr_no;
	}

	public void setSr_no(int sr_no) {
		this.sr_no = sr_no;
	}

	public long getAvail_seat_km_per_week() {
		return avail_seat_km_per_week;
	}

	public void setAvail_seat_km_per_week(long avail_seat_km_per_week) {
		this.avail_seat_km_per_week = avail_seat_km_per_week;
	}

	public int getIncidents_85_99() {
		return incidents_85_99;
	}

	public void setIncidents_85_99(int incidents_85_99) {
		this.incidents_85_99 = incidents_85_99;
	}

	public int getFatal_accidents_85_99() {
		return fatal_accidents_85_99;
	}

	public void setFatal_accidents_85_99(int fatal_accidents_85_99) {
		this.fatal_accidents_85_99 = fatal_accidents_85_99;
	}

	public int getFatalities_85_99() {
		return fatalities_85_99;
	}

	public void setFatalities_85_99(int fatalities_85_99) {
		this.fatalities_85_99 = fatalities_85_99;
	}

	public int getIncidents_00_14() {
		return incidents_00_14;
	}

	public void setIncidents_00_14(int incidents_00_14) {
		this.incidents_00_14 = incidents_00_14;
	}

	public int getFatal_accidents_00_14() {
		return fatal_accidents_00_14;
	}

	public void setFatal_accidents_00_14(int fatal_accidents_00_14) {
		this.fatal_accidents_00_14 = fatal_accidents_00_14;
	}

	public int getFatalities_00_14() {
		return fatalities_00_14;
	}

	public void setFatalities_00_14(int fatalities_00_14) {
		this.fatalities_00_14 = fatalities_00_14;
	}

}
