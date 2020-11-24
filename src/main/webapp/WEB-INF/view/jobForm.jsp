<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ScheduleIT:Jobs</title>
<script src="js/jquery-3.5.0.min.js"></script>
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
<script src="js/bootstrap.min.js" type="text/javascript"></script>
<script>
	window.onload = function() {
		toggle('X');
		schedulerFrequency(99);
		displayPath(document.getElementById("job_type"))
	}
</script>
<script type="text/javascript">
	function schedulerFrequency(val) {
		if(val==99) 
			val = document.getElementById("job_frequencyDB").value;	
		else
		{
			document.getElementById("divDaily").style.display = "none";
			document.getElementById("divWeekly").style.display = "none";
			document.getElementById("divMonthly").style.display = "none";
			document.getElementById("divCronExpression").style.display = "none";
		}
		
		if (val == '1') 
			document.getElementById("divDaily").style.display = "block";
		 else if (val == '2') 
			document.getElementById("divWeekly").style.display = "block";
		 else if (val == '3') 
			document.getElementById("divMonthly").style.display = "block";
		 
		if (val == '1' || val=='2' || val=='3'){
			document.getElementById("divDaily").style.display = "block";
			document.getElementById("divCronExpression").style.display = "block";
		}
			 
		
		document.getElementById("job_frequencyDB").value=val;
		calculateCron();
	}
	
	function calculateCron(){
		
		var val =document.getElementById("job_frequencyDB").value;
		if(val=="1"){
			var hrs =document.getElementById("selHours").options[document.getElementById("selHours").selectedIndex].text;
			var min =document.getElementById("selMinutes").options[document.getElementById("selMinutes").selectedIndex].text;			
			document.getElementById("cron_expression").value= '0 '+min+' '+hrs+' * * *';
		}
		else if (val=="2"){
			var hrs =document.getElementById("selHours").options[document.getElementById("selHours").selectedIndex].text;
			var min =document.getElementById("selMinutes").options[document.getElementById("selMinutes").selectedIndex].text;
			var week_day =document.getElementById("selWeekDay").options[document.getElementById("selWeekDay").selectedIndex].text;
			document.getElementById("cron_expression").value= '0 '+min+' '+hrs+' * * '+week_day;
		}
		else if(val=="3"){
			var hrs =document.getElementById("selHours").options[document.getElementById("selHours").selectedIndex].text;
			var min =document.getElementById("selMinutes").options[document.getElementById("selMinutes").selectedIndex].text;
			var month_day =document.getElementById("selMonthDay").options[document.getElementById("selMonthDay").selectedIndex].text;
			document.getElementById("cron_expression").value= '0 '+min+' '+hrs+' '+month_day+' * *';
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
	
	function displayPath(obj){
		if(obj.value==1)
			document.getElementById("divPath").style.display ="block";
		else
			document.getElementById("divPath").style.display ="none";
	}
</script>

</head>

<body>

	<jsp:include page="include/navigation.jsp"></jsp:include>
	<br>

	<form:form action="createJob" method="post" modelAttribute="job"
		name="jobForm">
		<div class="container">
			<div class="row justify-content-sm-center">
				<div class="col-sm-9">

					<div class="card">
						<div class="d-flex card-header">
								<div class="mr-auto">
									<h5>Jobs</h5>
								</div>
								<div class="">
									<a
										href="<c:url value="/"/>">
										<img src="icons/arrow-left-circle.svg" alt="" width="30"
										height="30" title="Back" />
										
									</a>
								</div>
							</div>
						<div class="card-body">
							<div class="container">
								<div class="row">
									<div class="col-sm-12">
										<div class="form-group">
											<label for="job_name">Job Name</label>
											<form:input path="job_name" type="text" class="form-control"
												id="job_name" placeholder="" value="${job.job_name }" maxlength="100" />
											<form:hidden path="job_id" value="${job.job_id}" />
										</div>
									</div>
								</div>
							</div>
							<!-- job_id, job_name, user_id, cron_expression, job_type, export_path -->


							<div class="container">
								<div class="row">
									<div class="col-sm-3">
										<div class="form-group">
											<label class="form-check-label" for="radioNone">
												Scheduler </label>
										</div>
									</div>

									<div class="col-sm-2">
										<div class="form-check">
											<form:radiobutton path="job_frequency" id="radioFrequency"
												value="0" checked="checked" onChange="schedulerFrequency(0)" />
											<label class="form-check-label" for="radioNone"> None
											</label> <input type="hidden" id="job_frequencyDB"
												value="${job.job_frequency }" />
										</div>
									</div>
									<div class="col-sm-2">
										<div class="form-check">
											<form:radiobutton path="job_frequency" id="radioFrequency"
												value="1" onChange="schedulerFrequency(1)" />
											<label class="form-check-label" for="radioDaily">
												Daily </label>
										</div>
									</div>
									<div class="col-sm-2">
										<div class="form-check">
											<form:radiobutton path="job_frequency" id="radioFrequency"
												value="2" onChange="schedulerFrequency(2)" />
											<label class="form-check-label" for="radioWeekly">
												Weekly </label>
										</div>
									</div>
									<div class="col-sm-2">
										<div class="form-check">
											<form:radiobutton path="job_frequency" id="radioFrequency"
												value="3" onChange="schedulerFrequency(3)" />
											<label class="form-check-label" for="radioMonthly">
												Monthly </label>

										</div>
									</div>
								</div>
							</div>
							<div class="container" id="divDaily" style="display: none">
								<div class="row">
									<div class="col-sm-3">
										<div class="form-inline">
											<label for="hours">Job to be executed at </label>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="form-inline">
											<form:select path="hours" items="${jobHoursList}" class="form-control" id ="selHours"
											onchange="calculateCron();"/>
											<form:select path="minutes" items="${jobMinutesList}" class="form-control" id="selMinutes"
											onchange="calculateCron();" />
											&nbsp;[Hrs : Min]
										</div>
									</div>
									
									<div class="col-sm-4" id="divWeekly" style="display: none">
										<div class="form-inline" >
											on &nbsp;<form:select path="week_day" name = "week_day" items="${jobWeekDaysList}" 
											id ="selWeekDay" class="form-control" onchange="calculateCron();" />
											&nbsp; weekly
										</div>
									</div>
									
									<div class="col-sm-4" id="divMonthly" style="display: none">
										<div class="form-inline" >
											on day &nbsp;<form:select path="month_day" name = "month_day" items="${jobDayMonthsList}" 
											id="selMonthDay" class="form-control" onchange="calculateCron();"/>
											&nbsp; monthly
										</div>
									</div>
									
								</div><br/>
							</div>
							
							<div class="container" id="divCronExpression"  style="display: none">
								<div class="row">
									<div class="col-sm-3">
										<div class="form-group">
											<label for="disabled" class="form-check-label">Cron
												Expression</label>
										</div>
									</div>
									<div class="col-sm-6">
										<div class="form-group">
											<form:input path="cron_expression" type="text" id="cron_expression"
												class="form-control"  placeholder="" readonly="true"
												value="${job.cron_expression }" />

										</div>
									</div>
								</div>
							</div>

							<div class="container">
								<div class="row">
									<div class="col-sm-3">
										<div class="form-group">
											<label for="disabled" class="form-check-label">Job
												Type</label>
										</div>
									</div>
									<div class="col-sm-6">
										<div class="form-group">
											<form:select path="job_type" class="form-control" onchange="displayPath(this)">
												<form:options items="${jobTypeList}" />
											</form:select>

										</div>
									</div>
								</div>
							</div>
							
							<div class="container" id="divPath" style="display: none">
								<div class="row">
									<div class="col-sm-3">
										<div class="form-group">
											<label for="disabled" class="form-check-label">Export Path</label>
										</div>
									</div>
									<div class="col-sm-6">
										<div class="form-group">
											<form:input path="export_path" type="text" id="export_path"
												class="form-control"  placeholder=""
												value="${job.export_path }" />
										</div>
									</div>
								</div>
							</div>

							<div class="container">
								<div class="row">
									<div class="col-sm-3">
										<div class="form-group">
											<label for="disabled" class="form-check-label">Disabled</label>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="form-group">
											<form:hidden path="disabled" id="disabled"
												value="${job.disabled}" />

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
											<input type="submit" id="Clear" name="Clear"
												class="btn-light btn-lg btn-block" value="Clear">
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