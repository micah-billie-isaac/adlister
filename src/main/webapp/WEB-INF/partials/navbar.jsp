<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous"></script>

<%--<style>--%>
<%--    .navbar {--%>
<%--        height: 40px;--%>
<%--    }--%>
<%--</style>--%>
<nav class="navbar navbar-expand-lg bg-body-tertiary">
    <div class="container-fluid">
        <a class="navbar-brand" href="/">Adlister</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link" aria-current="page" href="/ads">All Ads</a>
                </li>
                <% if (request.getSession().getAttribute("user") == null) {%>
                <li class="nav-item">
                    <a class="nav-link" href="/register">Register</a>
                </li>
                <% } %>
                <% if (request.getSession().getAttribute("user") == null) {%>
                <li class="nav-item">
                    <a class="nav-link" href="/login">Login</a>
                </li>
                <% } %>
                <% if (request.getSession().getAttribute("user") != null) {%>
                <li class="nav-item">
                    <a class="nav-link" href="/profile">Profile</a>
                </li>
                <% } %>
                <% if (request.getSession().getAttribute("user") != null) {%>
                <li class="nav-item">
                    <a class="nav-link" id="createBtn" href="/ads/create">Create Ad</a>
                </li>
                <% } %>
                <% if (request.getSession().getAttribute("user") != null) {%>
                <li class="nav-item">
                    <a class="nav-link" href="/logout">Logout</a>
                </li>
                <% } %>
            </ul>
            <form class="d-flex" role="search" action="/search" method="get">
                <input name="search" class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success" type="submit">Search</button>
            </form>
        </div>
    </div>
</nav>





