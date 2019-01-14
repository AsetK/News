<%--
  Created by IntelliJ IDEA.
  User: Asset_Kenezhanov
  Date: 14-Jan-19
  Time: 4:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular-route.js"></script>
    <script $templateRequest(london)></script>
</head>

<body ng-app="myApp">

    <div ng-controller="myCtrl">

        First Name: <input type="text" ng-model="firstName"><br>
        Last Name: <input type="text" ng-model="lastName"><br>
        <br>
        Full Name: {{firstName + " " + lastName}}

    </div>

    <a href="#!london">City 1</a>

    <div ng-view></div>

    <script>
        var app = angular.module("myApp", ["ngRoute"]);

        app.config(function($routeProvider) {
            $routeProvider
                .when("/london", {
                    templateUrl : "london.html"
                });
        });
        app.controller('myCtrl', function($scope) {
            $scope.firstName = "John";
            $scope.lastName = "Doe";
        });
    </script>

</body>
</html>
