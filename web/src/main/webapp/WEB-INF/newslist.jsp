<%--
  Created by IntelliJ IDEA.
  User: Asset_Kenezhanov
  Date: 19-Dec-18
  Time: 3:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>News List</title>
</head>
<body>
    <h2>News List</h2>
    <c:forEach var="news" items="${newsList}">
        <fmt:formatDate value="${news.date}" pattern="dd/MM/yyyy" var="formattedDate" />
        <br>
        <table>
            <tr><td><spring:message code="label.newsTitle"/>    </td>       <td><c:out value="${news.title}"/>   </td></tr>
            <tr><td><spring:message code="label.newsDate"/>     </td>       <td><c:out value="${formattedDate}" />    </td></tr>
            <tr><td><spring:message code="label.newsBrief"/>    </td>       <td><c:out value="${news.brief}"/>   </td></tr>
        </table>

        <form action="/viewnews" method="post">
            <button type="submit" name="newsId" value="${news.id}">view</button>
        </form>
        <form action="/editnews" method="post">
            <button type="submit" name="newsId" value="${news.id}">edit</button>
        </form>

        <input form="deleteform" type="checkbox" name="newsId[]" value="${news.id} ">
    </c:forEach>

    <form id="deleteform" action="/deletesignednews" method="post">
        <button type="submit" >delete</button>
    </form>
</body>
</html>
