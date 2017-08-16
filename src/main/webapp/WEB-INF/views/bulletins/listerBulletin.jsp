<%@page import="dev.paie.entite.ResultatCalculRemuneration"%>
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

	<table border='2' class="col-lg-10 col-md-10 col-sm-10 col-xs-10 col-lg-offset-1 col-md-offset-1 col-sm-offset-1 col-xs-offset-1">
		<thead>
			<tr>
				<th style="text-align: center;">Date et heure de création</th>
				<th style="text-align: center;">Période</th>
				<th style="text-align: center;">Matricule</th>
				<th style="text-align: center;">Salaire Brut</th>
				<th style="text-align: center;">Net Imposable</th>
				<th style="text-align: center;">Net A Payer</th>
				<th style="text-align: center;">Action</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="Bulletin" items="${listBulletin}" varStatus="b">
				<tr>
					<td style="text-align: center;">${Bulletin.dateHeureCreation}</td>
					<td style="text-align: center;">${Bulletin.periode.dateDebut} / ${Bulletin.periode.dateFin}</td>
					<td style="text-align: center;">${Bulletin.remunerationEmploye.matricule}</td>
					<td style="text-align: center;">${resultatsCalcul[b.index].salaireBrut}</td>
					<td style="text-align: center;">${resultatsCalcul[b.index].netImposable}</td>
					<td style="text-align: center;">${resultatsCalcul[b.index].netAPayer}</td>
					<td style="text-align: center;"><a href="/paie/mvc/bulletins/visuB/${Bulletin.id}">Visualiser</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>


</body>
</html>