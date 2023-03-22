<%@ page import="java.lang.reflect.Array" %>
<%@ page import="com.codeup.adlister.models.Ad" %><%--
  Created by IntelliJ IDEA.
  User: micahlarson
  Date: 3/20/23
  Time: 10:05 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing Searched Ads"/>
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>
<c:forEach var="ad" items="${ads}">
    <div class="container d-flex justify-content-center">
        <div class="card border shadow text-center" style="width: 10rem;">
            <div class="card-body">
                <h5 class="card-title">${ad.title}</h5>
                <p>
                    <a>${ad.description}</a>
                </p>
                <ul id="category-list">
                    <c:forEach var="category" items="${ad.categories}">
                        <li>${category}</li>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </div>
</c:forEach>
</body>
</html>
