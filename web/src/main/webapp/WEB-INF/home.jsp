<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
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
    <script src="https://unpkg.com/angular-datetime-input"></script>
</head>

<body ng-app="myApp">

    <a href="#newsmanagement">News Management</a>

    <div ng-view></div>

    <script>
        var app = angular.module("myApp", ["ngRoute", "datetime"]);
        app
            .config(function($locationProvider) {
                $locationProvider.hashPrefix('');
            })
            .config(function($routeProvider) {
            $routeProvider
                .when("/newsmanagement", {
                    template:   '<h2>{{msg}}</h2>'+
                                '<a href="#newslist">News List</a> <br> <br>'+
                                '<a href="#addnews">Add News</a>',

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
                                    '<a href="#viewnews/{{news.id}}">View News</a>&nbsp&nbsp&nbsp'+
                                    '<a href="#editnews/{{news.id}}">Edit News</a>&nbsp&nbsp&nbsp'+
                                    '<input type="checkbox" ng-checked="checkedNews.indexOf(news.id) != -1" ng-click="toggleCheck(news.id)" >'+
                                    '<br><br>'+
                                '</div>'+
                                '<button ng-click="deletesigned()">Delete</button>',


                    controller: "newslist"
                })
                .when("/viewnews/:newsId", {
                    template:   '<h2>{{msg}}</h2>'+
                                '<h2>{{newsId}}</h2>'+
                                '<table>'+
                                    '<tr><td>Title:     </td><td>{{news.title}}                      </td></tr>'+
                                    '<tr><td>Brief:     </td><td>{{news.brief}}                      </td></tr>'+
                                    '<tr><td>Content:   </td><td>{{news.content}}                    </td></tr>'+
                                    '<tr><td>Date:      </td><td>{{news.date|date:"dd/MM/yyyy"}}     </td></tr>'+
                                '</table>'+
                                '<a href="#editnews/{{news.id}}">Edit News</a>&nbsp&nbsp&nbsp<a href="#deletenews/{{news.id}}">Delete News</a><br><br>',


                    controller: "viewnews"
                })
                .when("/editnews/:newsId", {
                    template:   '<h2>{{msg}}</h2>'+
                                    '<table>'+
                                        '<tr><td>Title:     </td><td><input type="text" ng-model="news.title">                      </td></tr>'+
                                        '<tr><td>Brief:     </td><td><input type="text" ng-model="news.brief">                      </td></tr>'+
                                        '<tr><td>Content:   </td><td><input type="text" ng-model="news.content">                    </td></tr>'+
                                        '<tr><td>Date:      </td><td><input type="text" ng-model="news.date" datetime="dd-MM-yyyy"> </td></tr>'+
                                    '</table>'+
                                '<button ng-click="save()">Save</button>',


                    controller: "editnews"
                })
                .when("/savechanges", {
                    template:   '<h2>{{msg}}</h2>'+
                                '<h2>{{news.title}}</h2>'+
                                '<h2>{{news.brief}}</h2>'+
                                '<h2>{{news.content}}</h2>'+
                                '<h2>{{news.date|date:"dd/MM/yyyy"}}</h2>',


                    controller: "savechanges"
                })
                .when("/deletenews/:newsId", {
                    template:   '<h2>{{msg}}</h2>',

                    controller: "deletenews"
                })
                .when("/addnews", {
                    template:   '<h2>{{msg}}</h2>'+
                                '<h2>{{status}}</h2>'+
                                '<h2>{{errorMessages}}</h2>'+
                                '<table>'+
                                '<tr><td>Title:     </td><td><input type="text" ng-model="news.title">                      </td><td>{{errorsMap["title"]}}     </td></tr>'+
                                '<tr><td>Brief:     </td><td><input type="text" ng-model="news.brief">                      </td><td>{{errorsMap["brief"]}}       </td></tr>'+
                                '<tr><td>Content:   </td><td><input type="text" ng-model="news.content">                    </td><td>{{errorsMap["content"]}}       </td></tr>'+
                                '<tr><td>Date:      </td><td><input type="text" ng-model="news.date" datetime="dd-MM-yyyy"> </td><td>{{errorsMap["date"]}}       </td></tr>'+
                                '</table>'+
                                '<button ng-click="addandsave()">Save</button>',

                    controller: "addnews"
                })
                .when("/newsisadded", {
                    template:   '<h2>{{msg}}</h2>',

                    controller: "newsisadded"
                })
                .when("/newsisdeleted", {
                    template:   '<h2>{{msg}}</h2>',

                    controller: "newsisdeleted"
                })
        });



        app.controller('newsmanagement', function($scope) {
            $scope.msg = "News Management";
        });

        app.controller('newslist', function($scope, $http, $location) {
            $http.get('newslistpage').then(
                function (response) {
                    $scope.newslist = response.data;
                }
            );
            $scope.msg = "News List";

            $scope.checkedNews = [];
            $scope.toggleCheck = function (news) {
                if ($scope.checkedNews.indexOf(news) === -1) {
                    $scope.checkedNews.push(news);
                } else {
                    $scope.checkedNews.splice($scope.checkedNews.indexOf(news), 1);
                }
            };

            $scope.deletesigned = function() {
                var Json_newsId = angular.toJson($scope.checkedNews);
                $http.post("deletesignednews", Json_newsId);
                $location.path('/newsisdeleted');
               };

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

        app.controller('editnews', function($scope, $http, $routeParams,$location, service_example) {
            var Json_newsId = angular.toJson($routeParams.newsId);
            $http.post('viewnews', Json_newsId).then(
                function (response) {
                    $scope.news = response.data;
                }
            );
            $scope.msg = "Edit News";

            $scope.save = function() {
                service_example.add_data($scope.news);
                $location.path('/savechanges');
            };
        });

        app.controller('savechanges', function($scope, service_example, $http) {
            var Json_news = angular.toJson(service_example.get_data());
            $http.post('savechanges',Json_news);
            $scope.msg = "News is edited";
            $scope.news = service_example.get_data();

        });

        app.controller('deletenews', function($scope, $http, $routeParams) {
            var Json_newsId = angular.toJson($routeParams.newsId);
            $http.post('deletenews', Json_newsId);
            $scope.msg = "News is deleted";
        });

        app.controller('addnews', function($scope, $http, $location, service_example) {
            $scope.msg = "Add News";

            $scope.addandsave = function() {
                var Json_news = angular.toJson($scope.news);
                $http.post('addnews', Json_news).then(
                    function (response) {
                        service_example.add_data($scope.news);
                        $location.path('/newsisadded');
                    },
                    function (errorResponse) {
                        $scope.status = errorResponse.status;
                        $scope.errorsMap = errorResponse.data;
                    });
            };
        });

        app.controller('newsisadded', function($scope) {
            $scope.msg = "News is added";
        });

        app.controller('newsisdeleted', function($scope) {
            $scope.msg = "News is deleted";
        });

        app.service('service_example', function() {
            var data;

            this.add_data = function(param) {
                data = param;
            };
            this.get_data = function() {
                return data;
            };
        });

    </script>

</body>
</html>
