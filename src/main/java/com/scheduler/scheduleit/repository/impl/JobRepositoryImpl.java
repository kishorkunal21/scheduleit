package com.scheduler.scheduleit.repository.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.scheduler.scheduleit.domain.Job;
import com.scheduler.scheduleit.repository.JobRepository;

@Repository
public class JobRepositoryImpl implements JobRepository {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Override
	public List<Job> getJobById(int sr_no) {
		return jdbcTemplate.query(
				"select job_id,  job_name, user_id, cron_expression, job_type, export_path, "
						+ "COALESCE (disabled,'N') disabled, COALESCE (job_frequency,0) job_frequency,"
						+ "hours, minutes, month_day, week_day" + " from job where job_id=?",
				new Object[] { sr_no }, new JobMapper());
	}

	@Override
	public List<Job> getJobList() {
		return jdbcTemplate.query(
				"select job_id, job_name, user_id, cron_expression, job_type, export_path,COALESCE (disabled,'N') disabled, COALESCE (job_frequency,0) job_frequency,"
						+ "hours, minutes, month_day, week_day  from job  order by job_id",
				new JobMapper());
	}

	@Override
	public int getJobCount() {
		int count = 0;
		try {
			count = jdbcTemplate.queryForObject("select count(*) from job", Integer.class);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return count;
	}

	@Override
	public String updateJob(Job job) {
		int result = jdbcTemplate.update(
				"update job set job_name=? ,cron_expression=?,job_type=?,export_path=?, disabled=?,"
						+ "job_frequency=?,hours=?, minutes=?, month_day=?, week_day=? where job_id=?",
				job.getJob_name(), job.getCron_expression(), job.getJob_type(), job.getExport_path(), job.getDisabled(),
				job.getJob_frequency(), job.getHours(), job.getMinutes(), job.getMonth_day(), job.getWeek_day(),
				job.getJob_id());

		return result + " record updated for Job";
	}

	@Override
	public String createJob(Job job) {
		String msg = "Insert Failed !";
		int job_id = this.getMaxId("job", "job_id") + 1;
		int result = jdbcTemplate.update(
				"INSERT INTO job(job_id, job_name, user_id, cron_expression, "
						+ "job_type, export_path, disabled,job_frequency,hours, minutes, month_day, week_day)"
						+ "	VALUES (?, ?, ?, ?, ?, ?, ?,?,?,?,?,?)",
				job_id, job.getJob_name(), job.getUser_id(), job.getCron_expression(), job.getJob_type(),
				job.getExport_path(), job.getDisabled(), job.getJob_frequency(), job.getHours(), job.getMinutes(),
				job.getMonth_day(), job.getWeek_day());

		if (result == 1)
			msg = "Job created !!";
		return msg;
	}

	public static final class JobMapper implements RowMapper<Job> {

		@Override
		public Job mapRow(ResultSet rs, int rowNum) throws SQLException {
			Job job = new Job();
			job.setJob_id(rs.getInt("job_id"));
			job.setJob_type(rs.getInt("job_type"));
			job.setJob_name(rs.getString("job_name"));
			job.setUser_id(rs.getInt("user_id"));
			job.setDisabled(rs.getString("disabled"));
			job.setCron_expression(rs.getString("cron_expression"));
			job.setExport_path(rs.getString("export_path"));
			job.setJob_frequency(rs.getInt("job_frequency"));
			job.setHours(rs.getInt("hours"));
			job.setMinutes(rs.getInt("minutes"));
			job.setMonth_day(rs.getInt("month_day"));
			job.setWeek_day(rs.getInt("week_day"));

			return job;
		}

	}

	@Override
	public int getMaxId(String table_name, String column_name) {
		int count = 0;
		try {
			count = jdbcTemplate.queryForObject("select max(" + column_name + ") from " + table_name + "",
					Integer.class);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

}
