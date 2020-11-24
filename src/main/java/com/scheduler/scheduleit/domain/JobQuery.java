package com.scheduler.scheduleit.domain;

public class JobQuery {
	private int connection_id, job_id, job_query_id, connection_type;
	private String job_query_text, job_query_text_target, disabled = "N";

	public int getConnection_id() {
		return connection_id;
	}

	public void setConnection_id(int connection_id) {
		this.connection_id = connection_id;
	}

	public int getJob_id() {
		return job_id;
	}

	public void setJob_id(int job_id) {
		this.job_id = job_id;
	}

	public int getJob_query_id() {
		return job_query_id;
	}

	public void setJob_query_id(int job_query_id) {
		this.job_query_id = job_query_id;
	}

	public int getConnection_type() {
		return connection_type;
	}

	public void setConnection_type(int connection_type) {
		this.connection_type = connection_type;
	}

	public String getJob_query_text() {
		return job_query_text;
	}

	public void setJob_query_text(String job_query_text) {
		this.job_query_text = job_query_text;
	}

	public String getDisabled() {
		return disabled;
	}

	public void setDisabled(String disabled) {
		this.disabled = disabled;
	}

	public String getJob_query_text_target() {
		return job_query_text_target;
	}

	public void setJob_query_text_target(String job_query_text_target) {
		this.job_query_text_target = job_query_text_target;
	}

}
