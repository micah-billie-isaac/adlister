<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>

<nav class="navbar navbar-default">

    <div class="container-fluid">

        <div class="navbar-header">
            <a class="navbar-brand" href="/ads">Adlister</a>
            <% if (request.getSession().getAttribute("user") != null) {%>
            <a class="navbar-brand" id="createBtn" href="/ads/create">Create Ad</a>
            <% } %>
        </div>


        <div class="search">
            <form action="/search" method="get">
                <input type="text"
                       placeholder="Search Ads"
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
    </div>
</nav>


