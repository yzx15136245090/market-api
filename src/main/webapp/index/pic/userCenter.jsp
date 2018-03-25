<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%  String  sourceUrl=application.getInitParameter("sourceURL");
  request.setAttribute("sourceUrl", sourceUrl);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head lang="en">
  <meta charset="UTF-8">
  <title>偶的驿站：用户中心</title>
  <link rel="stylesheet" href="../css/public.css"/>
  <link rel="stylesheet" href="../css/userCenter.css"/>
  <link rel="stylesheet" href="../css/index.css"/>
  <jsp:include page="page.jsp" />

</head>
<body>
  <!--头部-->
  <div id="top_box">
    <header>
      <!--登录注册-->
      <p><img src="../img/xunhuan.png" alt=""/>大学生二手交易平台</p>
      <ul>
        <li>
          你好,用户名欢迎来到偶的驿站！
        </li>
        <li>
          <a href="">
            我的驿站
          </a> &nbsp;&nbsp;&nbsp;&nbsp;|
        </li>
        <li>
          <a href="">
            帮助中心
          </a>&nbsp;&nbsp;&nbsp;&nbsp;|
        </li>
        <li>
          <a href="">
            退出
          </a>
        </li>
      </ul>
    </header>
  </div>
  <!--搜索和热门-->
  <div id="searchHot">
    <!--logo-->
    <div class="logo">
      <img src="../img/logo.png" alt="偶的驿站"/>
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
  <div id="main_nav">
    <div id="nav" class="clearfix">
      <div class="pructNav">
        <a href="javascript:;">所有商品分类</a>
        <ul class="pull-menu">
          <li><a href="">书籍资料</a></li>
          <li><a href="">电子产品</a></li>
          <li><a href="">家居用品</a></li>
          <li class="subnav-click"><a href="">运动专区</a></li>
          <li><a href="">校园代步</a></li>
          <li><a href="">生活娱乐</a></li>
          <li><a href="">鞋包配饰</a></li>
          <li><a href="">租赁物品</a></li>
          <li><a href="">其他商品</a></li>
        </ul>
      </div>
      <ul class="lf">
        <li class="u-deepBlue"><a href="firstPage.html">首页</a></li>
        <li><a href="pubProduct.html">商品发布</a></li>
        <li><a href="">求购专区</a></li>
        <li><a href="">紧急销售</a></li>
        <li><a href="">最新发布</a></li>
        <li><a href="">发布求购</a></li>
        <li><a href="">其他</a></li>
      </ul>
    </div>

  </div>
 
  <section>
      <!--左侧导航-->
      <div id="main">
        <div class="myApp">
          <ul>
            <li class="title">我的账户</li>
            <li><a href="#accountInfo">账户信息</a></li>
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
        <!--用户中心-->
        
        
        
        
        
        <div id="userCenter">
        <form action="updateToUserSystem" method="post">  
                <!--基本信息-->
          <div class="baseInfo">
            <div class="changeHeadImg">
              <p class="headImg">
                <img src="${user.photo}" alt="头像"/>
              </p>
              <p>修改头像</p>
            </div>
            <div class="userInfo">
              <p>用户名称：<span>${user.username}</span>,欢迎您！</p>
              <p>当前积分：<i>${user.credit}</i></p>
              <p>会员等级：<i>${user.power}</i></p>
              <p>累计消费金额：<i>${user.money}</i></p>
              <p ><a href="#stuCertification">学生认证 去认证 >></a></p>
            </div>
          </div>
         
          
          </form>
          
          
          <!--我的商品-->
          <div class="myPro">
            <table>
              <tr>
                <td>发布商品</td>
                <td>求购商品</td>
                <td>正在交易</td>
                <td>已交易</td>
                <td>评价/留言</td>
              </tr>
              <tr>
                <td><i>16</i>件</td>
                <td><i>4</i>件</td>
                <td><i>2</i>件</td>
                <td><i>8</i>件</td>
                <td><i>36</i>条</td>
              </tr>
            </table>
          </div>
          <span>查看更多  >></span>
        </div>
        <!--账户信息-->
        <form action="updateToUserSystem" method="post">  
        <div id="accountInfo">
          <h2>账户信息</h2>
          <div class="baseInfo">
            <div class="userLeft">
              <p>
                <label>用户名：</label>
                <span>${user.username}</span>
              </p>
              <p>
                <label>email号：</label>
                <input type="text" placeholder="${user.email}"/>
              </p>
             
              <p>
                <label>学生认证：</label>
                <a href="#stuCertification">去认证</a>
              </p>
              <a href="#">提交</a>
            </div>
            <div class="userRight">
              <p class="headImg">
                <img src="${user.photo}" alt="头像"/>
              </p>
              <p>修改头像</p>
            </div>
          </div>
        </div>
        </form>
        <!--学生认证-->
        <div id="stuCertification">
          <h2>学生认证</h2>
          <div class="stuCertification">
            <p>此平台是针对各大高校的二手交易市场，因此为了尽量避免外界对此平台上的诚信干扰，用户可进行学生认证，保证学生身份信息的真实性，学生认证也是一种对其信用的肯定，通过认证的人员具有很大的可信度。</p>
              
              
              
              
              
              
              
              
              
              
              
              
              
              
            
        <script type="text/javascript">
    
		function indentUser(){
		
		$.post("${pageContext.request.contextPath}/indent/inserIdent",
		{"college":$("#college").val(),"school":$("#school").val(),
		"stuId":$("#stuId").val(),"stuName":$("#stuName").val(),
		"stuphono":$("#stuphono").val()}); 	
		}
		//页面加载初始化时候 ----对表单输入框 进行增加验证 --并设定验证通过够执行流程
		
    
		</script>
            
            
            <form  id="renzheng"   >
              <p>
                <label for="school">学校：</label>
                <input type="text" id="school" name="school"/>
              </p>
              <p>
                <label for="college">学院：</label>
                <input type="text" id="college" name="college"/>
              </p>
              <p>
                <label for="stuId">学号：</label>
                <input type="text" id="stuId" name="stuId"/>
              </p>
              <p>
                <label for="stuName">姓名：</label>
                <input type="text" id="stuName" name="stuName" />
              </p>
              <p>
                <label>学生证照片：</label>
                <button   id="stuphono">+学生证照片</button>
                <span>照片要求学生本人持学生证信息页，并能看清学生证信息</span>
              </p>
              <span>* 仅支持 JPG，PNG，GIF 格式的图片，文件大小不超过5M。</span>
              <button onclick="indentUser()">认证</button>
            </form>
          </div>
        </div>
        <!--修改密码-->
        <div id="changePwd">
          <h2>修改密码</h2>
          <div class="changePwd">
          
          <script type="text/javascript">
    
		function updateUser(){
		
			//jquery 验证框架 需要监听 form 提交事件 走验证
			$("#update").submit();	
		}
		//页面加载初始化时候 ----对表单输入框 进行增加验证 --并设定验证通过够执行流程
		$(document).ready(function(){
		
		alert("aaaaaaaaaa"),
			// 在键盘按下并释放及提交后验证提交表单
			  $("#update").validate({
				// 验证规则 
			    rules: {   newPwd : {   required:true,  minlength: 6,    maxlength:12  } ,
					  	  confirmNewPwd :{required:true,equalTo: "#newPwd"},
					  	  
			    		  },
			    messages: {    newPwd: {  required: "请输入密码",  minlength: "密码长度不能小于 6 个字符",   maxlength: "密码长度不能多于12个字符" }, 
			                 confirmNewPwd:{required:"内容不能为空",equalTo:"密码不一致"},
			                 
			              },
			              /*错误提示位置*/
			             /*  errorPlacement: function (error, element) {//第一个参数是错误的提示文字，第二个参数是当前输入框
				         error.appendTo(element.siblings("span"));//用的是jQuery，这里设置的是，错误提示文本显示在当前文本框的兄弟span中
				        },*/
			  submitHandler: function(form) 
			   {    
				 
				  //验证通过后 走此出业务流程
				 $.post("${pageContext.request.contextPath}/manager/updateToUserSystem",{"currPwd":$("#currPwd").val(),"newPwd":$("#newPwd").val()},
					 function(data){
					  if(data==1){
					  window.alert("恭喜密码修改成功,请重新登陆！");
					  window.location.href="${pageContext.request.contextPath}/index/login.jsp";
					  } 
					  else {
					   window.alert("密码修改失败!");
					   }
					  
					  
					 
			        }); 
			   } 
			});
		});
	
    
		</script>
          
          
            <form  id="update"   >
              <p>
                <label for="currPwd">用户名：</label>
                <input type="text" id="currPwd" name="currPwd" value="${user.username}"/>
              </p>
              <p>
                <label for="currPwd">新密码：</label>
                <input type="text" id="newPwd" name="newPwd" />
              </p>
              <p>
                <label for="confirmNewPwd">确认新密码：</label>
                <input type="text" id="confirmNewPwd" name="confirmNewPwd" />
              </p>
              <div class="aup" style="height: 40px;width: 80px;  background-color: blue;display: block; left:200px; top:200px;">
              <a class="btn btn-success block" id="up" style="font-size: 20px; color: white;" href="javascript:updateUser();">确定</a>
              </div>
            </form>
          </div>
        </div>
        
        
        
        
        
        
        <!--我的购物车-->
        <div id="myShoppingCart">
          <h2>我的购物车</h2>
          <div class="myShoppingCart">
            <table>
              <tr>
                <th>商品信息</th>
                <th>价格</th>
                <th>操作</th>
              </tr>
              <tr>
                <td>
                  <p class="pic">
                    <img src="../img/book-s1.jpg" alt=""/>
                  </p>
                  <div>
                    <p>Java开发技术实践</p>
                    <p class="owner">商品持有人：花生的星愿</p>
                  </div>
                </td>
                <td class="price">¥30.40</td>
                <td>
                  <button>确认购买</button>
                  <a href="">删除</a>
                </td>
              </tr>
              <tr>
                <td>
                  <p class="pic">
                    <img src="../img/book-s1.jpg" alt=""/>
                  </p>
                  <div>
                    <p>Java开发技术实践</p>
                    <p class="owner">商品持有人：花生的星愿</p>
                  </div>
                </td>
                <td class="price">¥30.40</td>
                <td>
                  <button>确认购买</button>
                  <a href="">删除</a>
                </td>
              </tr>
              <tr>
                <td>
                  <p class="pic">
                    <img src="../img/book-s1.jpg" alt=""/>
                  </p>
                  <div>
                    <p>Java开发技术实践</p>
                    <p class="owner">商品持有人：花生的星愿</p>
                  </div>
                </td>
                <td class="price">¥30.40</td>
                <td>
                  <button>确认购买</button>
                  <a href="">删除</a>
                </td>
              </tr>
              <tr>
                <td>
                  <p class="pic">
                    <img src="../img/book-s1.jpg" alt=""/>
                  </p>
                  <div>
                    <p>Java开发技术实践</p>
                    <p class="owner">商品持有人：花生的星愿</p>
                  </div>
                </td>
                <td class="price">¥30.40</td>
                <td>
                  <button>确认购买</button>
                  <a href="">删除</a>
                </td>
              </tr>
            </table>
            <p>
              <a href="">首页</a><a href="">上一页</a><a href="">1</a><a href="" class="curr">2</a><a href="">3</a><a href="">下一页</a><a href="">尾页</a>
            </p>
          </div>
        </div>
        <!--我的订单-->
        <div id="myOrder">
          <h2>
            <ul>
              <li class="curr"><a href="">我的订单</a></li>
              <li><a href="#wddd">正在交易（<i>2</i>）</a></li>
              <li><a href="#qrjy">确认交易（<i>1</i>）</a></li>
              <li><a href="">我的评价（<i>16</i>）</a></li>
              <li><a href="">交易成功（<i>2</i>）</a></li>
            </ul>
          </h2>
          <!--我的订单-->
          <div id="wddd" class="myShoppingCart curr">
            <table>
              <tr>
                <th>商品信息</th>
                <th>价格</th>
                <th>操作</th>
              </tr>
              <tr>
                <td>
                  <p class="pic">
                    <img src="../img/book-s1.jpg" alt=""/>
                  </p>
                  <div>
                    <p>Java开发技术实践</p>
                    <p class="owner">商品持有人：花生的星愿</p>
                  </div>
                </td>
                <td class="price">¥30.40</td>
                <td>
                  <button>确认购买</button>
                  <a href="">删除</a>
                </td>
              </tr>
              <tr>
                <td>
                  <p class="pic">
                    <img src="../img/book-s1.jpg" alt=""/>
                  </p>
                  <div>
                    <p>Java开发技术实践</p>
                    <p class="owner">商品持有人：花生的星愿</p>
                  </div>
                </td>
                <td class="price">¥30.40</td>
                <td>
                  <button>确认购买</button>
                  <a href="">删除</a>
                </td>
              </tr>
              <tr>
                <td>
                  <p class="pic">
                    <img src="../img/book-s1.jpg" alt=""/>
                  </p>
                  <div>
                    <p>Java开发技术实践</p>
                    <p class="owner">商品持有人：花生的星愿</p>
                  </div>
                </td>
                <td class="price">¥30.40</td>
                <td>
                  <button>确认购买</button>
                  <a href="">删除</a>
                </td>
              </tr>
              <tr>
                <td>
                  <p class="pic">
                    <img src="../img/book-s1.jpg" alt=""/>
                  </p>
                  <div>
                    <p>Java开发技术实践</p>
                    <p class="owner">商品持有人：花生的星愿</p>
                  </div>
                </td>
                <td class="price">¥30.40</td>
                <td>
                  <button>确认购买</button>
                  <a href="">删除</a>
                </td>
              </tr>
            </table>
            <p>
              <a href="">首页</a><a href="">上一页</a><a href="">1</a><a href="" class="curr">2</a><a href="">3</a><a href="">下一页</a><a href="">尾页</a>
            </p>
          </div>
          <!--确认交易-->
          <div id="qrjy" class="myShoppingCart">
            <table>
              <tr>
                <th>商品信息</th>
                <th>价格</th>
                <th>操作</th>
              </tr>
              <tr>
                <td>
                  <p class="pic">
                    <img src="../img/book-s1.jpg" alt=""/>
                  </p>
                  <div>
                    <p>Java开发技术实践</p>
                    <p class="owner">商品持有人：花生的星愿</p>
                  </div>
                </td>
                <td class="price">¥30.40</td>
                <td>
                  <button>确认交易完成</button>
                  <a href="">取消订单</a>
                </td>
              </tr>
              <tr>
                <td>
                  <p class="pic">
                    <img src="../img/book-s1.jpg" alt=""/>
                  </p>
                  <div>
                    <p>Java开发技术实践</p>
                    <p class="owner">商品持有人：花生的星愿</p>
                  </div>
                </td>
                <td class="price">¥30.40</td>
                <td>
                  <button>确认交易完成</button>
                  <a href="">取消订单</a>
                </td>
              </tr>
              <tr>
                <td>
                  <p class="pic">
                    <img src="../img/book-s1.jpg" alt=""/>
                  </p>
                  <div>
                    <p>Java开发技术实践</p>
                    <p class="owner">商品持有人：花生的星愿</p>
                  </div>
                </td>
                <td class="price">¥30.40</td>
                <td>
                  <button>确认交易完成</button>
                  <a href="">取消订单</a>
                </td>
              </tr>
              <tr>
                <td>
                  <p class="pic">
                    <img src="../img/book-s1.jpg" alt=""/>
                  </p>
                  <div>
                    <p>Java开发技术实践</p>
                    <p class="owner">商品持有人：花生的星愿</p>
                  </div>
                </td>
                <td class="price">¥30.40</td>
                <td>
                  <button>确认交易完成</button>
                  <a href="">取消订单</a>
                </td>
              </tr>
            </table>
            <p>
              <a href="">首页</a><a href="">上一页</a><a href="">1</a><a href="" class="curr">2</a><a href="">3</a><a href="">下一页</a><a href="">尾页</a>
            </p>
          </div>
        </div>
        <!--我的收藏-->
        <div id="myCollection">
          <h2>我的收藏</h2>
          <div class="myShoppingCart">
            <table>
              <tr>
                <th>商品信息</th>
                <th>价格</th>
                <th>操作</th>
              </tr>
              <tr>
                <td>
                  <p class="pic">
                    <img src="../img/book-s1.jpg" alt=""/>
                  </p>
                  <div>
                    <p>Java开发技术实践</p>
                    <p class="owner">商品持有人：花生的星愿</p>
                  </div>
                </td>
                <td class="price">¥30.40</td>
                <td>
                  <button>加入购物车</button>
                  <a href="">删除</a>
                </td>
              </tr>
              <tr>
                <td>
                  <p class="pic">
                    <img src="../img/book-s1.jpg" alt=""/>
                  </p>
                  <div>
                    <p>Java开发技术实践</p>
                    <p class="owner">商品持有人：花生的星愿</p>
                  </div>
                </td>
                <td class="price">¥30.40</td>
                <td>
                  <button>加入购物车</button>
                  <a href="">删除</a>
                </td>
              </tr>
              <tr>
                <td>
                  <p class="pic">
                    <img src="../img/book-s1.jpg" alt=""/>
                  </p>
                  <div>
                    <p>Java开发技术实践</p>
                    <p class="owner">商品持有人：花生的星愿</p>
                  </div>
                </td>
                <td class="price">¥30.40</td>
                <td>
                  <button>加入购物车</button>
                  <a href="">删除</a>
                </td>
              </tr>
              <tr>
                <td>
                  <p class="pic">
                    <img src="../img/book-s1.jpg" alt=""/>
                  </p>
                  <div>
                    <p>Java开发技术实践</p>
                    <p class="owner">商品持有人：花生的星愿</p>
                  </div>
                </td>
                <td class="price">¥30.40</td>
                <td>
                  <button>加入购物车</button>
                  <a href="">删除</a>
                </td>
              </tr>
            </table>
            <p>
              <a href="">首页</a><a href="">上一页</a><a href="">1</a><a href="" class="curr">2</a><a href="">3</a><a href="">下一页</a><a href="">尾页</a>
            </p>
          </div>
        </div>
        <!--下架商品-->
        <div id="shelfGoods">
          <h2>下架商品</h2>
          <div class="myShoppingCart">
            <table>
              <tr>
                <th>商品信息</th>
                <th>价格</th>
                <th>操作</th>
              </tr>
              <tr>
                <td>
                  <p class="pic">
                    <img src="../img/book-s1.jpg" alt=""/>
                  </p>
                  <div>
                    <p>Java开发技术实践</p>
                    <p class="owner">商品持有人：花生的星愿</p>
                  </div>
                </td>
                <td class="price">¥30.40</td>
                <td>
                  <button>重新上架</button>
                  <a href="">彻底删除</a>
                </td>
              </tr>
              <tr>
                <td>
                  <p class="pic">
                    <img src="../img/book-s1.jpg" alt=""/>
                  </p>
                  <div>
                    <p>Java开发技术实践</p>
                    <p class="owner">商品持有人：花生的星愿</p>
                  </div>
                </td>
                <td class="price">¥30.40</td>
                <td>
                  <button>重新上架</button>
                  <a href="">彻底删除</a>
                </td>
              </tr>
              <tr>
                <td>
                  <p class="pic">
                    <img src="../img/book-s1.jpg" alt=""/>
                  </p>
                  <div>
                    <p>Java开发技术实践</p>
                    <p class="owner">商品持有人：花生的星愿</p>
                  </div>
                </td>
                <td class="price">¥30.40</td>
                <td>
                  <button>重新上架</button>
                  <a href="">彻底删除</a>
                </td>
              </tr>
              <tr>
                <td>
                  <p class="pic">
                    <img src="../img/book-s1.jpg" alt=""/>
                  </p>
                  <div>
                    <p>Java开发技术实践</p>
                    <p class="owner">商品持有人：花生的星愿</p>
                  </div>
                </td>
                <td class="price">¥30.40</td>
                <td>
                  <button>重新上架</button>
                  <a href="">彻底删除</a>
                </td>
              </tr>
            </table>
            <p>
              <a href="">首页</a><a href="">上一页</a><a href="">1</a><a href="" class="curr">2</a><a href="">3</a><a href="">下一页</a><a href="">尾页</a>
            </p>
          </div>
        </div>
        <!--积分规则-->
        <div id="IntegralRule">
          <h2>积分规则</h2>
          <div class="integralCorrelation">
            <div class="jfgz">
              <span>积分规则：</span>网站获取积分的方式分为三大种：
              <p>1.交易积分：通过购买东西来获取积分。</p>
              <p>2.任务积分：通过完成登录，注册，评价等获取积分。</p>
              <p>3.销售积分：通过购卖东西来获取积分。多以系统设置的积分来获得积分。</p>
            </div>
            <div class="jfmx">
              <span>积分明细：</span>
              <table>
                <tr>
                  <th>行为</th>
                  <th>积分增减</th>
                </tr>
                <tr>
                  <td>购物成功</td>
                  <td>+10 不限次数</td>
                </tr>
                <tr>
                  <td>发布商品</td>
                  <td>首次+20 以后每次+10 不限次数</td>
                </tr>

                <tr>
                  <td>售出商品</td>
                  <td>+10 不限次数</td>
                </tr>
                <tr>
                  <td>注册成功</td>
                  <td>+10 仅首次</td>
                </tr>
                <tr>
                  <td>登录</td>
                  <td>+2 一天一次</td>
                </tr>
                <tr>
                  <td>有效交易</td>
                  <td>+5 不限次数</td>
                </tr>
                <tr>
                  <td>无效交易</td>
                  <td>-5 不限次数</td>
                </tr>
                <tr>
                  <td>填写联系手机号（qq号）</td>
                  <td>+10 仅首次</td>
                </tr>
                <tr>
                  <td>举报用户通过审核</td>
                  <td>+20 不限次数</td>
                </tr>
                <tr>
                  <td>分享应用</td>
                  <td>每天两次每次 +2</td>
                </tr>
                <tr>
                  <td>邀请新用户</td>
                  <td>+10 不限次数</td>
                </tr>
                <tr>
                  <td>填邀请码写</td>
                  <td>+5 仅首次</td>
                </tr>
              </table>
            </div>
          </div>

        </div>
        <!--商品规则-->
        <div id="commodityRule">
          <h2>商品规则</h2>
          <div class="commodityRule">
            <table>
              <tr>
                <th>行为</th>
                <th>惩罚</th>
              </tr>
              <tr>
                <td>同一类型的商品不得多次发布，建议发在一个商品当中。	</td>
                <td>一经发现将删除重复商品只保留一个</td>
              </tr>
              <tr>
                <td>不得在本平台上发布商品图片与实物不一致的商品，
                  若引用网上图片第一张必须为实物拍摄	</td>
                <td>一经发现将删除商品</td>
              </tr>

              <tr>
                <td>不得在本平台上发布带有虚假诈骗信息的商品</td>
                <td>一经查证将删除发布内容
                  并且永久封号</td>
              </tr>
              <tr>
                <td>不得在本平台上密集发布全新商品</td>
                <td>经发现将视作广告
                  删除全部商品并封号</td>
              </tr>
              <tr>
                <td>不得在本平台上发布违法商品</td>
                <td>一经查证将删除发布内容
                  并且永久封号</td>
              </tr>
              <tr>
                <td>不得在本平台上发布与商品无关信息</td>
                <td>一经发现将删除发布内容
                  并且永久封号</td>
              </tr>

              <tr>
                <td>发布商品30天后自动下架	</td>
                <td>下架后可在个人主页重新上架</td>
              </tr>
            </table>
          </div>
        </div>
        <!--我的发布-->
        <div id="myRelease">
          <h2>我的发布 <a href="">商品发布</a></h2>
         <div id="product_show">
    <ul id="box_userGoods">
  
    </ul>
    
     </div>
        </div>
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
   <script src="../js/jquery-1.11.3.js"></script>
  <script src="../js/public.js"></script>
  <script src="../js/userCenter.js"></script>

</body>
</html></html>