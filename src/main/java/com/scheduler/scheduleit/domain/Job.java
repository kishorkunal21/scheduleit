package com.scheduler.scheduleit.domain;

public class Job {

	private String job_name, cron_expression, export_path;
	private String disabled = "N";
	private int job_id, user_id, job_type, job_frequency, hours, minutes, month_day, week_day;

	public int getJob_type() {
		return job_type;
	}

	public void setJob_type(int job_type) {
		this.job_type = job_type;
	}

	public String getJob_name() {
		return job_name;
	}

	public void setJob_name(String job_name) {
		this.job_name = job_name;
	}

	public String getCron_expression() {
		return cron_expression;
	}

	public void setCron_expression(String cron_expression) {
		this.cron_expression = cron_expression;
	}

	public String getExport_path() {
		return export_path;
	}

	public void setExport_path(String export_path) {
		this.export_path = export_path;
	}

	public String getDisabled() {
		return disabled;
	}

	public void setDisabled(String disabled) {
		this.disabled = disabled;
	}

	public int getJob_id() {
		return job_id;
	}

	public void setJob_id(int job_id) {
		this.job_id = job_id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public int getJob_frequency() {
		return job_frequency;
	}

	public void setJob_frequency(int job_frequency) {
		this.job_frequency = job_frequency;
	}

	public int getHours() {
		return hours;
	}

	public void setHours(int hours) {
		this.hours = hours;
	}

	public int getMinutes() {
		return minutes;
	}

	public void setMinutes(int minutes) {
		this.minutes = minutes;
	}

	public int getMonth_day() {
		return month_day;
	}

	public void setMonth_day(int month_day) {
		this.month_day = month_day;
	}

	public int getWeek_day() {
		return week_day;
	}

	public void setWeek_day(int week_day) {
		this.week_day = week_day;
	}

}
