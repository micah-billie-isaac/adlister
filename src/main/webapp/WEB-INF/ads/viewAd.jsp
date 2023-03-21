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
    <jsp:param name="title" value="Viewing ad" />
  </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />

  <div class="container">
    <h1>Ad</h1>
    <h3><c:out value = "${fetchedAd.title}"/></h3>
    <p><c:out value = "${fetchedAd.description}"/></p>
        <ul id="category-list">
          <c:forEach var="category" items="${fetchedAd.categories}">
            <li>${category}</li>
          </c:forEach>
        </ul>
  </div>

</body>
</html>

