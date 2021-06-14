<%@ page import="java.util.Enumeration" %><%--
  Created by IntelliJ IDEA.
  User: Shenshuxin
  Date: 2021/6/12
  Time: 21:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<% String loginUserEmail = (String) session.getAttribute("loginUserEmail");
    if (loginUserEmail==null || "".equals(loginUserEmail)){
        session.setAttribute("loginUserEmail","");
    }
%>
<html>
<head>
    <title>Title</title>
    <script src="https://cdn.staticfile.org/angular.js/1.4.6/angular.min.js" ></script>
</head>
<body>
主页面<br>
<hr>欢迎用户：
${loginUserName}
<%--<% String userJavaId = (String)session.getAttribute("loginUserEmail"); %>--%>
<hr>
输入要展示的字体：<input type="text" id="id1" name="name1"  ><br>
<button  onclick="x();"> 开始 </button>
<br>
<hr>
<div ng-app="beiMod" ng-controller="beiCon" >
记事本备忘录功能<br>
输入备忘录内容：<br>
    <textarea id="textareaid" ng-model="pg.message" cols="40" rows="10">
    </textarea>


    <br>
<button ng-click="subBeiwanglu();">提交数据</button>
<button ng-click="queBeiwanglu();">查询所有已提交的备忘录</button>
    <h3 style="color: red;text-align: left" ng-hide="pg.nghideVar">
        {{pg.showVar}}
    </h3>
</div>

<script>
    var bei = angular.module("beiMod",[]);
    bei.controller('beiCon',function ($scope,$http){
        $scope.pg={};
        $scope.pg.message = "";
        $scope.pg.nghideVar = true;
        $scope.pg.showVar = "";
        $scope.pg.userId = "${loginUserEmail}";
        // alert($scope.pg.userId)

        //监听变量
        $scope.$watch('pg.showVar',function () {

            window.setTimeout(function () {
                    $scope.pg.showVar ="";
                    $scope.$applyAsync();
                },
                2800);

        });

        $scope.subBeiwanglu = function () {
            if ($scope.pg.message.trim() == "" || $scope.pg.message.trim() == null){
                $scope.pg.showVar = "记事本备忘录内容为空！不能上传！";
                $scope.pg.nghideVar = false;
                $scope.$applyAsync();
                return;
            }else {
                if ($scope.pg.userId =="" || $scope.pg.userId==null){
                    $scope.pg.showVar = "为获取到用户信息！";
                    $scope.pg.nghideVar = false;
                    $scope.$applyAsync();
                    return;
                }
                $http.post("bei/abcdefg.do",$scope.pg,null).success(function (resp) {
                    var status = resp.status;
                    if (status=="" || status==null){
                        $scope.pg.showVar = "前台数据获取失败！服务器错误！";
                        $scope.pg.nghideVar = false;
                        $scope.$applyAsync();
                    }else {
                        if (status=="succ"){
                            $scope.pg.showVar = "数据提交成功！";
                            $scope.pg.nghideVar = false;
                            $scope.$applyAsync();
                        }else if (status=="fail") {
                            $scope.pg.showVar = "数据提交失败！";
                            $scope.pg.nghideVar = false;
                            $scope.$applyAsync();
                        }
                    }

                });
            }

        };

        $scope.queBeiwanglu = function () {
            var uid = $scope.pg.userId;
            if (uid==null || uid==""){
                $scope.pg.showVar = "获取用户邮箱失败！";
                $scope.pg.nghideVar = false;
                $scope.$applyAsync();
                return;
            }else {
                $http.post("bei/queAll.do",$scope.pg,null).success(function (resp) {
                    var status = resp.status;
                    if (status=="" || status==null){
                        $scope.pg.showVar = "前台数据获取失败！服务器错误！";
                        $scope.pg.nghideVar = false;
                        $scope.$applyAsync();
                    }else {
                        if (status=="succ"){
                            window.location.href = "./beiwang.jsp";
                        }else if (status=="fail") {
                            $scope.pg.showVar = "数据提交失败！";
                            $scope.pg.nghideVar = false;
                            $scope.$applyAsync();
                        }
                    }

                });
            }
        }

    });
</script>


<script>
    function x() {
        var showText = document.getElementById("id1").value;
        var href = "./jsdongtai.jsp?name1="+showText;
        // alert(href);
        window.location.href= href;
    }
    function y() {

    }
</script>
</body>
</html>
