<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile" />
    </jsp:include>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />

    <div class="container">
        <h1>Welcome, ${sessionScope.user.username}!</h1>
    </div>
    <div class="container">
        <c:forEach var="ad" items="${sessionScope.user.ads}">
            <div class="card" style="width: 10rem;">
                <div class="card-body">
                    <h5 class="card-title">${ad.title}</h5>
                    <p>
                        <a>${ad.description}</a>
                    </p>
                </div>
            </div>
        </c:forEach>
    </div>

</body>
</html>
