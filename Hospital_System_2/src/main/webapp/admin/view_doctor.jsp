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
				
				<div class="col-md-12">
					<div class="card paint-card">
						<div class="card-body">
							<p class="fs-3 text-center">Doctor Details</p>
							<table class="table">
								<thead>
									<tr>
										<th scope="col">Full Name</th>
										<th scope="col">DOB</th>
										<th scope="col">Qualification</th>
										<th scope="col">Specialist</th>
										<th scope="col">Email</th>
										<th scope="col">Mob No</th>
										<th scope="col">Action</th>
									</tr>
								</thead>
								<tbody>
									<%
										DoctorDAO dao2=new DoctorDAO(DBConnect.getConn());
										List<Doctor> list2=dao2.getAllDoctor();
										for(Doctor d:list2)
										{%>
										<tr>
											<td><%=d.getFullName() %></td>
											<td><%=d.getDob() %></td>
											<td><%=d.getQualification() %></td>
											<td><%=d.getSpecialist() %></td>
											<td><%=d.getEmail() %></td>
											<td><%=d.getMobNo() %></td>
											<td>
												<a href="edit_doctor.jsp?id=<%=d.getId() %>" class="btn btn-sm btn-primary">Edit</a>
												<a href="../deleteDoctor?id=<%=d.getId() %>" class="btn btn-sm btn-danger">Delete</a>
											</td>
										</tr>
											
										<%}
									%>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
</body>
</html>