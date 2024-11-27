<%@ page import="com.dao.SpecialistDAO" %>
<%@ page import ="java.sql.Connection"%>
<%@ page import="java.util.List" %>
<%@ page import ="com.dao.DoctorDAO"%>
<%@ page import=" com.db.DBConnect"%>
<%@ page import="com.entity.Specialist" %>
<%@ page import="com.entity.Doctor" %>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%@include file="../component/allcss.jsp" %>
<style type="text/css">
.paint-card
{
	box-shadow: 0 0 10px 0 rgba(0,0,0,0.3);
}
</style>
</head>
<body>
	<%@include file="navbar.jsp" %>
		<div class="container-fluid p-3">
			<div class="row">
				<div class="col-md-4 offset-md-4">
					<div class="card paint-card">
						<div class="card-body">
							<p class="fs-3 text-center">Edit Doctor Details</p>
							<c:if test="${not empty sucMsg }">
								<p class="text-center text-success fs-3">${sucMsg}</p>
								<c:remove var="sucMsg" scope="session"/>
							</c:if>
							<c:if test="${not empty errorMsg }">
								<p class="text-center text-danger fs-3">${errorMsg}</p>
								<c:remove var="errorMsg" scope="session"/>
							</c:if>
							<%
								int id=Integer.parseInt(request.getParameter("id"));
								DoctorDAO dao2=new DoctorDAO(DBConnect.getConn());
								Doctor d=dao2.getDoctorById(id);
							%>
							<form action ="../updateDoctor" method="post">
								<div class="mb-3">
									<label class="form-label">Full Name</label>
									<input type="text" required name="fullname" value="<%=d.getFullName()%>" class="form-control">
								</div>
								<div class="mb-3">
									<label class="form-label">DOB</label>
									<input type="date" required name="dob" value="<%=d.getDob()%>" class="form-control">
								</div>
								<div class="mb-3">
									<label class="form-label">Qualification</label>
									<input type="text" required value="<%=d.getQualification() %>" name="qualification" class="form-control">
								</div>
								<div class="mb-3">
									<label class="form-label">Specialist</label>
									<select name="spec" required class="form-control">
										<option><%=d.getSpecialist() %></option>
										
										<% SpecialistDAO dao=new SpecialistDAO(DBConnect.getConn());
										List<Specialist> list=dao.getAllSpecialist();
										for(Specialist s: list)
										{
											%>
												<option>	
													<%= s.getSpecialistName() %>	
												</option>
											<%
										}
										%>
									</select>
								</div>
								<div class="mb-3">
									<label class="form-label">Email</label>
									<input type="text" required name="email" value="<%=d.getEmail() %>" class="form-control">
								</div>
								<div class="mb-3">
									<label class="form-label">Mob No</label>
									<input type="text" required name="mobno" value="<%=d.getMobNo() %>" class="form-control">
								</div>
								<div class="mb-3">
									<label class="form-label">Password</label>
									<input type="password" name="password" required value="<%=d.getPassword() %>" class="form-control">
								</div>
								<input type="hidden" name="id" value="<%=d.getId()%>">
								<button type="submit" class="btn btn-primary col-md-12">Update</button>
							</form>
						</div>
					</div>
				</div>
				
				
			</div>
		</div>
</body>
</html>