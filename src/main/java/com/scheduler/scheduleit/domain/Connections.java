package com.scheduler.scheduleit.domain;

public class Connections {
	private int connection_id, job_id, connection_type, connection_driver, connection_driver_target;
	private String connection_name, connection_url, connection_username, connection_password, disabled = "N",
			connection_url_target, connection_username_target, connection_password_target, connection_name_target;

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

	public int getConnection_type() {
		return connection_type;
	}

	public void setConnection_type(int connection_type) {
		this.connection_type = connection_type;
	}

	public int getConnection_driver() {
		return connection_driver;
	}

	public void setConnection_driver(int connection_driver) {
		this.connection_driver = connection_driver;
	}

	public String getConnection_name() {
		return connection_name;
	}

	public void setConnection_name(String connection_name) {
		this.connection_name = connection_name;
	}

	public String getConnection_url() {
		return connection_url;
	}

	public void setConnection_url(String connection_url) {
		this.connection_url = connection_url;
	}

	public String getConnection_username() {
		return connection_username;
	}

	public void setConnection_username(String connection_username) {
		this.connection_username = connection_username;
	}

	public String getConnection_password() {
		return connection_password;
	}

	public void setConnection_password(String connection_password) {
		this.connection_password = connection_password;
	}

	public String getDisabled() {
		return disabled;
	}

	public void setDisabled(String disabled) {
		this.disabled = disabled;
	}

	public int getConnection_driver_target() {
		return connection_driver_target;
	}

	public void setConnection_driver_target(int connection_driver_target) {
		this.connection_driver_target = connection_driver_target;
	}

	public String getConnection_url_target() {
		return connection_url_target;
	}

	public void setConnection_url_target(String connection_url_target) {
		this.connection_url_target = connection_url_target;
	}

	public String getConnection_username_target() {
		return connection_username_target;
	}

	public void setConnection_username_target(String connection_username_target) {
		this.connection_username_target = connection_username_target;
	}

	public String getConnection_password_target() {
		return connection_password_target;
	}

	public void setConnection_password_target(String connection_password_target) {
		this.connection_password_target = connection_password_target;
	}

	public String getConnection_name_target() {
		return connection_name_target;
	}

	public void setConnection_name_target(String connection_name_target) {
		this.connection_name_target = connection_name_target;
	}

}
