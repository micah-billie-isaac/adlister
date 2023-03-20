<%@ page import="com.codeup.adlister.models.User" %>
<nav class="navbar navbar-default">

    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <a class="navbar-brand" href="/ads">Adlister</a>
            <% if (request.getSession().getAttribute("user") != null) {%>
            <a class="navbar-brand" id="createBtn" href="/ads/create">Create Ad</a>
            <% } %>
        </div>
<%--        search bar--%>
        <div class="search">
            <form action="/search" method="get">
                <input type="text"
                       placeholder="Search Courses"
                       name="search">
                <button>
                    <i class="fa fa-search"
                       style="font-size: 18px"></i></button>
            </form>
        </div>

        <ul class="nav navbar-nav navbar-right">
            <% if (request.getSession().getAttribute("user") == null) {%>
            <li><a href="/register">Register</a></li>
            <% } %>
            <% if (request.getSession().getAttribute("user") == null) {%>
            <li><a href="/login">Login</a></li>
            <% } %>

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