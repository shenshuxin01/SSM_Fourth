<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!--<!DOCTYPE html>-->
<html lang="zh">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>css剪裁GIF背景图片动画特效|DEMO_jQuery之家-自由分享jQuery、html5、css3的插件库</title>
	<link rel="stylesheet" type="text/css" href="css/normalize.css" /><!--CSS RESET-->
	<link rel="stylesheet" type="text/css" href="css/htmleaf-demo.css"><!--演示页面样式，使用时可以不引用-->
<%--	<link href="https://fonts.googleapis.com/css?family=Lato:900|Rye&display=swap" rel="stylesheet">--%>
	<style>
		.wrapper{
		  background: #252854;
		  width: 100%;
		  height:500px;
		  border-radius: 5px;
		  position: relative;  
		}
		.text{
		  flex: 0 0 100%;
		  font-size: 14rem;
		  font-weight: 900;
		  color: #00000000;
		  text-align: center;
		  font-family: 'Lato', sans-serif;
		  position: absolute;
		  left: 50%;
		  top: 50%;
		  transform: translate(-50%, -50%);
		  border-bottom: 1px solid #d4d7ff;
		  border-top: 1px solid #d4d7ff;
		  background: url(./img/source.gif);
		  background-clip: text;
		  -webkit-background-clip: text;
		}
		  
		 .text:after{
		   content: attr(data-text);
		   -webkit-text-stroke: 1.5px #d4d7ff;
		   position: absolute;
		   left: 50%;
		   top: 50%;
		   transform: translate(-50%, -49%);
		   background: url(./img/source.gif);
		   background-clip: text;
		   -webkit-background-clip: text;
		   background-size: 43%;

		}
	</style>
</head>
<body>
<%
	String name1 = request.getParameter("name1");
	session.setAttribute("wantName",name1);
%>
	<div class="htmleaf-container">
		<header class="htmleaf-header">
			<h1>css剪裁GIF背景图片动画特效 <span> </span></h1>
			<div class="htmleaf-links">
				<a class="htmleaf-icon icon-htmleaf-home-outline" href="./main.jsp" title="返回主页" target="_blank"><span> 返回主页</span></a>
				
				<a class="htmleaf-icon icon-htmleaf-arrow-forward-outline" href="./welcom/index.jsp" title="注销登录" target="_blank"><span> 注销登录</span></a>
			</div>
		</header>
		<div class= "wrapper">
		  <div class= "text" data-text= ${wantName}>2021</div>
		</div>
	</div>
</body>
</html>