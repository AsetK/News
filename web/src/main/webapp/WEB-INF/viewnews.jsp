<%--
  Created by IntelliJ IDEA.
  User: Asset_Kenezhanov
  Date: 26-Dec-18
  Time: 1:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>View News</title>
</head>
<body>
    <h2>View News</h2>
    <fmt:formatDate value="${news.date}" pattern="dd/MM/yyyy" var="formattedDate" />
    <br>
    <table>
        <tr><td><spring:message code="label.newsTitle"/>    </td>       <td><c:out value="${news.title}"/>   </td></tr>
        <tr><td><spring:message code="label.newsDate"/>     </td>       <td><c:out value="${formattedDate}"/>    </td></tr>
        <tr><td><spring:message code="label.newsBrief"/>    </td>       <td><c:out value="${news.brief}"/>   </td></tr>
        <tr><td><spring:message code="label.newsContent"/>  </td>       <td><c:out value="${news.content}"/>  </td></tr>
    </table>
</body>
</html>
