package com.scheduler.scheduleit.repository.impl;

import java.sql.DatabaseMetaData;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.scheduler.scheduleit.config.DataSourceFactory;
import com.scheduler.scheduleit.domain.Connections;
import com.scheduler.scheduleit.domain.JobQuery;
import com.scheduler.scheduleit.repository.ConnectionsRepository;
import com.scheduler.scheduleit.repository.ExportToDatabaseRepository;
import com.scheduler.scheduleit.repository.JobRepository;

@Repository
public class ExportToDatabaseRepositoryImpl implements ExportToDatabaseRepository {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Autowired
	JobRepository jobRepository;

	@Autowired
	ConnectionsRepository connectionsRepository;

	@Autowired
	DataSourceFactory dataSourceFactory;

	@Override
	public List<JobQuery> getQueryById(Connections connections) {

		return jdbcTemplate.query(
				"select connection_id, job_id, job_query_id, connection_type, job_query_text, disabled, job_query_text_target "
						+ "	 from job_query where job_id=? and connection_id=?",
				new Object[] { connections.getJob_id(), connections.getConnection_id() }, new QueryMapper());
	}

	@Override
	public String executeJob(int job_id) {
		System.out.println("executing job for job id" + job_id);

		Connections connections = connectionsRepository.getConnectionsById(job_id).get(0);
		JobQuery query = getQueryById(connections).get(0);

		JdbcTemplate targetJdbcTemplate = connectionsRepository.getTargetConnection(connections);
		JdbcTemplate sourceJdbcTemplate = connectionsRepository.getSourceConnection(connections);
		try {

			List<Map<String, Object>> batchData = sourceJdbcTemplate.queryForList(query.getJob_query_text());
			int[] count = targetJdbcTemplate.batchUpdate(query.getJob_query_text_target(), getBatchArgs(batchData));

			System.out.println(count.length + " records inserted");
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("Job executed for job_id : " + job_id);
		return "Job executed for job_id : " + job_id;
	}

	public List<Object[]> getBatchArgs(List<Map<String, Object>> batchData) {
		List<Object[]> batchArgs = new ArrayList<Object[]>();
		for (Map<String, Object> map : batchData) {
			ArrayList<Object> objList = new ArrayList<Object>();
			for (Map.Entry<String, Object> data : map.entrySet()) {
				objList.add(data.getValue());
			}
			batchArgs.add(objList.toArray());
		}

		for (Object[] list : batchArgs) {
			System.out.println(Arrays.toString(list));
		}

		return batchArgs;
	}

	@Override
	public String createQuery(JobQuery jobQuery) {

		String msg = "Insert Failed !";
		int job_query_id = jobRepository.getMaxId("job_query", "job_query_id") + 1;
		int result = jdbcTemplate.update("INSERT INTO job_query("
				+ "	job_query_id, connection_id, job_id, connection_type, job_query_text, disabled,job_query_text_target )"
				+ "	VALUES (?, ?, ?, ?, ?, ?,?)", job_query_id, jobQuery.getConnection_id(), jobQuery.getJob_id(),
				jobQuery.getConnection_type(), validateQuery(jobQuery.getJob_query_text()), jobQuery.getDisabled(),
				validateQuery(jobQuery.getJob_query_text_target()));

		if (result == 1)
			msg = "Query saved !!";
		return msg;
	}

	@Override
	public String updateQuery(JobQuery jobQuery) {
		int result = jdbcTemplate.update("update job_query set "
				+ " connection_id=?, job_id=?, connection_type=?, job_query_text=?, disabled=?,job_query_text_target=? where job_query_id=?",
				jobQuery.getConnection_id(), jobQuery.getJob_id(), jobQuery.getConnection_type(),
				validateQuery(jobQuery.getJob_query_text()), jobQuery.getDisabled(),
				validateQuery(jobQuery.getJob_query_text_target()), jobQuery.getJob_query_id());

		return result + " record updated";
	}

	private String validateQuery(String query) {
		return query.replace(";", "");
	}

	public static final class QueryMapper implements RowMapper<JobQuery> {
		@Override
		public JobQuery mapRow(ResultSet rs, int rowNum) throws SQLException {
			JobQuery jobQuery = new JobQuery();
			jobQuery.setJob_id(rs.getInt("job_id"));
			jobQuery.setConnection_id(rs.getInt("connection_id"));
			jobQuery.setConnection_type(rs.getInt("connection_type"));
			jobQuery.setJob_query_id(rs.getInt("job_query_id"));
			jobQuery.setDisabled(rs.getString("disabled"));
			jobQuery.setJob_query_text(rs.getString("job_query_text"));
			jobQuery.setJob_query_text_target(rs.getString("job_query_text_target"));
			return jobQuery;
		}

	}

	public ArrayList<String> getMetaData(String table_name, Connections connections) {
		ArrayList<String> columnsList = new ArrayList<String>();
		JdbcTemplate targetJdbcTemplate = connectionsRepository.getTargetConnection(connections);
		try {
			DatabaseMetaData databaseMetaData = targetJdbcTemplate.getDataSource().getConnection().getMetaData();
			System.out.println(databaseMetaData.getUserName());
			ResultSet columns = databaseMetaData.getColumns(null, null, table_name, null);
			while (columns.next()) {
				System.out.println(columns.getString("COLUMN_NAME") + "  " + columns.getString("DATA_TYPE"));
				columnsList.add(columns.getString("COLUMN_NAME") + "  [" + columns.getString("TYPE_NAME").toUpperCase()
						+ "(" + columns.getString("COLUMN_SIZE") + ")]");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return columnsList;
	}

}
