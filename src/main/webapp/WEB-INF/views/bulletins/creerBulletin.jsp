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
	<div>
		<ul class="nav nav-pills">
			<li role="presentations"><a
				href="<c:url value='/mvc/employes/lister'> </c:url>">Lister les
					remunerations</a></li>
			<li role="presentations"><a
				href="<c:url value='/mvc/employes/creer'> </c:url>">Ajouter une
					remuneration</a></li>
			<li role="presentations"><a href="/paie/mvc/bulletins/listerB">Lister
					les bulletins</a></li>
			<li role="presentations"><a href="/paie/mvc/bulletins/creerB">Créer
					un bulletin</a></li>
			<li role="presentations"><a
				href="<c:url value='/mvc/employes/logout'> </c:url>">Logout</a></li>
		</ul>
	</div>
	<h1 align="center">Ajouter une remuneration</h1>


	<form class="form-horizontal" method="post" action="">

		<!-- Select Basic -->
		<div class="form-group">
			<label class="col-md-4 control-label" for="periode">Période</label>
			<div class="col-md-4">
				<select id="periode" name="periode" class="form-control">
					<c:forEach var="periode" items="${listPeriode}">
						<option value="${periode.id}">debut : ${periode.dateDebut} / Fin : ${periode.dateFin}</option>
					</c:forEach>
				</select>
			</div>
		</div>

		<!-- Select Basic -->
		<div class="form-group">
			<label class="col-md-4 control-label" for="matricule">Matricule</label>
			<div class="col-md-4">
				<select id="matricule" name="matricule" class="form-control">
					<c:forEach var="employer" items="${listEmployer}">
						<option value="${employer.id}">${employer.matricule}</option>
					</c:forEach>
				</select>
			</div>
		</div>

		<!-- Text input-->
		<div class="form-group">
			<label class="col-md-4 control-label" for="prime">Prime
				exceptionnelle</label>
			<div class="col-md-4">
				<input id="prime" name="prime" placeholder="Prime exceptionnelle"
					class="form-control input-md" type="text">
			</div>
		</div>

		<!-- Button -->
		<div class="form-group">
			<label class="col-md-4 control-label" for=""></label>
			<div class="col-md-4">
				<button id="" name="" class="btn btn-default">Créer</button>
			</div>
		</div>
		<sec:csrfInput />
	</form>

</body>
</html>