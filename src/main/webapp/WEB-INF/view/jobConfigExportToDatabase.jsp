<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ScheduleIT | Connections : Query</title>
<script src="js/jquery-3.5.0.min.js"></script>
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
<script src="js/bootstrap.min.js" type="text/javascript"></script>
<script type="text/javascript">
	$(function() {
		$('a[data-toggle="tab"]').on('click', function(e) {
			window.localStorage.setItem('activeTab', $(e.target).attr('href'));
		});
		var activeTab = window.localStorage.getItem('activeTab');
		if (activeTab) {
			$('#myTab a[href="' + activeTab + '"]').tab('show');
			window.localStorage.removeItem("activeTab");
		}
	});

	function createQuery() {
		var table_name = document.getElementById('table_name').value;
		var checkboxes = document
				.querySelectorAll('input[type=checkbox]:checked')

		var query = 'insert into ' + table_name + '(';
		var column = '';
		var prep = '';
		for (var i = 0; i < checkboxes.length; i++) {
			column = column + checkboxes[i].value.split(' ')[0] + ' ,';
			prep = prep + '? ,';
		}
		column = column.replace(/(^,)|(,$)/g, "");
		prep = prep.replace(/(^,)|(,$)/g, "");
		query = query + column + ') values (' + prep + ')';

		document.getElementById('job_query_text_target').value = query;

	}
</script>

</head>

<body>

	<jsp:include page="include/navigation.jsp"></jsp:include>
	<br>

	<form:form action="jobconfig-database" method="post"
		modelAttribute="jobQuery" name="jobForm" id="jobForm">
		<div class="container">
			<div class="row justify-content-sm-center">

				<div class="col-sm-12">
					<c:if test="${not empty message}">
						<div class="alert alert-success" role="alert">
							<a>${message} </a>
							<button type="button" class="close" data-dismiss="alert"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
					</c:if>
					<div class="card">
						<div class="d-flex card-header">
							<div class="mr-auto">
								<h5>Job Configuration</h5>
							</div>
							<div class="">
								<a
									href="<c:url value="/connections?job_id=${connections.job_id}"/>">
									<img src="icons/arrow-left-circle.svg" alt="" width="30"
									height="30" title="Connections" />
								</a>
							</div>
						</div>
						<div class="card-body">
							<div class="container">
								<div class="col-sm-12">

									<ul class="nav nav-tabs text-dark bg-light" id="myTab"
										role="tablist">
										<li class="nav-item" role="presentation"><a
											class="nav-link active" id="source-tab" data-toggle="tab"
											href="#source" role="tab" aria-controls="source"
											aria-selected="true">Source query</a></li>
										<li class="nav-item" role="presentation"><a
											class="nav-link" id="target-tab" data-toggle="tab"
											href="#target" role="tab" aria-controls="target"
											aria-selected="false">Target query</a></li>
									</ul>
									<div class="tab-content" id="myTabContent">
										<div class="tab-pane fade active show" id="source"
											role="tabpanel" aria-labelledby="source-tab">
											<div class="form-group">

												<form:textarea path="job_query_text" type="text"
													class="form-control" id="job_query_text" placeholder=""
													value="${jobQuery.job_query_text }" cols="" rows="15" />
												<form:hidden path="connection_id" id="connection_id"
													value="${connections.connection_id}" />
												<form:hidden path="job_id" value="${connections.job_id}" />
												<form:hidden path="job_query_id"
													value="${jobQuery.job_query_id}" />
												<input type="hidden" id="connection_typeDB"
													value="${connections.connection_type }" />
											</div>
										</div>
										<div class="tab-pane fade" id="target" role="tabpanel"
											aria-labelledby="target-tab">
											<div class="form-group" id="divTarget">
												<br />

												<div class="container">
													<div class="row">
														<div class="col-sm-6">
															<div class="form-group">
																<input type="text" class="form-control" id="table_name"
																	placeholder="Table name" name="table_name"
																	value="${table_name }" />
															</div>
														</div>
														<div class="col-sm-3">
															<div class="form-group">

																<input type="submit" id="FetchMetadata"
																	name="FetchMetadata" class="btn-light btn-sm"
																	value="Fetch Metadata">
															</div>
														</div>
													</div>
												</div>

												<c:if test="${not empty tableMetadata}">
													<div class="container">
														<div class="row">
															<div class="col-sm-6">
																<div class="form-group">
																	<table
																		class="table  table-hover table-sm table-borderless">
																		<thead>
																			<tr>
																				<th scope="col">#</th>
																				<th scope="col">Columns</th>

																			</tr>
																		<tbody>
																			<c:forEach items="${tableMetadata}" var="element">
																				<tr>
																					<td scope="row"><input type="checkbox"
																						id="chkColumns" name="chkColumns" checked
																						value="${element}"></td>
																					<td>${element}</td>
																				</tr>
																			</c:forEach>
																		</tbody>
																	</table>

																</div>
															</div>
															<div class="col-sm-3">
																<div class="form-group">

																	<input type="button" id="selectColumns"
																		name="selectColumns" class="btn-light btn-sm"
																		value="Create Query" onclick="createQuery()">
																</div>
															</div>
														</div>
													</div>
												</c:if>



												<form:textarea path="job_query_text_target" type="text"
													class="form-control" id="job_query_text_target"
													placeholder="" value="${jobQuery.job_query_text_target }"
													cols="" rows="13" readonly="true"/>
											</div>
										</div>
									</div>
								</div>
							</div>

							<br />

							<div class="container">
								<div class="row">
									<div class="col-sm-6">
										<div class="form-group">
											<input type="submit" id="btnsubmit" name="Save"
												class="btn-success btn-lg btn-block" value="Save">
										</div>
									</div>
									<div class="col-sm-6">
										<div class="form-group">
											<input type="submit" id="TestConnection"
												name="TestConnection" class="btn-light btn-lg btn-block"
												value="Clear">
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>


				</div>

			</div>
		</div>
	</form:form>
</body>
</html>