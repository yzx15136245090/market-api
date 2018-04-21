<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head lang="en">
    <title>old的驿站</title>
  
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/index/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/index/css/global.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/index/css/main.css"/>
	
</head>
<body style=" background: #f4f8fb;">
<div id="top-bar">
    <div id="head_top" class="clearfix">
        <span class="lf">大学生二手交易平台</span>
        <ul class="rt">
            <li><span id="welcome">您好！欢迎来到偶得驿站</span></li>
            <li><a id="toLogin">登录</a><a id="noUser" style="display:none">退出</a><i></i>|</li>
            <li><a id="toRegister" >免费注册</a></li>
            <li><a href="">帮助中心</a></li>
        </ul>
    </div>
</div>
<div id="head_main">
    <div id="headMain_content" class="clearfix">
        <a id="goHomePage" href="${pageContext.request.contextPath}/index.jsp" class="lf">
            <img src="${pageContext.request.contextPath}/index/images/logo.png" alt="LOGO" />
        </a>
        <div id="search_box" class="lf">
            <div class="search">
                <input id="txtSearch" type="text" class="text" placeholder="请输入您需要的商品"/><input class="search_button" name="" onclick="searchGoods()" type="button" value="搜索" />
            </div>
            <div class="hot_words">
                <a href="#">自行车</a>|
                <a href="#">电动车</a>|
                <a href="#">笔记本</a>|
                <a href="#">教材</a>
            </div>
        </div>
        <div id="buy"class="rt">
            <a onclick="islogin()" href="${pageContext.request.contextPath}/index/userCenter.jsp" class="user">用户中心</a>
            <a onclick="islogin()" href="" class="my-grade">我的消息</a>
            <a onclick="islogin()" 
            href="" class="cart">购物车</a>
            <i></i>
        </div>
    </div>
</div>
<div id="main_nav">
    <div id="nav" class="clearfix">
        <div class="pructNav">
            <a href="javascript:;">所有商品分类</a>
            <ul class="pull-menu" style="display:block;">
                <li><a id="1" href="#" onclick="javascript:typesearch('1');">书籍资料</a></li>
                <li><a id="2" href="#" onclick="javascript:typesearch('2');">电子产品</a></li>
                <li><a id="3" href="#" onclick="javascript:typesearch('3');">家居用品</a></li>
                <li><a id="4" href="#" onclick="javascript:typesearch('4');">运动专区</a></li>
                <li><a id="5" href="#" onclick="javascript:typesearch('5');">校园代步</a></li>
                <li><a id="6" href="#" onclick="javascript:typesearch('6');">生活娱乐</a></li>
                <li><a id="7" href="#" onclick="javascript:typesearch('7');">鞋包配饰</a></li>
                <li><a id="8" href="#" onclick="javascript:typesearch('8');">租赁物品</a></li>
                <li><a id="9" href="#" onclick="javascript:typesearch('9');">其他商品</a></li>
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
<div id="slider">
    <ul id="imgs">
  
    </ul>
    <ul id="indexs">
    </ul>
</div>
<div id="hot_recommended">
    <span class="lf">热门推荐 Hot recommend</span>
    <a href="#"class="rt">更多商品></a>
</div>
<div id="product_show">
    <ul id="box">
  
    </ul>
    

 

</div>
    <%--分页 --%>
 <div id="example" style="text-align: center"> <ul id="pageLimit"></ul> </div>
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
        <a href="">版权所有：偶的驿站</a>
        <a href="">技术支持：RB软工移131、132班</a>
    </span>
</footer>

</body>
<script src="${pageContext.request.contextPath}/index/js/jquery-1.11.3.js"></script>
<script src="${pageContext.request.contextPath}/index/js/main.js"></script>
<script src="${pageContext.request.contextPath}/index/js/public.js"></script>
<script src="${pageContext.request.contextPath}/index/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/index/js/bootstrap-paginator.min.js"></script>
<script type="text/javascript">			
		$(function(){
			var loading="";
		var startPageTemp=$("#startPageTemp").val();
		$("#box").empty().append(loading);
		//copy 复制一份 post ajax 形式
		   $.post("${pageContext.request.contextPath}/getGoodsPage",{startPage:0,pageSize:20,status:0},
				   function(data){
		       var dataList=data.data;

               var li=	"<li  class='goods'>"+
                           "<img onclick='goodsdetail('${goods.goodsid}')\"' src='' alt='商品图片' id='img_good'/>"+
                           "<b>￥50</b>"+
                           "<span>name</span>"+
                           "<span class='belong-somebody'>商品持有人：username</span>"+
                       " <a  onclick=price class='connect'>联系卖家</a><a class='b_cart'' onclick='addShopCat('${goods.goodsid}')'>加入购物车</a></li>";
			     $("#box").empty().append(li);

				var options = { 
						bootstrapMajorVersion:3, //版本
                      currentPage:startPageTemp, //当前页数
                      totalPages:$("#totalPages").val(), //总页数
                      size:"small",//设置控件的显示大小，是个字符串. 允许的值: mini, small, normal,large。值：mini版的、小号的、正常的、大号的。
                      numberOfPages:5, //总页数,//设置分页每次显示的页数
                      shouldShowPage:true, // 该参数用于设置某个操作按钮是否显示
                      itemTexts: function (type, page, current) {
                          switch (type) {
                              case "first":
                                  return "首页";
                              case "prev":
                                  return "上一页";
                              case "next":
                                  return "下一页";
                              case "last":
                                  return "末页";
                              case "page":
                                  return page;
                          }
                      },//点击事件，用于通过Ajax来刷新整个list列表
                      onPageClicked: function (event, originalEvent, type, page){
                       $("#box").empty().append(loading);
                         startPageTemp=page;
                         $.post("${pageContext.request.contextPath}/allGoods0",{startPage:page-1,pageSize:20},
                        function(data){
                         	 $("#box").empty().append(data);
                          
                       });
                      }
                  };
				
				  $('#pageLimit').bootstrapPaginator(options);
				
			 });
		
		});

</script>
</html>
