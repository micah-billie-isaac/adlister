<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
        crossorigin="anonymous"></script>


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

<%--            LOGIN & REGISTER--%>
                <div class="container-fluid">
                    <ul class="nav navbar-nav navbar-right">
                        <% if (request.getSession().getAttribute("user") == null) {%>
                        <a href="/register">Register</a>
                        <% } %>
                        <% if (request.getSession().getAttribute("user") == null) {%>
                        <a href="/login">Login</a>
                        <% } %>

                        <% if (request.getSession().getAttribute("user") != null) {%>
                        <li><a href="/logout">Logout</a></li>
                        <% } %>
                    </ul>
                </div>


            <%--SEARCH BAR--%>
            <div class="search">
                <form action="/search" method="get">
                    <input type="text"
                           placeholder="Search Ads"
                           name="search"
                           class="form-control me-2"
                           aria-label="Search">
                    <button class="btn btn-outline-success" type="submit">Search</button>
                </form>
            </div>
        </div>
    </div>
</nav>


<%--split   --%>



