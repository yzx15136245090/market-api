<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% String sourceUrl = application.getInitParameter("sourceURL");
    request.setAttribute("sourceUrl", sourceUrl);
%>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>注册页面</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/index/css/global.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/index/css/main.css"/>

    <jsp:include page="page.jsp"/>

    <script src="${pageContext.request.contextPath}/index/js/jquery.ajaxfileupload.js"></script>
    <script type="text/javascript">
         var flag=false;
        function checkRegisterUser() {
            if(flag==true){
            var userId = $("#uname").val();
            var pwd = $("#upwd").val();
            var repwd = $("#corfirmupwd").val();
            var dataJson={
                "userId": userId,
                "passWord": pwd
            };
            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/market/userRegister",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify(dataJson),
                dataType: "json",
                success: function (data) {
                    $('#userId_span').append("");
                    var statusMes=data.statusMes;
                    var statusCode=data.statusCode;
                    if(statusCode=='1'){
                          //自动登录后跳转到首页
                        $.ajax({
                            type: "POST",
                            url: "${pageContext.request.contextPath}/market/userLogin",
                            contentType: "application/json; charset=utf-8",
                            data: JSON.stringify(dataJson),
                            dataType: "json",
                            success: function (data) {
                                var statusMesL = data.statusMes;
                                var statusCodeL = data.statusCode;
                                if (statusCodeL == '1') {
                                    //自动登录后跳转到首页
                                    window.location.href="${pageContext.request.contextPath}/index/firstPage.jsp";
                                } else if (statusCodeL == '0') {

                                } else if (statusCodeL = '200') {

                                }

                            },
                            error: function (data) {

                            }
                        });

                    }else if(statusCode=='0'){
                        $('#userId_span').append(statusMes);
                    }else if(statusCode='200')
                    {
                        //alert(statusMes);
                    }

                },
                error: function (data) {

                }
            });
            }else{
                return;
            }
        }
        function  onblus(e){
            $('#passWord_span').html("");
            $('#userId_span').html("");
            $('#rePassWord_span').html("");
            var userId = $("#uname").val();
            var pwd = $("#upwd").val();
            var repwd = $("#corfirmupwd").val();
            var eid = e.id;
            userId=userId.replace(/[ ]/g,"");   //去掉所有空格
            var isPhone=/^((\+?86)|(\+86))?(13[012356789][0-9]{8}|15[012356789][0-9]{8}|18[02356789][0-9]{8}|147[0-9]{8}|1349[0-9]{7})$/; //手机
            var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;  //邮箱
            if(eid=='uname'){
                if(isPhone.test(userId)||regEmail.test(userId)){
                    flag=true;
                    return true;
                }else{
                    $('#userId_span').html('账号格式不正确!');
                    flag=false;
                    return false;
                }
           }else if(eid=='upwd'){
                if(pwd.length<8||pwd.length>16){
                    $('#passWord_span').html('密码的长度必须为8-16位!');
                    flag=false;
                }
                flag=true;
            } else if(eid=='corfirmupwd'){
                if(pwd!=repwd){
                $('#rePassWord_span').html("两次密码不一致！");
                    flag=false;
                }
                flag=true;
           }
           return flag;
        }


    </script>


</head>
<body style="background:#f4f8fb;">
<div class="head">
    <div id="headMain" class="clearfix">
        <a href="#" class="lf logo-title">
            <img src="images/logo.png" alt="LOGO"/>
            <h3 class="rt">注册用户</h3>
        </a>
    </div>
</div>
<div class="g-container zg-container">
    <div class="zm-rgtitle">
        <span>您现在的位置：<a href="firstPage.jsp">网站首页</a>&nbsp; > &nbsp;注册</span>
        <h3>账户注册</h3>
    </div>
    <div class="content-box1">
        <div class="zm-container">
            <form id="form-register">

                <div class="form-group1">
                    <label for="uname"><i></i>用户名：</label>
                    <input type="text" placeholder="手机号或邮箱账号" autofocus name="uname" id="uname" onblur="onblus(this)"/>
                    <span id="userId_span"></span>
                </div>

                <div class="form-group1">
                    <label for="upwd"><i></i>登录密码：</label>
                    <input type="password" placeholder="请输入密码" name="upwd" id="upwd" onblur="onblus(this)"/>
                    <span id="passWord_span"></span>
                </div>
                <div class="form-group1">
                    <label for="corfirmupwd"><i></i>确认密码：</label>
                    <input type="password" placeholder="再次输入登录密码" name="corfirmupwd" id="corfirmupwd" onblur="onblus(this)"/>
                    <span id="rePassWord_span"></span>

                </div>

                <div class="form-group1">
                    <input type="checkbox" id="ch"/>我已阅读并同意 <a href="">&lt;&lt;偶的驿站网站服务条款&gt;&gt;</a>
                </div>

                <a id="register-btn" class="register-btn"
                   style="height: 35px;width: 80px;display:block;position:absolute;left: 33%;  "
                   href="javascript:checkRegisterUser();"> 注册</a>

            </form>
        </div>
    </div>
</div>


</body>
</html>