<%@page import="java.time.ZonedDateTime"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<%@page import="java.util.List"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="<c:url value='/bootstrap-3.3.7-dist/css/bootstrap.css'> </c:url>">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<title>SGP - App</title>
</head>
<body>
	<c:import url="../menu.jsp"></c:import>
	<h1 align="center">Liste des remunerations</h1>

	<table border='2'
		class="col-lg-10 col-md-10 col-sm-10 col-xs-10 col-lg-offset-1 col-md-offset-1 col-sm-offset-1 col-xs-offset-1">
		<thead>
			<tr>
				<th style="text-align: center;">Date et heure de création</th>
				<th style="text-align: center;">Matricule</th>
				<th style="text-align: center;">Grade</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="Employe" items="${listEmploye}">
				<tr>
					<td style="text-align: center;">${Employe.dateHeureCreation}</td>
					<td style="text-align: center;">${Employe.matricule}</td>
					<td style="text-align: center;">${Employe.grade.code}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>


</body>
</html>