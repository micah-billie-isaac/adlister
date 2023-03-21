<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="partials/head.jsp">
        <jsp:param name="title" value="Register For Our Site!"/>
    </jsp:include>
</head>
<body>

<% if (request.getAttribute("req1") != null) {%>
<div class="alert alert-danger" role="alert">
    Username is shorter than 3 characters!
</div>

<% } %>
<% if (request.getAttribute("req2") != null) {%>
<div class="alert alert-danger" role="alert">
    Username is longer than 15 characters!
</div>

<% } %><% if (request.getAttribute("req3") != null) {%>
<div class="alert alert-danger" role="alert">
    Password is shorter than 8 characters!
</div>
<% } %>


<jsp:include page="partials/navbar.jsp"/>
<div class="container">
    <h1>Please fill in your information.</h1>
    <form action="/register" method="post">
        <div class="form-group">
            <label for="username">Username</label>
            <input id="username" name="username" class="form-control" type="text">
        </div>
        <div class="form-group">
            <label for="email">Email</label>
            <input id="email" name="email" class="form-control" type="text">
        </div>
        <div class="form-group">
            <label for="password">Password</label>
            <input id="password" name="password" class="form-control" type="password">
        </div>
        <input type="submit" class="btn btn-primary btn-block">
    </form>
    <div class="card" style="width: 25rem;">
        <div class="card-body">
            <h5 class="card-title">Register Requirements</h5>
            <p>
                <a>Username must have more than 3 characters:</a>
                <a>Username must have less than 15 characters:</a>
                <a>Password must have more than 8 characters:</a>
            </p>
        </div>
    </div>
</div>
</body>
</html>
