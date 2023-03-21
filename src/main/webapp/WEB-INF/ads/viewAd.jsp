<%@ page import="com.codeup.adlister.models.Ad" %><%--
  Created by IntelliJ IDEA.
  User: billiedorries
  Date: 3/17/23
  Time: 12:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing ad"/>
    </jsp:include>
</head>
<body>

<jsp:include page="/WEB-INF/partials/navbar.jsp" />

<div class="container">
    <div class="card" style="width: 10rem;">
        <div class="card-body">
            <h5 class="card-title"><c:out value="${fetchedAd.title}"/></h5>
            <p>
                <a><c:out value="${fetchedAd.description}"/></a>
                <ul id="category-list">
                    <c:forEach var="category" items="${fetchedAd.categories}">
                      <li>${category}</li>
                    </c:forEach>
                </ul>
            </p>
        </div>
    </div>
</div>
</body>
</html>

