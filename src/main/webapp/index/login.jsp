<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="zh_CN">
<head>


    <link rel="stylesheet" href="${pageContext.request.contextPath}/index/css/global.css "/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/index/css/main.css"/>

    <title></title>
    <jsp:include page="page.jsp"/>


    <!--  $(function(){
              alert("ass");
          })-->


</head>
<body style="overflow: hidden;">
<div class="model-tips">
    <div class="tips">
        <h3>提示</h3>
        <p>用户名不能为空!</p>
        <span class="sure-btn">确定</span>
    </div>
</div>
<div class="g-container dg-container" style="top:-150px;">
    <form class="dm-container" id="dm-container">
        <div class="logo">
            <img src="images/logo.png" alt=""/>
        </div>
        <h3>高校学生旧物交易网站</h3>
        <div class="login-form">
            <div class="form-group m-bottom-md">

                <input type="text" id="uname" name="uname" placeholder="用户名：" onblur="onblus()"/>

            </div>

            <div class="form-group m-bottom-md">
                <input type="password" id="password" name="upwd" placeholder="密码："/>

            </div>
        </div>
        <div class="dm-newresiter">
            <span style="color: red;align:left; margin-right: 80px" id="tishi_span"></span>
            <a href="register.jsp" class="register">新用户注册</a>&nbsp;&nbsp;
            <a href="forgetpassward.jsp">忘记密码？</a>
        </div>


        <a class="loginbtn" id="loginbtn" href="javascript:checkUser();">登录</a>

        <hr/>
        <div class="d-bottom">
            <a href="#" class="lf">客服热线：0371-01020300</a>
            <a href="#" class="rt">公司官网：www.oudeyizhan.com</a>
        </div>
    </form>

</div>
<a href="javascript:void(0);" id="scroll-to-top" class="hidden-print"><i
        class="icon-chevron-up"></i></a>


</body>
<script src="${pageContext.request.contextPath}/index/js/jquery.ajaxfileupload.js"></script>
<script src="${pageContext.request.contextPath}/index/js/jquery-1.11.3.js"></script>
<script src="${pageContext.request.contextPath}/index/js/jquery.validate.min.js"></script>

</html>
<script type="text/javascript">
    function onblus() {
        $('#tishi_span').html("");
        var userId = $('#uname').val();
        var isPhone = /^((\+?86)|(\+86))?(13[012356789][0-9]{8}|15[012356789][0-9]{8}|18[02356789][0-9]{8}|147[0-9]{8}|1349[0-9]{7})$/; //手机
        var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;  //邮箱
        if (isPhone.test(userId) || regEmail.test(userId)) {
            return true;
        } else {
            $('#tishi_span').html("账号格式不正确！");
            return false;
        }
    }

    function checkUser() {
        var flag=onblus();
        if(flag==true){
        var userId = $('#uname').val();
        var passWord = $('#password').val();
        var dataJson = {
            "userId": userId,
            "passWord": passWord
        };

        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/market/userLogin",
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify(dataJson),
            dataType: "json",
            success: function (data) {
                var statusMes = data.statusMes;
                var statusCode = data.statusCode;
                if (statusCode == '1') {
                    //自动登录后跳转到首页
                    window.location.href="${pageContext.request.contextPath}/index/firstPage.jsp";
                } else if (statusCode == '0') {
                    $('#tishi_span').html(statusMes);
                } else if (statusCode = '200') {

                }

            },
            error: function (data) {

            }
        });
        }else {
            return;
        }
    }
</script>