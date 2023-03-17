<%@ page import="com.codeup.adlister.models.User" %>
<nav class="navbar navbar-default">

    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <a class="navbar-brand" href="/ads">Adlister</a>
<<<<<<< HEAD
            <% if (request.getSession().getAttribute("user") != null) {%>
            <a class="navbar-brand" id="createBtn" href="/ads/create">Create Ad</a>
            <% } %>
=======
            <a href="/ads/create">Create Ad</a>

>>>>>>> f1cfc9c (working on ad details. branching after this commit)
        </div>
        <ul class="nav navbar-nav navbar-right">
            <li><a href="/register">Register</a></li>
            <li><a href="/login">Login</a></li>

            <% if (request.getSession().getAttribute("user") != null) {%>
            <li><a href="/logout">Logout</a></li>
            <% } %>

        </ul>
    </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>


<%--//if user = null then do not pop up create add--%>
<%--//if user = login then pop up adds--%>
<%--//make it a special feature--%>
<%--//take out logout if already logged out--%>
<%--//keep it in the session or put--%>