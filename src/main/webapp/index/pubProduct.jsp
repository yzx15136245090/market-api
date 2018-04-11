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
            <h3 class="clearfix"><span class="lf">发布商品</span> <a class="rt" href="javascript:;">我的商品</a></h3>
            <form action="${pageContext.request.contextPath}/release" enctype="multipart/form-data" method="post"  onsubmit="return Check()">
                <input id="userId" type="hidden" value="<%=userId %>" name="userId"/>
                <input id="token" type="hidden" value="<%=token %>"  name="token"/>
                <div class="clearfix">
                    <div class="lf fill">
                        <div class="form-group"><label>商品名称：</label><input type="text" id="goodsname" name="goodsname"/></div>
                        <div class="form-group"><label>一级分类：</label><select  id="type1" name="goodstype" class="fatherType">
                            <option value="0">选择分类</option>

                        </select></div>
                        <div class="form-group"><label>二级分类：</label><select name="goodschildtype"  id="type2">
                            <option value="0">选择分类</option>

                        </select></div>
                        <div class="form-group"><label>商品价格：</label><input type="text" id="price" name="price" onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)" onblur="this.v();"/></div>
                        <div class="form-group"><label>新旧程度：</label><select  id="old" name="old">
                            <option value="9">9成新</option>
                            <option value="7">7成新</option>
                            <option value="5">5成新</option>
                            <option value="3">3成新</option>
                        </select></div>
                        <div class="form-group"><label>保留时间：</label><select  name="indate" id="indate">
                            <option value="7">7天</option>
                            <option value="15">15天</option>
                            <option value="30">30天</option>
                            <option value="90">90天</option>
                        </select></div>
                        <div class="form-group"><label>是否议价：</label><select name="bargain" id="bargain">
                            <option value="0">接受议价</option>
                            <option value="1">不接受议价</option>
                        </select></div>
                    </div>
                    <div class="rt pInfo clearfix" >
                        <div class="form-group">
                            <label>商品描述：</label> <textarea  placeholder="关于商品的详细描述" id="des" name="description"  cols="30" rows="10"></textarea>
                        </div>
                        <div class="form-group"> <label>交易地点：</label> <textarea name="place"  placeholder="你接受的交易地点，例如某座城市，某个学校" cols="30" rows="10"></textarea></div>
                        <div class="form-group">
                            <label>上传图片：</label>
                            <div class="upPic" >
                                <ul class="clearfix">
                                    <li>
                                        <div id="preview1"></div>
                                        <input  id="st1" name="file1" onchange="previewImage(this,1)" type="file"/>
                                    </li>
                                    <li>
                                        <div id="preview2"></div>
                                        <input  id="st2" name="file2" onchange="previewImage(this,2)" type="file"/>
                                    </li>
                                    <li>
                                        <div id="preview3"></div>
                                        <input  id="st3" name="file3" onchange="previewImage(this,3)" type="file"/>
                                    </li>
                                    <li>
                                        <div id="preview4"></div>
                                        <input  id="st4" name="file4" onchange="previewImage(this,4)" type="file"/>
                                    </li>


                                </ul>
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
    $(function(){

        $.post("${pageContext.request.contextPath}/fatherType",{},function(data){
            $("#type1").html="";
            for(var i=0;i<data.length;i++){
                var option = $("<option value='"+data[i].typeid+"'>"+data[i].typename+"</option>")
                $("#type1").append(option);

            }
        });

        $(".fatherType").change(function(){

            $("#type2").html="";
            var typeid= $("#type1").val();
            $.post("${pageContext.request.contextPath}/childType",{typeid:typeid},function(data){
                $("#type2").html("");
                for(var i=0;i<data.length;i++){
                    var option = $("<option value='"+data[i].childtypeid+"'>"+data[i].childtypename+"</option>")
                    $("#type2").append(option);
                }
            });


        })


    });
    function Check(){
        var goodsname=$("#goodsname").val();
        var price=$("#price").val();
        var des=$("#des").val();
        var type=$("#type1").val();
        var st1=$("#st1").val();
        var st2=$("#st2").val();
        var st3=$("#st3").val();
        var st4=$("#st4").val();
        var userId=$("#userId").val();
        var token=$("#token").val();
        debugger;
        debugger;
        if(userId==""||token==null)
        {
            window.location="./login.jsp";
            return false;
        }
        if(goodsname==""||des==""||price==""||type==""||(st1==""&st2==""&st3==""&st4==""))
        {
            alert("请补充完整商品信息！");
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