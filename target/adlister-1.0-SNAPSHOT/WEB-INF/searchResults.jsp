<%@ page import="java.lang.reflect.Array" %>
<%@ page import="com.codeup.adlister.models.Ad" %><%--
  Created by IntelliJ IDEA.
  User: micahlarson
  Date: 3/20/23
  Time: 10:05 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    Ad searchAd = request.getAttribute("searchResults");
%>
<tr>
    <td><% searchAd.getTitle(); %>
    </td>
</tr>
</body>
</html>
