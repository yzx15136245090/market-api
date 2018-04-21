<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<c:forEach var="goods" items="${goodsList}">
            	<li  class="oneGoods"  >
            		<img onclick="goodsdetail('${goods.goodsid}')" src="${goods.requesturl}${goods.pictureurl}" alt="商品图片" id="img_good"/>
            <b>￥${goods.price}</b>
            <span>${goods.goodsname }</span>
            <span class="belong-somebody">商品持有人：${goods.username }</span>
            <a  onclick="tochat('${goods.goodsid}')" class="connect">联系卖家</a><a class="b_cart" onclick="addShopCat('${goods.goodsid}')">加入购物车</a></li>
   </c:forEach>
   
        <input type="hidden" id="totalPages" value="${totalPages }"/> 
        <input  type="hidden" id="startPageTemp" value="1">
      