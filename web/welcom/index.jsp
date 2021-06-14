<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<title>注册登录喔</title>
<link rel="stylesheet" href="css/style.css" />
    <script src="https://cdn.staticfile.org/angular.js/1.4.6/angular.min.js" ></script>

</head>

<body style="background-color: antiquewhite">
    <div id="zuiwaimiandeid" ng-app="myApp" ng-controller="yanzhengCont" class="content">
        <div class="form sign-in">
            <h2>欢迎回来</h2>
            <label>
                <span>邮箱</span>
                <input type="text"  ng-model="pathVar.emailName1">
            </label>
            <label>
                <span>密码</span>
                <input type="password" ng-model="pathVar.emailPassword1">
            </label>
            <p class="forgot-pass"><a href="javascript:">忘记密码？</a></p>
            <button type="button" class="submit" ng-click="isPresent(1)">登 录</button>
            <h3 style="color: red;text-align: center" ng-hide="myVar">{{showVar}}</h3>

        <%--            <button type="button" class="fb-btn">使用 <span>facebook</span> 帐号登录</button>--%>
        </div>
        <div class="sub-cont">
            <div class="img">
                <div class="img__text m--up">
                    <h2>还未注册？</h2>
                    <p>立即注册，发现大量机会！</p>
                </div>
                <div class="img__text m--in">
                    <h2>已有帐号？</h2>
                    <p>有帐号就登录吧，好久不见了！</p>
                </div>
                <div class="img__btn">
                    <span class="m--up">注 册</span>
                    <span class="m--in">登 录</span>
                </div>
            </div>
            <div class="form sign-up">
                <h2>立即注册</h2>
                <label>
                    <span>用户名</span>
                    <input type="text" ng-model="pathVar.userName0">
                </label>
                <label>
                    <span>邮箱</span>
                    <input type="text" ng-model="pathVar.emailName0">
                </label>
                <label>
                    <span>密码</span>
                    <input type="password" ng-model="pathVar.emailPassword0">
                </label>
                <button type="button" class="submit" ng-click="isPresent(0)">注 册</button>
                <h3 style="color: red;text-align: center" ng-hide="myVar">{{showVar}}</h3>

                <%--                <button type="button" class="fb-btn">使用 <span>facebook</span> 帐号注册</button>--%>
            </div>
        </div>
<%--        {{}}--%>
    </div>

    <script src="js/script.js"></script>

<script>
    var app = angular.module('myApp', []);
    app.controller('yanzhengCont',function ($scope,$http) {
        $scope.pathVar = {};
        $scope.pathVar.emailName1 = "";
        $scope.pathVar.emailPassword1 = "";

        $scope.pathVar.userName0 = "";
        $scope.pathVar.emailName0 = "";
        $scope.pathVar.emailPassword0 = "";

        $scope.myVar = true;
        $scope.showVar = " ";

        $scope.$watch('showVar',function () {

            window.setTimeout(function () {
                $scope.showVar="";
                    $scope.$applyAsync();
                    },
            2800);

        });

        $scope.isPresent = function (i) {

            if (i == 0){
                if ($scope.pathVar.userName0 == "" || $scope.pathVar.emailName0== "" || $scope.pathVar.emailPassword0== ""  ){
                    alert("选项不可为空");
                    return;
                }
                $scope.showVar = "正在注册。。。";
                $scope.$applyAsync();
                    // alert("注册");
                $http.post("../ajax/0.do",$scope.pathVar,{headers: {'Content-Type':'application/json;charset=utf-8'}})
                    .success(function (response) {
                        var status = response.status;
                        var desc = response.desc;
                        if (status == "succ"){
                            $scope.showVar = "注册成功！即将跳转登录页面";
                            $scope.myVar = false;
                            $scope.pathVar.emailName1 = $scope.pathVar.emailName0;
                            $scope.pathVar.emailPassword1 = "";
                            $scope.$applyAsync();

                            window.setTimeout(function(){
                                    document.getElementById("zuiwaimiandeid").setAttribute("class","content ng-scope"); },
                                3000);
                        }else {
                            $scope.showVar = desc;
                            $scope.myVar = false;
                            $scope.$applyAsync();
                        }

                    });

                // $scope.myVar = false;
            }
            else if (i == 1){
                if (  $scope.pathVar.emailName1== "" || $scope.pathVar.emailPassword1== ""  ){
                    alert("选项不可为空");
                    return;
                }
                $scope.showVar = "正在登录。。。";
                $scope.$applyAsync();
                // alert("登录");
                $http.post("../ajax/1.do",$scope.pathVar)
                    .success(function (response) {

                        var status = response.status;
                        var desc = response.desc;
                        if (status == "succ") {
                            $scope.showVar = "用户："+response.uname+" 登录成功！即将跳转主页面~";
                            $scope.myVar = false;
                            $scope.$applyAsync();
                            window.setTimeout(function () {
                                    window.location.href = "../main.jsp";
                                },
                                3000);
                        }else {
                            $scope.showVar = desc;
                            $scope.myVar = false;
                            $scope.$applyAsync();
                        }

                    });
            }else {alert("操作失败 ");}
        }
    })
</script>


</body></html>