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
	<div>
		<ul class="nav nav-pills">
			<li><a href="<c:url value='/mvc/employes/lister'> </c:url>">Lister
					les remunerations</a></li>
			<li><a href="<c:url value='/mvc/employes/creer'> </c:url>">Ajouter
					une remuneration</a></li>
			<li><a href="<c:url value='/mvc/bulletins/listerB'> </c:url>">Lister
					les bulletins</a></li>
			<li><a href="<c:url value='/mvc/bulletins/creerB'> </c:url>">Créer
					un bulletin</a></li>
			<li><a href="<c:url value='/mvc/employes/logout'> </c:url>">Logout</a></li>
		</ul>
	</div>
	<h1 align="center">Bulletin de salaire</h1>
	<div
		class="col-lg-3 col-md-3 col-sm-3 col-xs-3 col-lg-offset-8 col-md-offset-8 col-sm-offset-8 col-xs-offset-8">
		<h4>
			<strong>Période</strong>
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
					<td>Salaire Brut</td>
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
						<td style="text-align: center;">${resultatsCalcul.salaireBrut * Cotisation.tauxSalarial}</td>
						<td style="text-align: center;">${Cotisation.tauxPatronal}</td>
						<td style="text-align: center;">${resultatsCalcul.salaireBrut * Cotisation.tauxPatronal}</td>
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
					<td style="text-align: center;">Total retenue</td>
					<td style="text-align: center;"></td>
					<td style="text-align: center;"></td>
					<td style="text-align: center;">${resultatsCalcul.totalRetenueSalarial}</td>
					<td style="text-align: center;"></td>
					<td style="text-align: center;">${resultatsCalcul.totalCotisationsPatronales}</td>
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
						<td style="text-align: center;">${resultatsCalcul.salaireBrut * Cotisation.tauxSalarial}</td>
						<td style="text-align: center;">${Cotisation.tauxPatronal}</td>
						<td style="text-align: center;">${resultatsCalcul.salaireBrut * Cotisation.tauxPatronal}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<div
		class="col-lg-2 col-md-5 col-sm-5 col-xs-5 col-lg-offset-9 col-md-offset-6 col-sm-offset-6 col-xs-offset-6">
		<br />
		<strong>Net A Payer : ${resultatsCalcul.netAPayer}</strong>
	</div>
	<br />
	<br />
	<br />

</body>
</html>