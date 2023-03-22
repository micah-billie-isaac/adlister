<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads"/>
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>

<h1 class="text-center">Here are all the ads!</h1>

<div class="container text-center d-flex flex-wrap justify-content-between">

    <c:forEach var="ad" items="${ads}">

        <div class="card border shadow" style="width: 10rem;">
            <div class="card-body">
                <h5 class="card-title">${ad.title}</h5>
                <p>
                    <a href="/ViewAdServlet?id=${ad.id}">...more</a>
                </p>
            </div>
        </div>
    </c:forEach>
</div>
</body>
</html>
