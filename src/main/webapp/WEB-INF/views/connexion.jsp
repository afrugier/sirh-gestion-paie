<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Paie - App</title>
<link rel="stylesheet"
	href='<c:url value="/bootstrap-3.3.7-dist/css/bootstrap.css"></c:url>'>
</head>
<body class="container">
	<h1>Connexion</h1>
	<!-- Spring Security s'attend aux paramètres "username" et "password" -->
	<form method="post">
		<div class="form-group">
			<label
				class="col-lg-3 col-md-3 col-sm-3 col-xs-3 col-lg-offset-1 col-sm-offset-1 col-xs-offset-1 control-label"
				for="username">Identifiant</label>
			<div class="col-lg-7 col-md-7 col-sm-7 col-xs-7">
				<input name="username" class="form-control input-md" required="">
			</div>
		</div>

		<div class="form-group">
			<label
				class="col-lg-3 col-md-3 col-sm-3 col-xs-3 col-lg-offset-1 col-sm-offset-1 col-xs-offset-1 control-label"
				for="password">Mot De Passe</label>
			<div class="col-lg-7 col-md-7 col-sm-7 col-xs-7">
				<input name="password" type="password" class="form-control input-md" required="">
			</div>
		</div>
		
		<div class="form-group">
			<label class="control-label" for="singlebutton"></label>
			<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3 col-lg-offset-8 col-md-offset-8 col-sm-offset-8 col-xs-offset-8">
				<input class="btn btn-block btn-primary" type="submit" value="Se connecter">
			</div>
		</div>
		 
		<sec:csrfInput />
	</form>
	<!-- en cas d'erreur un paramètre "error" est créé par Spring Security -->
	<c:if test="${param.error !=null}">
Erreur d'authentification
</c:if>
</body>
</html>