<%@ page import="java.util.List" %>
<%@ page import="ssx.entity.UserSchema" %><%--
  Created by IntelliJ IDEA.
  User: Shenshuxin
  Date: 2021/6/14
  Time: 0:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <script src="https://cdn.staticfile.org/angular.js/1.6.3/angular.min.js"></script>
    <title>Title</title>
    <% String queAlll = (String)session.getAttribute("queAlll"); %>
    <style>
        table, th , td  {
            border: 1px solid grey;
            border-collapse: collapse;
            padding: 5px;
        }
        table tr:nth-child(odd)	{
            background-color: #f1f1f1;
        }
        table tr:nth-child(even) {
            background-color: #ffffff;
        }
    </style>
</head>
<body>
  <div ng-app="myApp2" ng-controller="con2">
      <table>
          <tr ng-repeat="i in cols">
              <td>{{ i.seq }}</td>
              <td>{{ i.message }}</td>
          </tr>
      </table>
  </div>

<script>
    var app2 = angular.module('myApp2',[]);
    app2.controller("con2",function ($scope) {
        $scope.cols =<%= queAlll %>  ;
    })
</script>

</body>
</html>
