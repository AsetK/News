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
</head>

<body ng-app="myApp">

    <div ng-controller="myCtrl">

        First Name: <input type="text" ng-model="firstName"><br>
        Last Name: <input type="text" ng-model="lastName"><br>
        <br>
        Full Name: {{firstName + " " + lastName}}

    </div>

    <a href="#!newsmanagement">News Management</a>


    <div ng-view></div>

    <script>
        var app = angular.module("myApp", ["ngRoute"]);

        app.config(function($routeProvider) {
            $routeProvider
                .when("/newsmanagement", {
                    template:   '<h2>{{msg}}</h2>'+

                                '<a href="#!newslist">News List</a> <br> <br>'+

                                '<a href="#!newslist">Add News</a>',

                    controller: "newsmanagement"
                })
                .when("/newslist", {
                    template:   '<h2>{{msg}}</h2>'+
                                '<div ng-repeat="news in newslist">'+
                                    '<table>'+
                                        '<tr><td>Title:     </td><td>{{news.title}}                      </td></tr>'+
                                        '<tr><td>Brief:     </td><td>{{news.brief}}                      </td></tr>'+
                                        '<tr><td>Date:      </td><td>{{news.date | date:"dd/MM/yyyy"}}   </td></tr>'+
                                    '</table>'+
                                    '<a href="#!viewnews/{{news.id}}">View News</a>&nbsp&nbsp&nbsp<a href="#!editnews/{{news.id}}">Edit News</a><br><br>'+
                                '</div>',

                    controller: "newslist"
                })
                .when("/viewnews/:newsId", {
                    template:   '<h2>{{msg}}</h2>'+
                                '<h2>{{newsId}}</h2>'+
                                '<table>'+
                                    '<tr><td>Title:     </td><td>{{news.title}}                      </td></tr>'+
                                    '<tr><td>Brief:     </td><td>{{news.brief}}                      </td></tr>'+
                                    '<tr><td>Date:      </td><td>{{news.date | date:"dd/MM/yyyy"}}   </td></tr>'+
                                '</table>',

                    controller: "viewnews"
                })
                .when("/editnews/:newsId", {
                    template:   '<h2>{{msg}}</h2>'+
                                '<h2>{{newsId}}</h2>'+
                                '<form action="">'+
                                    '<table>'+
                                        '<tr><td>Title:     </td><td><input type="text" value= {{news.title}}>                      </td></tr>'+
                                        '<tr><td>Brief:     </td><td><input type="text" value={{news.brief}} >                     </td></tr>'+
                                        '<tr><td>Date:      </td><td><input type="text" value={{news.date | date:"dd/MM/yyyy"}}>   </td></tr>'+
                                    '</table>'+
                                '</form>',

                    controller: "editnews"
                });
        });








        app.controller('newsmanagement', function($scope) {
            $scope.msg = "News Management";
        });
        app.controller('newslist', function($scope, $http) {
            $http.get('newslistpage').then(
                function (response) {
                    $scope.newslist = response.data;
                }
            );
            $scope.msg = "News List";

        });
        app.controller('viewnews', function($scope, $http, $routeParams) {
            var Json_newsId = angular.toJson($routeParams.newsId);
            $http.post('viewnews', Json_newsId).then(
                function (response) {
                    $scope.news = response.data;
                }
            );
            $scope.msg = "News";
        });
        app.controller('editnews', function($scope, $http, $routeParams) {
            var Json_newsId = angular.toJson($routeParams.newsId);
            $http.post('viewnews', Json_newsId).then(
                function (response) {
                    $scope.news = response.data;
                }
            );
            $scope.msg = "Edit News";
        });
        app.controller('myCtrl', function($scope) {
            $scope.firstName = "John";
            $scope.lastName = "Doe";
            $scope.msg = "News Management";
        });

    </script>

</body>
</html>
