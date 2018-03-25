<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<c:forEach var="goods" items="${goodsList}">
   			 <li>
                <p class="title">${goods.goodsname }</p>
                <p>交易价：<span>${goods.price}</span></p>
                <p class="pic">
                  <img src="../img/book-b.jpg" alt=""/>
                </p>
                <p><i>0</i>赞 <i>0</i>留言 <i>0</i>评论</p>
                <p>88天展示时间</p>
                <div>
                  <button>擦亮</button>
                  <button>分享</button>
                  <button>......</button>
                </div>
              </li>
   
   </c:forEach>
   
        <input type="hidden" id="totalPages" value="${totalPages }"/> 
        <input  type="hidden" id="startPageTemp" value="1">
