<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ScheduleIT | Dashboard</title>
<script src="js/jquery-3.5.0.min.js"></script>
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
<script src="js/bootstrap.min.js" type="text/javascript"></script>

</head>
<body>

	<jsp:include page="include/navigation.jsp"></jsp:include>


	<div class="container-fluid p-3 my-3 table-responsive">
		<div class="row justify-content-sm-center">

			<div class="col-sm-7">
				<c:if test="${not empty msg}">
					<div class="alert alert-success" role="alert">
						<a>${msg} </a>
						<button type="button" class="close" data-dismiss="alert"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
				</c:if>
				<table class="table table-hover ">
					<thead class="thead-light">
						<tr>
							<th>#</th>
							<th>Job</th>
							<th>Schedule</th>
							<th>Type</th>
							<th>Disabled</th>
							<th><a href="<c:url value="/createJob"/>"> <img
									src="icons/plus.svg" alt="" width="25" height="25"
									title="Bootstrap" /></a></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${jobList}" var="jobList">
							<tr>
								<td>${jobList.job_id }</td>
								<td><a
									href="<c:url value="/getJobById?job_id=${jobList.job_id}"/>">${jobList.job_name }</a></td>
								<td><c:choose>
										<c:when test="${jobList.job_frequency=='1'}">
								        Daily : ${jobList.hours} ${jobList.minutes} Hrs  
								    </c:when>
										<c:when test="${jobList.job_frequency=='2'}">
								        Weekly : ${jobWeekDaysList.get(jobList.week_day)} - ${jobList.hours} ${jobList.minutes} Hrs 
								    </c:when>
										<c:when test="${jobList.job_frequency=='3'}">
								        Monthly : Day ${jobList.month_day} - ${jobList.hours} ${jobList.minutes} Hrs 
								    </c:when>
										<c:otherwise>
								        NA
								    </c:otherwise>
									</c:choose></td>
								<td>${jobTypeList.get(jobList.job_type)}</td>
								<td>${jobList.disabled}</td>
								<td><a
									href="<c:url value="/connections?job_id=${jobList.job_id}"/>">
										<img src="icons/box-arrow-right.svg" alt="" width="20"
										height="20" title="Settings" />
								</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>

</body>
</html>