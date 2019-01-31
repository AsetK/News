<%--
  Created by IntelliJ IDEA.
  User: Asset_Kenezhanov
  Date: 08-Jan-19
  Time: 12:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Login</title>
</head>
<body>
    <c:if test="${not empty error}">
        ${error}
    </c:if>

    <form name="form_login" action="/j_spring_security_check" method="post">
        <table>
            <tr><td>User        </td>   <td><input type="text" name="user_login"/>          </td></tr>
            <tr><td>Password    </td>   <td><input type="text" name="user_password"/>       </td></tr>
        </table>
        <input name="spring_security_remember_me" type="checkbox"/>
        <button type="submit">Login</button>
    </form>

</body>
</html>
