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
<script type="text/javascript">
function submit(type){
	if(type=='submit'){
		
	}
}


</script>

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
					href="<c:url value="/airline/"></c:url>">Home <span
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
	<br>
	<div class="container">
		<div class="row">
			<div class="col-sm-10">

				<div class="card bg-secondary text-white text-center">
					<div class="card-body">
						<h3>Airline Safety</h3>
					</div>
				</div>
			</div>
		</div>
	</div>

	<form>
		<div class="container">
			<div class="row">
				<div class="col-sm-10">

					<div class="container">
						<div class="row">
							<div class="col-sm-12">
								<div class="form-group">
									<label for="airline">Airline</label> <input type="text"
										class="form-control" id="airline" placeholder="Airline"
										value="${airlineList.airline }">
								</div>
							</div>

						</div>
					</div>

					<div class="container">
						<div class="row">
							<div class="col-sm-12">
								<div class="form-group">
									<label for="avail_seat_km_per_week">Available seat KM
										per week</label> <input type="text" class="form-control"
										id="avail_seat_km_per_week"
										placeholder="Available seat km per weeek"
										value="${airlineList.avail_seat_km_per_week}">
								</div>
							</div>
						</div>

					</div>
					<div class="container">
						<div class="row">
							<div class="col-sm-4">
								<div class="form-group">
									<label for="incidents_85_99">Incidents 1985-99</label> <input
										type="text" class="form-control" id="incidents_85_99"
										placeholder="Incidents 1985-99"
										value="${airlineList.incidents_85_99 }">
								</div>
							</div>
							<div class="col-sm-4">
								<div class="form-group">
									<label for="fatal_accidents_85_99">Fatal Accidents
										1985-99</label> <input type="text" class="form-control"
										id="fatal_accidents_85_99"
										placeholder="Fatal Accidents 1985-99"
										value="${airlineList.fatal_accidents_85_99 }">
								</div>
							</div>
							<div class="col-sm-4">
								<div class="form-group">
									<label for="fatalities_85_99">Fatalities 1985-99</label> <input
										type="text" class="form-control" id="fatalities_85_99"
										placeholder="Fatalities 1985-99"
										value="${airlineList.fatalities_85_99 }">
								</div>
							</div>
						</div>
					</div>



					<div class="container">
						<div class="row">
							<div class="col-sm-4">
								<div class="form-group">
									<label for="incidents_00_14">Fatal Accidents 2000-14</label> <input
										type="text" class="form-control" id="incidents_00_14"
										placeholder="Fatal Accidents 2000-14"
										value="${airlineList.incidents_00_14 }">
								</div>
							</div>
							<div class="col-sm-4">
								<div class="form-group">
									<label for="fatal_accidents_00_14">Fatal Accidents
										2000-14</label> <input type="text" class="form-control"
										id="fatal_accidents_00_14"
										placeholder="Fatal Accidents 2000-14"
										value="${airlineList.fatal_accidents_00_14 }">
								</div>
							</div>
							<div class="col-sm-4">
								<div class="form-group">
									<label for="fatalities_00_14">Incidents 2000-14</label> <input
										type="text" class="form-control" id="fatalities_00_14"
										placeholder="Incidents 2000-14"
										value="${airlineList.fatalities_00_14 }">
								</div>
							</div>
						</div>
					</div>

					<div class="container">
						<div class="row">
							<div class="col-sm-4">
								<div class="form-group">
									<div class="form-group text-center" align="center">
										<button type="button" class="btn btn-danger btn-lg btn-block">Delete</button>
										
									</div>
								</div>
							</div>
							<div class="col-sm-4">
								<div class="form-group">
									<div class="form-group text-center" align="center">
										<button type="button" onclick="<c:url value="/airline/getById?sr_no=${airlineList.sr_no}"/>" class="btn btn-success btn-lg btn-block">Submit</button>
									</div>
								</div>
							</div>

							<div class="col-sm-4">
								<div class="form-group">
									<div class="form-group text-center" align="center">
										<button type="button" class="btn btn-secondary btn-lg btn-block">Clear</button>
									</div>
								</div>
							</div>


						</div>
					</div>

				</div>
			</div>
		</div>
	</form>
</body>
</html>