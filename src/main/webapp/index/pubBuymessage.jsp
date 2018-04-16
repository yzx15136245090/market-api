<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%
    String userId=new String();
    String token=new String();
    if(request.getSession().getAttribute("userMap")!=null)
    {Map user= (Map) request.getSession().getAttribute("userMap"); //获取你的对象里面涵盖的内容
        userId = (String) user.get("userId");
        token = (String) user.get("token");}
    else {
        userId="";
        token="";
    }
%>
<html>
<head lang="en">
  
    <title>发布商品</title>
    <link rel="stylesheet" href="css/global.css"/>
    <link rel="stylesheet" href="css/main.css"/>
</head>
<body style=" background: #f4f8fb;">
<div id="top-bar">
    <div id="head_top" class="clearfix">
        <span class="lf">大学生二手交易平台</span>
        <ul class="rt">
            <li><span id="welcome">您好！欢迎来到Old的驿站</span></li>
            <li><a id="toLogin">登录</a><i></i>|</li>
            <li><a id="toRegister">免费注册</a></li>
            <li><a href="">帮助中心</a></li>
        </ul>
    </div>
</div>
<div id="head_main">
    <div id="headMain_content" class="clearfix">
        <a href="${pageContext.request.contextPath}/index.jsp" class="lf">
            <img src="images/logo.png" alt="LOGO" />
        </a>
        <div id="search_box" class="lf">
            <div class="search">
                <input id="txtSearch" type="text" class="text" placeholder="请输入您需要的商品"/><input class="search_button" name="" type="button" value="搜索" />
            </div>
            <div class="hot_words">
                <a href="#">自行车</a>|
                <a href="#">电动车</a>|
                <a href="#">笔记本</a>|
                <a href="#">教材</a>
            </div>
        </div>
        <div id="buy"class="rt">
            <a href="" class="user">用户中心</a>
            <a href="" class="my-grade">我的积分</a>
            <a href="" class="cart">购物车</a>
            <i></i>
        </div>
    </div>
</div>
<div id="main_nav">
    <div id="nav" class="clearfix">
        <div class="pructNav">
            <a href="javascript:;">所有商品分类</a>
            <ul class="pull-menu">
                <li><a id="1" href="#" onclick="javascript:typesearch('1');">书籍资料</a></li>
                <li><a id="2" href="#" onclick="javascript:typesearch('2');">电子产品</a></li>
                <li><a id="3" href="#" onclick="javascript:typesearch('3');">家居用品</a></li>
                <li><a id="4" href="#" onclick="javascript:typesearch('4');">运动专区</a></li>
                <li><a id="5" href="#" onclick="javascript:typesearch('5');">校园代步</a></li>
                <li><a id="6" href="#" onclick="javascript:typesearch('6');">生活娱乐</a></li>
                <li><a id="7" href="#" onclick="javascript:typesearch('7');">鞋包配饰</a></li>
                <li><a id="8" href="#" onclick="javascript:typesearch('8');">租赁物品</a></li>
                <li><a id="9" href="#" onclick="javascript:typesearch('9');">其他商品</a></li>s
            </ul>
        </div>
        <ul class="lf">
           <li class="u-deepBlue"><a href="${pageContext.request.contextPath}/index.jsp">首页</a></li>
            <li><a onclick="islogin()" id="toPubGoods" href="${pageContext.request.contextPath}/index/pubProduct.jsp">商品发布</a></li>
            <li><a  href="${pageContext.request.contextPath}/index/Buymessage.jsp">求购专区</a></li>
            <li><a href="">紧急销售</a></li>
            <li><a href="">最新发布</a></li>
            <li><a onclick="islogin()" href="${pageContext.request.contextPath}/index/pubBuymessage.jsp">发布求购</a></li>
            <li><a href="">其他</a></li>
        </ul>
    </div>

