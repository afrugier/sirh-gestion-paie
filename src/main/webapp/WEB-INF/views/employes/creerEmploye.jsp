<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

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
	<h1 align="center">Ajouter une remuneration</h1>


	<form class="form-horizontal" method="post" action="">

		<!-- Text input-->
		<div class="form-group">
			<label class="col-lg-3 col-md-3 col-sm-3 col-xs-3 col-lg-offset-1 col-sm-offset-1 col-xs-offset-1 control-label" for="textinput">Matricule</label>
			<div class="col-lg-4 col-md-7 col-sm-7 col-xs-7">
				<input id="matricule" name="matricule" class="form-control input-md"
					type="text">
			</div>
		</div>

		<!-- Select Entreprise -->
		<div class="form-group">
			<label class="col-lg-3 col-md-3 col-sm-3 col-xs-3 col-sm-offset-1 col-xs-offset-1 control-label" for="entreprise">Entreprise</label>
			<div class="col-lg-4 col-md-7 col-sm-7 col-xs-7">
				<select id="entreprise" name="entreprise" class="form-control">
					<c:forEach var="entreprise" items="${listEntreprise}">
						<option value="${entreprise.id}">${entreprise.denomination}</option>
					</c:forEach>
				</select>
			</div>
		</div>

		<!-- Select Basic -->
		<div class="form-group">
			<label class="col-lg-3 col-md-3 col-sm-3 col-xs-3 col-sm-offset-1 col-xs-offset-1 control-label" for="profil">Profil</label>
			<div class="col-lg-4 col-md-7 col-sm-7 col-xs-7">
				<select id="profil" name="profil" class="form-control">
					<c:forEach var="profil" items="${listProfil}">
						<option value="${profil.id}">${profil.code}</option>
					</c:forEach>
				</select>
			</div>
		</div>

		<!-- Select Basic -->
		<div class="form-group">
			<label class="col-lg-3 col-md-3 col-sm-3 col-xs-3 col-sm-offset-1 col-xs-offset-1 control-label" for="grade">Grade</label>
			<div class="col-lg-4 col-md-7 col-sm-7 col-xs-7">
				<select id="grade" name="grade" class="form-control">
					<c:forEach var="grade" items="${listGrade}">
						<option value="${grade.id}">${grade.code}</option>
					</c:forEach>
				</select>
			</div>
		</div>

		<!-- Button -->
		<div class="form-group">
			<label class="control-label" for="singlebutton"></label>
			<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3 col-lg-offset-5 col-md-offset-8 col-sm-offset-8 col-xs-offset-8">
				<button id="ajouter" name="ajouter" class="btn btn-block btn-primary">Ajouter</button>
			</div>
		</div>
		<sec:csrfInput/>
	</form>

</body>
</html>