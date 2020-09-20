<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Airline safety</title>
<script src="../js/jquery-3.5.0.min.js"></script>
<link href="../css/bootstrap.min.css" rel="stylesheet" type="text/css">
<script src="../js/bootstrap.min.js" type="text/javascript"></script>


</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<a class="navbar-brand" href="#">ScheduleIT</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			. <span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="nav navbar-nav ml-auto">
				<li class="nav-item active"><a class="nav-link"
					href="<c:url value="/airline/"></c:url>"><svg class="bi bi-chevron-right" width="32" height="32" viewBox="0 0 20 20" fill="currentColor" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M6.646 3.646a.5.5 0 01.708 0l6 6a.5.5 0 010 .708l-6 6a.5.5 0 01-.708-.708L12.293 10 6.646 4.354a.5.5 0 010-.708z" clip-rule="evenodd"/></svg>
<span
						class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Features</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="#">Pricing</a></li>
				<li class="nav-item"><a class="nav-link disabled" href="#">Disabled</a>
				</li>
			</ul>
		</div>
	</nav>

	<div class="container-fluid p-3 my-3 table-responsive">
		<table class="table table-hover ">
			<thead class="thead-light">
				<tr>
					<th>#</th>
					<th>Airline</th>
					<th>Available seat/km_per_week</th>
					<th>Incidents_85_99</th>
					<th>Fatal_Accidents_85_99</th>
					<th>Fatalities_85_99</th>
					<th>Incidents_00_14</th>
					<th>Fatal_Accidents_00_14</th>
					<th>Fatalities_00_14</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${airlineList}" var="airlineList">
					<tr>
						<td>${airlineList.sr_no }</td>
						<td>${airlineList.airline }</td>
						<td>${airlineList.avail_seat_km_per_week}</td>
						<td>${airlineList.incidents_85_99 }</td>
						<td>${airlineList.fatal_accidents_85_99 }</td>
						<td>${airlineList.fatalities_85_99 }</td>
						<td>${airlineList.incidents_00_14 }</td>
						<td>${airlineList.fatal_accidents_00_14 }</td>
						<td>${airlineList.fatalities_00_14 }</td>
						<td><a
							href="<c:url value="/airline/getById?sr_no=${airlineList.sr_no}"/>">Select</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

</body>
</html>