</div>
<div class="g-container fg-container">

    <div class="fm-container clearfix">
        <div class="myApp lf">
            <ul>
                <li class="title">我的账户</li>
                <li class="curr"><a href="#accountInfo">账户信息</a></li>
                <li><a href="#stuCertification">学生认证</a></li>
                <li><a href="#changePwd">修改密码</a></li>
                <li class="title">我的商品</li>
                <li><a href="#myShoppingCart">我的购物车</a></li>
                <li><a href="#myOrder">我的订单</a></li>
                <li><a href="#myCollection">我的收藏</a></li>
                <li><a href="#shelfGoods">下架商品</a></li>
                <li class="title">商品管理</li>
                <li><a href="#myRelease">我的发布</a></li>
                <li><a href="#personalData">我的求购</a></li>
                <li class="title">其他</li>
                <li><a href="#commodityRule">商品规则</a></li>
                <li><a href="#IntegralRule">积分规则</a></li>
            </ul>
        </div>
        <div class="lf fmc-box">
            <h3 class="clearfix"><span class="lf">发布求购</span> <a class="rt" href="javascript:;">我的商品</a></h3>
            <form action="${pageContext.request.contextPath}/releaseBuymessage" enctype="multipart/form-data" method="post"  onsubmit="return Check()">
                <input id="userId" type="hidden" value="<%=userId %>" name="userId"/>
                <input id="token" type="hidden" value="<%=token %>"  name="token"/>
                <div class="clearfix">
                    <div class="lf fill  lf-pubBuymessage">
                        <div class="form-group"><label>求购商品：</label><input type="text" id="buygoodsname" name="buygoodsname"/></div>
                        
                        
                        <div class="form-group"><label>期望价格：</label><input type="text" onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)" onblur="this.v();" id="wantprice" name="wantprice"/></div>
                 
                        <div class="form-group"><label>求购期限：</label><select  name="buyindate" id="buyindate">
			  <option value="7">7天</option>
			  <option value="15">15天</option>
			 <option value="30">30天</option>
			 <option value="90">90天</option>
			  </select></div>
			    <div class="lf pInfo clearfix" >
                        <div class="form-group pubBuymessage">
                            <label>求购描述：</label> <textarea id="des_pubBuymessage" placeholder="关于求购商品的详细描述"  name="buygoodsdescrip"  cols="30" rows="10"></textarea>
                        </div>
                        <div class="form-group  pubBuymessage">
                         <label>交易地点：</label> <textarea id="place_pubBuymessage"   name="wantsite"  placeholder="你接受的交易地点，例如某座城市，某个学校" cols="30" rows="10"></textarea>
                         </div>
                          </div>
                    </div>
                    
                    </div>
                
              
                <div class="pubBtn"><input type="submit" id="pub" value="确认发布"></div>
             
            </form>
        </div>
    </div>
</div>
<div id="bottomNav">
    <ul>
        <a href=""><span>双方学生认证</span></a>
        <a href=""><span>在线聊天确认交易</span></a>
        <a href=""><span>面对面进行交易</span></a>
        <a href=""><span>运行方式更安全</span></a>
    </ul>
</div>
<footer>
<span>
    <a href="">书籍资料</a>
    <a href="">运动专区</a>
    <a href="">电子产品</a>
    <a href="">鞋包配饰</a>
    <a href="">校园代步</a>
    <a href="">生活娱乐</a>
    <a href="">租赁物品</a>
    <a href="">家居用品</a>
    <a href="">其它商品</a>
</span>
    <span>
        <a href="">版权所有：偶的驿站</a>
        <a href="">技术支持：RB软工移131、132班</a>
    </span>
</footer>
<script src="js/jquery-1.11.3.js"></script>
<script src="js/main.js"></script>
<script type="text/javascript">
 function Check(){
	
	
	var buygoodsname=$("#buygoodsname").val();
    var wantprice=$("#wantprice").val();
    var place=$("#place_pubBuymessage").val();
	var des=$("#des_pubBuymessage").val();
              if(buygoodsname==""||des==""||wantprice==""||place=="")
               {
                alert("请补充求购信息！");
                return false;
              }
 
            else{

            
              alert("发布成功!");
            
          
                 return true;
             }
}
		

	

</script>
</body>
</html>