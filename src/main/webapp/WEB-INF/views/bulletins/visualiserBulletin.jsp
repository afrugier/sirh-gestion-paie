<%@page import="dev.paie.entite.ResultatCalculRemuneration"%>
<%@page import="java.time.ZonedDateTime"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
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
	<a href="<c:url value='/mvc/bulletins/listerB'> </c:url>"><img alt="retour" style="width:10%" class="col-lg-1 col-md-1 col-sm-1 col-xs-1 col-lg-offset-1 col-md-offset-1 col-sm-offset-1 col-xs-offset-1" src="http://img.freepik.com/icones-gratuites/gauche-fleche-croquis_318-75348.jpg?size=338&ext=jpg"></a>
	<h1 align="center" class="col-lg-5 col-md-5 col-sm-5 col-xs-5 col-lg-offset-1 col-md-offset-1 col-sm-offset-1 col-xs-offset-1">Bulletin de salaire</h1>
	<div
		class="col-lg-3 col-md-3 col-sm-3 col-xs-3 col-lg-offset-8 col-md-offset-8 col-sm-offset-8 col-xs-offset-8">
		<h4>
			<strong>P�riode</strong>
		</h4>
		<p>Du ${bulletin.periode.dateDebut} au ${bulletin.periode.dateFin}</p>
	</div>
	<div
		class="col-lg-5 col-md-5 col-sm-5 col-xs-5 col-lg-offset-1 col-md-offset-1 col-sm-offset-1 col-xs-offset-1">
		<h4>
			<strong>Entreprise</strong>
		</h4>
		<p>${bulletin.remunerationEmploye.entreprise.denomination}</p>
		<p>SIRET : ${bulletin.remunerationEmploye.entreprise.siret}</p>
	</div>

	<div
		class="col-lg-10 col-md-10 col-sm-10 col-xs-10 col-lg-offset-1 col-md-offset-1 col-sm-offset-1 col-xs-offset-1">
		<h4>
			<strong>Salaire</strong>
		</h4>
		<table border='2' class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<thead>
				<tr>
					<th style="text-align: center;">Rubriques</th>
					<th style="text-align: center;">Base</th>
					<th style="text-align: center;">Taux Salarial</th>
					<th style="text-align: center;">Montant Salarial</th>
					<th style="text-align: center;">Taux patronal</th>
					<th style="text-align: center;">Cot. patronales</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>Salaire de Base</td>
					<td style="text-align: center;">${resultatsCalcul.salaireDeBase}</td>
					<td style="text-align: center;">${bulletin.remunerationEmploye.grade.tauxBase}</td>
					<td style="text-align: center;">${resultatsCalcul.totalRetenueSalarial}</td>
					<td style="text-align: center;"></td>
					<td style="text-align: center;"></td>
				</tr>
				<tr>
					<td>Prime Except.</td>
					<td style="text-align: center;"></td>
					<td style="text-align: center;"></td>
					<td style="text-align: center;">${bulletin.primeExceptionnelle}</td>
					<td style="text-align: center;"></td>
					<td style="text-align: center;"></td>
				</tr>
				<tr>
					<td style="text-align: center;"></td>
					<td style="text-align: center;"></td>
					<td style="text-align: center;"></td>
					<td style="text-align: center;"></td>
					<td style="text-align: center;"></td>
					<td style="text-align: center;"></td>
				</tr>
				<tr>
					<td><strong>Salaire Brut</strong></td>
					<td style="text-align: center;"></td>
					<td style="text-align: center;"></td>
					<td style="text-align: center;">${resultatsCalcul.salaireBrut}</td>
					<td style="text-align: center;"></td>
					<td style="text-align: center;"></td>
				</tr>
			</tbody>
		</table>
	</div>

	<div
		class="col-lg-10 col-md-10 col-sm-10 col-xs-10 col-lg-offset-1 col-md-offset-1 col-sm-offset-1 col-xs-offset-1">
		<h4>
			<strong>Cotisations</strong>
		</h4>
		<table border='2' class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<thead>
				<tr>
					<th style="text-align: center;">Rubriques</th>
					<th style="text-align: center;">Base</th>
					<th style="text-align: center;">Taux Salarial</th>
					<th style="text-align: center;">Montant Salarial</th>
					<th style="text-align: center;">Taux patronal</th>
					<th style="text-align: center;">Cot. patronales</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="Cotisation" items="${listCotisationNomImposable}">
					<tr>
						<td>${Cotisation.code}${Cotisation.libelle}</td>
						<td style="text-align: center;">${resultatsCalcul.salaireBrut}</td>
						<td style="text-align: center;">${Cotisation.tauxSalarial}</td>
						<td style="text-align: center;"><fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${resultatsCalcul.salaireBrut * Cotisation.tauxSalarial}"/></td>
						<td style="text-align: center;">${Cotisation.tauxPatronal}</td>
						<td style="text-align: center;"><fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${resultatsCalcul.salaireBrut * Cotisation.tauxPatronal}"/></td>
					</tr>
				</c:forEach>
				<tr>
					<td style="text-align: center;"></td>
					<td style="text-align: center;"></td>
					<td style="text-align: center;"></td>
					<td style="text-align: center;"></td>
					<td style="text-align: center;"></td>
					<td style="text-align: center;"></td>
				</tr>
				<tr>
					<td style="text-align: center;"><strong>Total retenue</strong></td>
					<td style="text-align: center;"></td>
					<td style="text-align: center;"></td>
					<td style="text-align: center;">${resultatsCalcul.totalRetenueSalarial}</td>
					<td style="text-align: center;"></td>
					<td style="text-align: center;"><fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${resultatsCalcul.totalCotisationsPatronales}"/></td>
				</tr>
			</tbody>
		</table>
	</div>

	<div
		class="col-lg-10 col-md-10 col-sm-10 col-xs-10 col-lg-offset-1 col-md-offset-1 col-sm-offset-1 col-xs-offset-1">
		<h4>
			<strong>Net Imposable : ${resultatsCalcul.netImposable}</strong>
		</h4>
		<table border='2' class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<thead>
				<tr>
					<th style="text-align: center;">Rubriques</th>
					<th style="text-align: center;">Base</th>
					<th style="text-align: center;">Taux Salarial</th>
					<th style="text-align: center;">Montant Salarial</th>
					<th style="text-align: center;">Taux patronal</th>
					<th style="text-align: center;">Cot. patronales</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="Cotisation" items="${listCotisationImposable}">
					<tr>
						<td>${Cotisation.code}${Cotisation.libelle}</td>
						<td style="text-align: center;">${resultatsCalcul.salaireBrut}</td>
						<td style="text-align: center;">${Cotisation.tauxSalarial}</td>
						<td style="text-align: center;"><fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${resultatsCalcul.salaireBrut * Cotisation.tauxSalarial}"/></td>
						<td style="text-align: center;">${Cotisation.tauxPatronal}</td>
						<td style="text-align: center;"><fmt:formatNumber type = "number" maxFractionDigits = "2" value = "${resultatsCalcul.salaireBrut * Cotisation.tauxPatronal}"/></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<div
		class="col-lg-3 col-md-3 col-sm-3 col-xs-4 col-lg-offset-9 col-md-offset-9 col-sm-offset-9 col-xs-offset-8">
		<br />
		<strong>Net A Payer : ${resultatsCalcul.netAPayer}</strong>
	</div>
	<br />
	<br />
	<br />

</body>
</html>