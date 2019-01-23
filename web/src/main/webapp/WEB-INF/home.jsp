<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: Asset_Kenezhanov
  Date: 14-Jan-19
  Time: 4:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Title</title>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular-route.js"></script>
    <script src="https://unpkg.com/angular-datetime-input"></script>
    <script src="https://cdn.rawgit.com/angular-translate/bower-angular-translate/2.5.0/angular-translate.js"></script>
</head>

<body ng-app="myApp">

    <div ng-controller="translateController">
        <a href="" ng-click="changeLanguage('en')">English</a>|<a href="" ng-click="changeLanguage('ru')">Русский</a><br><br>
    </div>

    <a href="#newsmanagement">{{"label.newsManagement" | translate}}</a>

    <div ng-view></div>

    <script>
        var app = angular.module("myApp", ["ngRoute", "datetime", "pascalprecht.translate"]);
        app
            .config(function($locationProvider) {
                $locationProvider.hashPrefix('');
            })
            .config(["$translateProvider",function($translateProvider){

                var en_translations = {
                    "label.newsManagement"  : "News Management",
                    "label.newsList"        : "News List",
                    "label.addNews"         : "Add News",
                    "label.viewNews"        : "View News",
                    "label.editNews"        : "Edit News",
                    "label.deleteNews"      : "Delete News",
                    "label.newsIsAdded"     : "News is added",
                    "label.newsIsDeleted"   : "News is deleted",
                    "label.newsIsEdited"    : "News is edited",
                    "label.save"            : "Save",
                    "label.delete"          : "Delete",
                    "label.title"           : "Title:",
                    "label.brief"           : "Brief:",
                    "label.content"         : "Content:",
                    "label.date"            : "Date:",


                };

                var ru_translations = {
                    "label.newsManagement"  : "Управление новостями",
                    "label.newsList"        : "Список новостей",
                    "label.addNews"         : "Добавить новость",
                    "label.viewNews"        : "Просмотр новости",
                    "label.editNews"        : "Редактировать новость",
                    "label.deleteNews"      : "Удалить новость",
                    "label.newsIsAdded"     : "Новость добавлена",
                    "label.newsIsDeleted"   : "Новость удалена",
                    "label.newsIsEdited"    : "Новость редактирована",
                    "label.save"            : "Сохранить",
                    "label.delete"          : "Удалить",
                    "label.title"           : "Заголовок:",
                    "label.brief"           : "Сводка:",
                    "label.content"         : "Содержание:",
                    "label.date"            : "Дата:",
                };

                $translateProvider.translations('en',en_translations);

                $translateProvider.translations('ru',ru_translations);

                $translateProvider.preferredLanguage('en');

            }])
            .config(function($routeProvider) {
            $routeProvider
                .when("/newsmanagement", {
                    template:   '<h2>{{"label.newsManagement" | translate}}</h2>'+
                                '<a href="#newslist">{{"label.newsList" | translate}}</a> <br> <br>'+
                                '<a href="#addnews">{{"label.addNews" | translate}}</a>',

                    controller: "newsmanagement"
                })
                .when("/newslist", {
                    template:   '<h2>{{"label.newsList" | translate}}</h2>'+
                                '<div ng-repeat="news in newslist">'+
                                    '<table>'+
                                        '<tr><td>{{"label.title" | translate}}     </td><td>{{news.title}}                      </td></tr>'+
                                        '<tr><td>{{"label.brief" | translate}}     </td><td>{{news.brief}}                      </td></tr>'+
                                        '<tr><td>{{"label.date" | translate}}      </td><td>{{news.date | date:"dd/MM/yyyy"}}   </td></tr>'+
                                    '</table>'+
                                    '<a href="#viewnews/{{news.id}}">{{"label.viewNews" | translate}}</a>&nbsp&nbsp&nbsp'+
                                    '<a href="#editnews/{{news.id}}">{{"label.editNews" | translate}}</a>&nbsp&nbsp&nbsp'+
                                    '<input type="checkbox" ng-checked="checkedNews.indexOf(news.id) != -1" ng-click="toggleCheck(news.id)" >'+
                                    '<br><br>'+
                                '</div>'+
                                '<button ng-click="deletesigned()">{{"label.delete" | translate}}</button>',


                    controller: "newslist"
                })
                .when("/viewnews/:newsId", {
                    template:   '<h2>{{"label.viewNews" | translate}}</h2>'+
                                '<table>'+
                                    '<tr><td>{{"label.title" | translate}}     </td><td>{{news.title}}                      </td></tr>'+
                                    '<tr><td>{{"label.brief" | translate}}     </td><td>{{news.brief}}                      </td></tr>'+
                                    '<tr><td>{{"label.content" | translate}}   </td><td>{{news.content}}                    </td></tr>'+
                                    '<tr><td>{{"label.date" | translate}}      </td><td>{{news.date|date:"dd/MM/yyyy"}}     </td></tr>'+
                                '</table>'+
                                '<a href="#editnews/{{news.id}}">{{"label.editNews" | translate}}</a>&nbsp&nbsp&nbsp<a href="#deletenews/{{news.id}}">{{"label.deleteNews" | translate}}</a><br><br>',


                    controller: "viewnews"
                })
                .when("/editnews/:newsId", {
                    template:   '<h2>{{"label.editNews" | translate}}</h2>'+
                                '<h2>{{msg | translate}}</h2>'+
                                '<table>'+
                                    '<tr><td>{{"label.title" | translate}}      </td><td><input type="text" ng-model="news.title">                      </td><td>{{errorsMap["title"]}}    </td></tr>'+
                                    '<tr><td>{{"label.brief" | translate}}      </td><td><input type="text" ng-model="news.brief">                      </td><td>{{errorsMap["brief"]}}    </td></tr>'+
                                    '<tr><td>{{"label.content" | translate}}    </td><td><input type="text" ng-model="news.content">                    </td><td>{{errorsMap["content"]}}  </td></tr>'+
                                    '<tr><td>{{"label.date" | translate}}       </td><td><input type="text" ng-model="news.date" datetime="dd-MM-yyyy"> </td><td>{{errorsMap["date"]}}     </td></tr>'+
                                '</table>'+
                                '<button ng-click="save()">{{"label.save" | translate}}</button>',


                    controller: "editnews"
                })
                .when("/deletenews/:newsId", {
                    template:   '<h2>{{msg | translate}}</h2>',

                    controller: "deletenews"
                })
                .when("/addnews", {
                    template:   '<h2>{{"label.addNews" | translate}}</h2>'+
                                '<h2>{{msg | translate}}</h2>'+
                                '<table>'+
                                '<tr><td>{{"label.title" | translate}}     </td><td><input type="text" ng-model="news.title">                      </td><td>{{errorsMap["title"]}}     </td></tr>'+
                                '<tr><td>{{"label.brief" | translate}}     </td><td><input type="text" ng-model="news.brief">                      </td><td>{{errorsMap["brief"]}}     </td></tr>'+
                                '<tr><td>{{"label.content" | translate}}   </td><td><input type="text" ng-model="news.content">                    </td><td>{{errorsMap["content"]}}   </td></tr>'+
                                '<tr><td>{{"label.date" | translate}}      </td><td><input type="text" ng-model="news.date" datetime="dd-MM-yyyy"> </td><td>{{errorsMap["date"]}}      </td></tr>'+
                                '</table>'+
                                '<button ng-click="addandsave()">{{"label.save" | translate}}</button>',

                    controller: "addnews"
                })

        });



        app.controller('newsmanagement', function($scope) {

        });

        app.controller('newslist', function($scope, $http, $location) {
            $http.get('newslistpage').then(
                function (response) {
                    $scope.newslist = response.data;
                }
            );

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
        });

        app.controller('editnews', function($scope, $http, $routeParams) {
            var Json_newsId = angular.toJson($routeParams.newsId);
            $http.post('viewnews', Json_newsId).then(
                function (response) {
                    $scope.news = response.data;
                }
            );


            $scope.save = function() {
                var Json_news = angular.toJson($scope.news);
                $http.post('editnews',Json_news).then(
                    function (response) {
                        $scope.msg = "label.newsIsEdited";
                    },
                    function (errorResponse) {
                        $scope.status = errorResponse.status;
                        $scope.errorsMap = errorResponse.data;
                    });
            };
        });

        app.controller('deletenews', function($scope, $http, $routeParams) {
            var Json_newsId = angular.toJson($routeParams.newsId);
            $http.post('deletenews', Json_newsId);
            $scope.msg = "label.newsIsDeleted";
        });

        app.controller('addnews', function($scope, $http) {

            $scope.addandsave = function() {
                var Json_news = angular.toJson($scope.news);
                $http.post('addnews', Json_news).then(
                    function (response) {
                        $scope.msg = "label.newsIsAdded";
                    },
                    function (errorResponse) {
                        $scope.status = errorResponse.status;
                        $scope.errorsMap = errorResponse.data;
                    });
            };
        });


        app.controller("translateController" ,["$scope","$translate",function($scope,$translate){
            $scope.changeLanguage = function(lang){
                $translate.use(lang);
            }
        }]);

    </script>

</body>
</html>
