<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile"/>
    </jsp:include>
</head>

<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>
<h1 class="text-center">Welcome, ${sessionScope.user.username}!</h1>


<div class="container text-center d-flex justify-content-between">
    <c:forEach var="ad" items="${sessionScope.user.ads}">
        <div class="card border shadow text-center" style="width: 10rem;">
            <div class="card-body">
                <h5 class="card-title">${ad.title}</h5>
                <a>${ad.description}</a>
                <br>
                <a href="/delete?id=${ad.id}">Delete</a>
            </div>
        </div>
    </c:forEach>
</div>
</body>
</html>
