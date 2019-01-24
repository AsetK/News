<%--
  Created by IntelliJ IDEA.
  User: Asset_Kenezhanov
  Date: 26-Dec-18
  Time: 3:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Edit News</title>
</head>
<body>
    <h2>View News</h2>
    <br>
    <form:form modelAttribute="news" action="savechanges">
        <table>
            <form:hidden path="id" />
            <tr><td><spring:message code="label.newsTitle"/>    </td>       <td><form:input path="title"/>   </td></tr>
            <tr><td><spring:message code="label.newsDate"/>     </td>       <td><form:input path="date"  />    </td></tr>
            <tr><td><spring:message code="label.newsBrief"/>    </td>       <td><form:textarea path="brief"/>   </td></tr>
            <tr><td><spring:message code="label.newsContent"/>  </td>       <td><form:textarea path="content"/>  </td></tr>
        </table>
        <button type="submit">Edit</button>
    </form:form>
</body>
</html>
