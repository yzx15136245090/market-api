<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
	<link href="${pageContext.request.contextPath}/index/css/chat.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/index/js/jquery-1.9.1.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/index/js/jquery.nicescroll.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/index/js/media.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/index/js/main.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/index/js/chat.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/index/js/app.js"></script>
	<script>
		//解决IE8不支持trim()
		String.prototype.trim = function (){  
		    return this.replace(/(^\s*)|(\s*$)/g, "");  
		}
	</script>
	

</head>
<body>
	<h2><a id="user"></a></h2>
	<div class="mwd">
		<div class="pageTop">
			<div class="title"></div>
			<div class="toolbar">
				<a class="min" title="最小化"></a>
				<a class="max" title="最大化"></a>
				<a class="close" title="关闭"></a>
			</div>
			<div class="func">
				<a class="chat click" id="talkname">${goods.username}</a>
			</div>
		</div>
		<div class="mode-text">
			<div class="pageLeft">
				<div class="content" id="console" MyScroll></div>
				<div class="edit">
					<div class="editTool" title="编辑工具栏敬请期待！"></div>
					<textarea class="mainedit" MyScroll></textarea>
					<div class="buttons">
						<span id="submit" class="button" title="按Enter键发送消息，按Ctrl+Enter键换行">发送</span>
						<span class="button close">关闭</span>
						<span class="info"></span>
					</div>
				</div>
			</div>
			<div class="pageRight"></div>
		</div>
		<div class="mode-video" style="display: none;">
			<div class="pageLeft">
				<div class="videocontent" id="videocontent" MyScroll></div>
				<div class="myView">
					<video  width="160" height="90" id="myVideo" poster="/ws/pic/websocket/videopost.png">
						您的浏览器不支持 video 标签。
					</video>
				</div>
			</div>
			<div class="pageRight">
				<div class="content" id="console" MyScroll></div>
				<div class="edit">
					<div class="editTool" title="编辑工具栏敬请期待！"></div>
					<textarea class="mainedit" MyScroll></textarea>
					<div class="buttons">
						<span id="submit" class="button" title="按Enter键发送消息，按Ctrl+Enter键换行">发送</span>
						<span class="button close">关闭</span>
						<span class="info"></span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="audiocontent" id="audiocontent">
		<audio id="mySound">
			您的浏览器不支持 audio 标签。
		</audio>
	</div>
	<div id="min-max" style="display: none;">
		<a class="back" title="最小化"></a>
		<a class="max" title="最大化"></a>
		<a class="close" title="关闭"></a>
	</div>

	<input type="hidden" id="username" value="${sessionScope.user.username}">
	<input type="hidden" id="userid" value="${sessionScope.user.userid}">
	<script>
	
	$(function(){
		
			var userid=${goods.userid};
			var te=$(".mainedit").val();
		 $.post("${pageContext.request.contextPath}/readmessage",{uerid2:$("#userid").val()},
				   function(data){
			 var message=data.replymessage;
			 alert(message);
			 alert(data.message);
			var console =$("#console");
			obj = '<div class="row"><span class="headpic" title="' + "name" + '"></span><i></i><div class="dest"><p></p><br><p class="time">' + new Date().toLocaleString() + '</p></div>';
			obj = $(obj);
			obj.find("p").eq(0).html(message);
			obj.fadeIn('slow').appendTo(console);
		 })
	})
	$("#submit").click(function(){
		var userid=${goods.userid};
		var te=$(".mainedit").val();
		 $.post("${pageContext.request.contextPath}/savemessage",{userid1:$("#userid").val(),userid2:userid,message:te},
				   function(){
		  })
		var console =$("#console");
		obj = '<div class="row"><span class="headpic src" title="' + $("#username").val() + '"></span><i class="src"></i><div class="src"><p></p><br><p class="time">' + new Date().toLocaleString() + '</p></div>';
			obj = $(obj);
			obj.find("p").eq(0).html(te);
			obj.fadeIn('slow').appendTo(console);
			$(".mainedit").val("");
			
	});
	</script>
</body>