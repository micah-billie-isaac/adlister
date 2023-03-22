<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous"></script>

<style>
    .navbar {
        height: 40px;
    }
</style>
<nav class="navbar navbar-expand-lg bg-body-tertiary">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#"></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#topNavbar"
                    aria-controls="topNavbar" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
        </div>
        <div class="collapse navbar-collapse justify-content-between" id="topNavbar">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="#"></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#"></a>
                </li>
            </ul>

            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="/register">Register</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/login">Login</a>
                </li>
            </ul>
        </div>
    </div>
</nav>


<%--SPACE--%>
<nav class="navbar navbar-expand-lg bg-body-tertiary ">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">ADLISTER</a>
        <%--LINK TO ALL ADS--%>
        <div class="navbar-header">
            <a class="navbar-brand" href="/ads">All Ads</a>
            <% if (request.getSession().getAttribute("user") != null) {%>
            <a class="navbar-brand" id="createBtn" href="/ads/create">Create Ad</a>
            <% } %>
        </div>

        <%--SEARCH BAR--%>
        <div class="search mx-auto">
            <div class="search">
            <form action="/search" method="get" class="row">
                <div class="row">
                    <input type="text"
                           placeholder="Search Ads"
                           name="search"
                           class="form-control me-2"
                           aria-label="Search">
                </div>
                <div class="col-auto">
                    <button class="btn btn-outline-success" type="submit">Search</button>
                </div>
            </form>
        </div>
    </div>
    </div>
</nav>


<%--split   --%>

<%--            LOGIN & REGISTER--%>
<div class="container-fluid">
    <ul class="nav navbar-nav navbar-right">
        <%--        <% if (request.getSession().getAttribute("user") == null) {%>--%>
        <%--        <a href="/register">Register</a>--%>
        <%--        <% } %>--%>
        <%--        <% if (request.getSession().getAttribute("user") == null) {%>--%>
        <%--        <a href="/login">Login</a>--%>
        <%--        <% } %>--%>
        <% if (request.getSession().getAttribute("user") != null) {%>
        <li><a href="/logout">Logout</a></li>
        <% } %>
    </ul>
</div>

