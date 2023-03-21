<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Create a new Ad"/>
    </jsp:include>
</head>
<body>
<div class="container">
    <h1>Create a new Ad</h1>
    <form action="/ads/create" method="post">
        <div class="form-group">
            <label for="title">Title</label>
            <input id="title" name="title" class="form-control" type="text">
        </div>
        <div class="form-group">
            <label for="description">Description</label>
            <textarea id="description" name="description" class="form-control" type="text"></textarea>
        </div>

        <label>Categories</label>
        <div class="form-group">
            <div class="category">
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="" id="help">
                    <label class="form-check-label" for="help">
                        Help Wanted
                    </label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="" id="furniture">
                    <label class="form-check-label" for="furniture">
                        Furniture
                    </label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="" id="animals">
                    <label class="form-check-label" for="animals">
                        Animals
                    </label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="" id="exercise">
                    <label class="form-check-label" for="exercise">
                        Exercise
                    </label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="" id="misc">
                    <label class="form-check-label" for="misc">
                        Miscellaneous
                    </label>
                </div>
            </div>
        </div>

        <input type="submit" class="btn btn-block btn-primary">
    </form>
</div>
<style>
    body {
        background-color: ivory;
    }
</style>
</body>
</html>
