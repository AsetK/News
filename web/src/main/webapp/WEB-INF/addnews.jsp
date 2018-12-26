<%--
  Created by IntelliJ IDEA.
  User: Asset_Kenezhanov
  Date: 19-Dec-18
  Time: 3:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/HTML4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Add News</title>
</head>
<body>
<h2>Add News</h2>
<form:form modelAttribute="news" action="/addnews" method="post">
    <table>
        <tr><td><spring:message code="label.newsTitle"/>    </td>    <td><form:input path="title"/>        </td></tr>
        <tr><td><spring:message code="label.newsDate"/>     </td>    <td><form:input path="date"/>        </td></tr>
        <tr><td><spring:message code="label.newsBrief"/>    </td>    <td><form:textarea path="brief"/>     </td></tr>
        <tr><td><spring:message code="label.newsContent"/>  </td>    <td><form:textarea path="content"/>   </td></tr>
    </table>
    <button type="submit">Add News</button>
</form:form>
</body>
</html>
