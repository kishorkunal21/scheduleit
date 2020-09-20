<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ScheduleIT | Connections</title>
<script src="js/jquery-3.5.0.min.js"></script>
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
<script src="js/bootstrap.min.js" type="text/javascript"></script>
<script>
	window.onload = function() {
		toggle('X');
		connectionTypeToggle(99);
		changeURL();
	}
</script>
<script type="text/javascript">
	function connectionTypeToggle(val) {
		
		if(document.getElementById("job_type").value==3)
			document.getElementById("divTargetConnection").style.display = "block";
		else
			document.getElementById("divTargetConnection").style.display = "none";
		
		var job_name = document.getElementById("job_name").value;

		if (val == 99)
			val = document.getElementById("connection_typeDB").value;

		if (val == 0){
			document.getElementById("connection_name").value = job_name	+ '_Source';
			document.getElementById("divSourceDB").style.display = "block";
			document.getElementById("divTargetDB").style.display = "none";
		}
			
		else if (val == 1){
			document.getElementById("connection_name_target").value = job_name	+ '_Target';
			document.getElementById("divSourceDB").style.display = "none";
			document.getElementById("divTargetDB").style.display = "block";
			
		}
	}

	function changeURL() {
		
		if(document.getElementById("connection_id").value==0){
			if (document.getElementById("connection_driver").value == 1)
				document.getElementById("connection_url").value = 'jdbc:postgresql://localhost:5121/database_name';
			else if (document.getElementById("connection_driver").value == 2)
				document.getElementById("connection_url").value = 'jdbc:oracle://localhost:5121/database_name';
			else if (document.getElementById("connection_driver").value == 3)
				document.getElementById("connection_url").value = 'jdbc:mysql://localhost:5121/database_name';
			
			if (document.getElementById("connection_driver_target").value == 1)
				document.getElementById("connection_url_target").value = 'jdbc:postgresql://localhost:5121/database_name';
			else if (document.getElementById("connection_driver_target").value == 2)
				document.getElementById("connection_url_target").value = 'jdbc:oracle://localhost:5121/database_name';
			else if (document.getElementById("connection_driver_target").value == 3)
				document.getElementById("connection_url_target").value = 'jdbc:mysql://localhost:5121/database_name';
			
			if(document.getElementById("connection_url_target").value=='' && document.getElementById("connection_url").value==''){
				document.getElementById("connection_url_target").value = 'jdbc:postgresql://localhost:5121/database_name';
				document.getElementById("connection_url").value = 'jdbc:postgresql://localhost:5121/database_name';
			}
		}
	}

	function toggle(val) {

		if (val == 'Y') {
			document.getElementById("disabled_n").style.display = "none";
			document.getElementById("disabled_y").style.display = "block";
			document.getElementById("disabled").value = "Y";
		} else if (val == 'N') {
			document.getElementById("disabled_n").style.display = "block";
			document.getElementById("disabled_y").style.display = "none";
			document.getElementById("disabled").value = "N";
		} else if (document.getElementById("disabled").value == 'Y') {
			document.getElementById("disabled_n").style.display = "none";
			document.getElementById("disabled_y").style.display = "block";
		}

	}
</script>

</head>

