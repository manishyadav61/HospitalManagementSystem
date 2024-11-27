<%@page import="com.db.DBConnect" %>
<%@page import="java.sql.Connection" %>
<%@ page import="java.util.List" %>
<%@ page import ="com.dao.DoctorDAO"%>
<%@ page import="com.entity.Doctor" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index Page</title>
<%@include file="component/allcss.jsp" %>
<style type="text/css">
.paint-card
{
	box-shadow: 0 0 10px 0 rgba(0,0,0,0.3);
}
.backImg{
	background:linear-gradient(rgba(0,0,0,.4), rgba(0,0,0,.4)),url("img/hos4.jpg");
	height : 10vh;
	width : 100%;
	background-size : cover;
	background-repeat : no-repeat;
}
</style>
</head>
<body>
	<%@ include file="component/navbar.jsp" %>
	
	<div class="container-fluid backImg p-5">
		<p class="text-center fs-2 text-white"></p>
	</div>
	<div class="container p-3">	
		<div class="row">
			<div class="col-md-6 ">
				<img alt="" src="img/doc1.jpg">
			</div>
			<div class="col-md-6">
					<div class="car paint-card">
						<div class="card-body">
							<p class="text-center fs-3">User Appointment</p>
							<c:if test="${not empty sucMsg }">
								<p class="fs-4 text-center text-success">${sucMsg}</p>
								<c:remove var="sucMsg" scope="session"/>
							</c:if>
							<c:if test="${not empty errorMsg }">
								<p class="fs-4 text-center text-danger">${errorMsg}</p>
								<c:remove var="errorMsg" scope="session"/>
							</c:if>
							<form class="row g-3" action="add_appoint" method="post">
							
								<input type="hidden" name="user_id" value="${userObj.id }">
								
								<div class="col-md-6">
									<label for="inputEmail4" class="form-label">Full Name </label>
									<input required type="text" class="form-contorl" name="fullname">
								</div>
								<div class="col-md-6">
									<label>Gender</label><br>
									<select required class="form-control" name="gender">
										<option value="male">Male</option>
										<option value="female">Female</option>
									</select>
								</div>
								<div class="col-md-6">
									<label for="inputEmail4" class="form-label">Age</label>
									<input required type="number" class="form-contorl" name="age">
								</div>
								<div class="col-md-6">
									<label for="inputEmail4" class="form-label">Appointment Date</label>
									<input required type="date" class="form-contorl" name="appoint_date">
								</div>
								<div class="col-md-6">
									<label for="inputEmail4" class="form-label">Email</label>
									<input required type="email" class="form-contorl" name="email">
								</div>
								<div class="col-md-6">
									<label for="inputEmail4" class="form-label">Phone No</label>
									<input maxlength="10" required type="number" class="form-contorl" name="phno">
								</div>
								<div class="col-md-6">
									<label for="inputEmail4" class="form-label">Diseases</label>
									<input required type="text" class="form-contorl" name="diseases">
								</div>
								<div class="col-md-6">
									<label for="inputPassword4" class="form-label">Doctor</label>
									<select required class="form-control" name="doctor_id">
										<option value="">--select--</option>
										
										<% 
											DoctorDAO dao=new DoctorDAO(DBConnect.getConn());
											List<Doctor> list=dao.getAllDoctor();
											for(Doctor d: list)
											{
											%>
												<option value="<%=d.getId()%>"> <%=d.getFullName()%> (<%=d.getSpecialist() %>)
												</option>
											<%
											}
										%>
										
									</select>
								</div>
								<div class="col-md-12">
									<label>Full Address</label>
									<textarea required name="address" class="form-control" rows="3" cols=""></textarea>
								</div>
								<c:if test="${empty userObj }">
									<a href="user_login.jsp" class="col-md-6 offset-md-3 btn btn-success">Submit</a>
								</c:if>
								<c:if test="${not empty userObj }">
									<button class="col-md-6 offset-md-3 btn btn-success">Submit</button>
								</c:if>
							</form>
						</div>
					</div>
				</div>
		</div>
	</div>
	<%@include file="component/footer.jsp" %>
</body>
</html>