
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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