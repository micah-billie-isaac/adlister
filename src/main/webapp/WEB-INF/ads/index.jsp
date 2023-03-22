<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />

<div class="container text-center">
    <h1>Here are all the ads!</h1>

    <c:forEach var="ad" items="${ads}">

        <div class="card" style="width: 10rem;">
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
