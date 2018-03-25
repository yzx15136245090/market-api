
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>偶的驿站</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/index/css/detail.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/index/css/public.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/index/css/index.css"/>
 
</head>
<body>
    <!--头部-->
    <div id="top_box">
        <header>
            <!--登录注册-->
            <p><img src="${pageContext.request.contextPath}/index/pic/xunhuan.png" alt=""/>大学生二手交易平台</p>
            <ul>
                <li>
                    你好欢迎来到偶的驿站！
                </li>
                <li>
                    <a id="toLogin">
                        登录
                    </a> &nbsp;&nbsp;&nbsp;&nbsp;|
                </li>
                <li>
                    <a href="">
                        免费注册
                    </a>
                </li>
                <li>
                    <a href="">
                        帮助中心
                    </a>
                </li>
            </ul>
        </header>
    </div>
    <!--搜索和热门-->
    <div id="searchHot">
        <!--logo-->
       <div class="logo">
           <img src="${pageContext.request.contextPath}/index/pic/logo.png" alt="偶的驿站"/>
       </div>
        <!--搜索与热门-->
        <div class="searchHot">
            <div style="display: block;overflow: hidden">
                <p class="search">
                    <input type="search" placeholder="请输入你需要的商品"/>
                </p>
                <button>搜索</button>
            </div>

            <p class="hot">
                <a href="">自行车</a>|
                <a href="">电动车</a>|
                <a href="">笔记本</a>|
                <a href="">教材</a>
            </p>
        </div>
        <!--福利，订单，购物车-->
        <div class="shoppingCart">
            <ul>
                <li>
                    <i></i>
                    <p>用户中心</p>
                </li>
                <li>
                    <i></i>
                    <p>我的积分</p>
                </li>
                <li>
                    <i></i>
                    <p>购物车</p>
                </li>
            </ul>
        </div>
    </div>
    <!--商品分类-->
    <!--<div id="goodsClassify">-->
        <!--<ul>-->
            <!--<li class="curr"><a href="">所有商品分类 <i>  》</i></a></li>-->
            <!--<li><a href="">首页</a></li>-->
            <!--<li><a href="">商品发布</a></li>-->
            <!--<li><a href="">求购专区</a></li>-->
            <!--<li><a href="">紧急销售</a></li>-->
            <!--<li><a href="">最新发布</a></li>-->
            <!--<li><a href="">发布求购</a></li>-->
            <!--<li><a href="">其他</a></li>-->
        <!--</ul>-->
    <!--</div>-->
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
    <!--主体部分-->
    <section id="main" class="goodsdetail">
 <p class="category"><b> ${goods.goodsname } </b>   <span>商品详情</span></p>
        <!--商品-->
        <div class="detail">
            <div class="detailPic">
            
                <h3>
                   <div id="maxImgs"> <img id="mImg" src="${goods.requesturl}${goods.pictureurl}" alt=""/> </div>
                    <div id="mask"></div>
                    <div id="superMask"></div>
                </h3>
                <div id="largeDiv"></div>
                <ul id="icon_list">
                    <li class="curr">
                        <img src="${goods.requesturl}${goods.pictureurl}"  alt=""/>
                    </li>
                    <li>
                        <img src="${goods.requesturl}${goods.picurl1}" alt=""/>
                    </li>
                    <li>
                        <img src="${goods.requesturl}${goods.picurl2}" alt=""/>
                    </li>
                    <li>
                        <img src="${goods.requesturl}${goods.picurl3}" alt=""/>
                    </li>
                </ul>
            </div>
            <div class="detailDesc">
                <div class="title">${goods.goodsname} <span class="author"></span></div>
                <p class="owner">商品持有人： ${goods.username}</p>
                <div class="price">
                    <p><label>交易价：</label><span>¥${goods.price}</span> <a href="#"><i></i>举报该商品</a></p>
                </div>
                <p class="desc">
                    [ <span>商品介绍</span>] ${goods.description}
                
                </p>
                 <p >
                		    交 易 地 点:       ${goods.place}
                
                </p>
                <p class="send"> 新 旧 程 度:       ${goods.old } 成 新<span></span></p>
                <p class="serve">服    务：确认购买后，请与卖家商量具体交易信息。</p>
                <ul>
                    <li class="add_cart" onclick="addShopCat('${goods.goodsid}')"><i></i>加入购物车</li>
                    <li class="addCollect"><i></i>收藏</li>
                    <li onlick="collectgoods()"><i class="chat"></i>在线聊天</li>
                    <li onlick="collectgoods()">确认购买</li>
                </ul>
                <p class="prompt">温馨提示：一手交钱一手交货，支持支付宝、微信转账！</p>
            </div>
            <div class="clear"></div>
        </div>
    </section>
    <!--尾部-->
    <footer>
        <ul>
            <li>
                <a href="#">
                    <i></i>
                    双方学生认证
                </a>
            </li>
            <li>
                <a href="#">
                    <i class="chat"></i>
                    在线聊天确定交易
                </a>
            </li>
            <li>
                <a href="#">
                    <i></i>
                    面对面进行交易
                </a>
            </li>
            <li>
                <a href="#">
                    <i></i>
                    运行方式更安全
                </a>
            </li>
        </ul>
        <p>书籍资料 运动专区 电子产品 鞋包配饰 校园代步 生活娱乐 租赁物品 家居用品 其他商品 <br/>版权所有：偶的驿站   技术支持：RB软工移131、132班</p>
    </footer>
    <script src="${pageContext.request.contextPath}/index/js/jquery-1.11.3.js"></script>
 	<script src="${pageContext.request.contextPath}/index/js/main.js"></script>
    <script src="${pageContext.request.contextPath}/index/js/public.js"></script>
    <script src="${pageContext.request.contextPath}/index/js/detail.js"></script>
<script type="text/javascript">	
$(".addCollect").click(function(){
var t="${goods.goodsid}";
$.post("/old/manager/islogin",{},function(data){

		if(data==1){
			alert("请先登录！");
			document.getElementById("toLogin").click();
		return "no";
			
		}
			else{
				 $.post("${pageContext.request.contextPath}/collectGoods",{goodsid:t},
				   function(data){
				   if(data=="0"){
				   $(".addCollect").html("<i></i>已收藏")
				   }
				   
				   });

			}

		})


})
</script>
</body>

</html>