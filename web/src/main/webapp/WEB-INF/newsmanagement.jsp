<%--
  Created by IntelliJ IDEA.
  User: Asset_Kenezhanov
  Date: 19-Dec-18
  Time: 3:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/HTML4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>News Management</title>
</head>
<body>
    <h2>News Management</h2>

    <h2>${msg}</h2>

    <form action="/newslistpage" method="post">
        <button type="submit">News List</button>
    </form>

    <form action="/addnewspage">
        <button type="submit">Add News</button>
    </form>
</body>
</html>