<body>

	<jsp:include page="include/navigation.jsp"></jsp:include>
	<br>

	<form:form action="createConnections" method="post"
		modelAttribute="connections" name="jobForm">
		<div class="container">
			<div class="row justify-content-sm-center">
			
				<div class="col-sm-9">
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
						<div class="card">
							<h5 class="card-header">Connections </h5>
							<div class="card-body">
								<div class="container">
									<div class="row">
										<div class="col-sm-3">
											<div class="form-group">
												<label class="form-check-label" for="radioNone">
													Connection Type </label>
											</div>
										</div>

										<div class="col-sm-2">
											<div class="form-check">
												<form:radiobutton path="connection_type"
													id="radioConnectionType" value="0" checked="checked"
													onChange="connectionTypeToggle(0)" />
												<label class="form-check-label" for="radioNone">
													Source </label> <input type="hidden" id="connection_typeDB"
													value="${connections.connection_type }" />
											</div>
										</div>
										<div class="col-sm-2" style="display:none" id="divTargetConnection">
											<div class="form-check">
												<form:radiobutton path="connection_type"
													id="radioConnectionType" value="1"
													onChange="connectionTypeToggle(1)" />
												<label class="form-check-label" for="radioTarget">
													Target </label>
											</div>
										</div>
									</div>
								</div>

								<!-- connection_id, job_id, connection_type, connection_name, connection_url, connection_username, 
							connection_password, disabled, connection_driver -->
								<div id="divSourceDB">
									<div class="container">
										<div class="row">
											<div class="col-sm-3">
												<div class="form-group">
													<label for="disabled" class="form-check-label">Connection
														Name</label>
												</div>
											</div>
											<div class="col-sm-9">
												<div class="form-group">
													<form:input path="connection_name" type="text"
														class="form-control" id="connection_name" placeholder=""
														value="${connections.connection_name }" readonly="true" />
													<form:hidden path="connection_id" id="connection_id"
														value="${connections.connection_id}" />
													<form:hidden path="job_id" value="${job.job_id}" />
													<input type="hidden" id="job_name" value="${job.job_name}" />
													<input type="hidden" id="job_type" value="${job.job_type}" />
												</div>
											</div>
										</div>
									</div>

									<div class="container">
										<div class="row">
											<div class="col-sm-3">
												<div class="form-group">
													<label for="connection_driver" class="form-check-label">Database</label>
												</div>
											</div>
											<div class="col-sm-9">
												<div class="form-group">
													<form:select path="connection_driver"
														id="connection_driver" class="form-control"
														onclick="changeURL()">
														<form:options items="${connectionsDriverList}" />
													</form:select>

												</div>
											</div>
										</div>
									</div>

									<div class="container">
										<div class="row">
											<div class="col-sm-3">
												<div class="form-group">
													<label for="disabled" class="form-check-label">Connection
														URL</label>
												</div>
											</div>
											<div class="col-sm-9">
												<div class="form-group">
													<form:input path="connection_url" id="connection_url"
														class="form-control" placeholder=""
														value="${connections.connection_url }" maxlength="100" />

												</div>
											</div>
										</div>
									</div>

									<div class="container">
										<div class="row">
											<div class="col-sm-3">
												<div class="form-group">
													<label for="disabled" class="form-check-label">Username</label>
												</div>
											</div>
											<div class="col-sm-9">
												<div class="form-group">
													<form:input path="connection_username"
														id="connection_username" class="form-control"
														placeholder="" value="${connections.connection_username }"
														maxlength="50" />

												</div>
											</div>
										</div>
									</div>

									<div class="container">
										<div class="row">
											<div class="col-sm-3">
												<div class="form-group">
													<label for="disabled" class="form-check-label">Password</label>
												</div>
											</div>
											<div class="col-sm-9">
												<div class="form-group">
													<form:password path="connection_password"
														id="connection_password" class="form-control"
														placeholder="" value="${connections.connection_password }"
														maxlength="50" />

												</div>
											</div>
										</div>
									</div>
								</div>

								<!-- target database -->
								<div id="divTargetDB" style="display: none">
								
								<div class="container">
										<div class="row">
											<div class="col-sm-3">
												<div class="form-group">
													<label for="connection_name_target" class="form-check-label">Connection
														Name</label>
												</div>
											</div>
											<div class="col-sm-9">
												<div class="form-group">
													<form:input path="connection_name_target" type="text"
														class="form-control" id="connection_name_target" placeholder=""
														value="${connections.connection_name_target }" readonly="true" />

												</div>
											</div>
										</div>
									</div>

									<div class="container">
										<div class="row">
											<div class="col-sm-3">
												<div class="form-group">
													<label for="connection_driver_target"
														class="form-check-label">Database</label>
												</div>
											</div>
											<div class="col-sm-9">
												<div class="form-group">
													<form:select path="connection_driver_target"
														id="connection_driver_target" class="form-control"
														onclick="changeURL()">
														<form:options items="${connectionsDriverList}" />
													</form:select>

												</div>
											</div>
										</div>
									</div>

									<div class="container">
										<div class="row">
											<div class="col-sm-3">
												<div class="form-group">
													<label for="connection_url_target" class="form-check-label">Connection
														URL</label>
												</div>
											</div>
											<div class="col-sm-9">
												<div class="form-group">
													<form:input path="connection_url_target"
														id="connection_url_target" class="form-control"
														placeholder=""
														value="${connections.connection_url_target }"
														maxlength="100" />

												</div>
											</div>
										</div>
									</div>

									<div class="container">
										<div class="row">
											<div class="col-sm-3">
												<div class="form-group">
													<label for="connection_username_target"
														class="form-check-label">Username</label>
												</div>
											</div>
											<div class="col-sm-9">
												<div class="form-group">
													<form:input path="connection_username_target"
														id="connection_username_target" class="form-control"
														placeholder=""
														value="${connections.connection_username_target }"
														maxlength="50" />

												</div>
											</div>
										</div>
									</div>

									<div class="container">
										<div class="row">
											<div class="col-sm-3">
												<div class="form-group">
													<label for="connection_password_target"
														class="form-check-label">Password</label>
												</div>
											</div>
											<div class="col-sm-9">
												<div class="form-group">
													<form:password path="connection_password_target"
														id="connection_password_target" class="form-control"
														placeholder=""
														value="${connections.connection_password_target }"
														maxlength="50" />

												</div>
											</div>
										</div>
									</div>

								</div>

								<!-- //end target -->


								<div class="container">
									<div class="row">
										<div class="col-sm-3">
											<div class="form-group">
												<label for="disabled" class="form-check-label">Disabled</label>
											</div>
										</div>
										<div class="col-sm-9">
											<div class="form-group">
												<form:hidden path="disabled" id="disabled"
													value="${connections.disabled}" />

												<div id="disabled_n">
													<a href="#" onclick="toggle('Y')"> <img
														src="icons/toggle-off.svg" alt="" width="25" height="25"
														title="disabled" /></a>
												</div>

												<div style="display: none" onclick="toggle('N')"
													id="disabled_y">
													<a href="#"> <img src="icons/toggle-on.svg" alt=""
														width="25" height="25" title="disabled" /></a>
												</div>

											</div>
										</div>
									</div>
								</div>

								<div class="container">
									<div class="row">
										<div class="col-sm-6">
											<div class="form-group">
												<input type="submit" id="submit" name="Save"
													class="btn-success btn-lg btn-block" value="Save">
											</div>
										</div>
										<div class="col-sm-6">
											<div class="form-group">
												<input type="submit" id="TestConnection" name="TestConnection"
													class="btn-light btn-lg btn-block" value="Test Connection">
											</div>
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