<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<c:forEach var="userGoods" items="${usergoodsList}">
   			 <li>
                <p class="title">${userGoods.goodsname }</p>
                <p>商品价格：<span>${userGoods.price}</span></p>
                <p class="pic">
                  <img src="${userGoods.requesturl}${userGoods.pictureurl}" alt="商品图片"/>
                </p>
                <p><i>0</i>赞 <i>0</i>留言 <i>0</i>评论</p>
                <p>距离下架还有<span>4</span>天</p>
                <div>
                  <button>下架</button>
                  <button>分享</button>
                </div>
              </li>
   
   </c:forEach>
   
        <input type="hidden" id="totalPages-myRelease" value="${totalPages }"/> 
        <input  type="hidden" id="startPageTemp-myRelease" value="1">
