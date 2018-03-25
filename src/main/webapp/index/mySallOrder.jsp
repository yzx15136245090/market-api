<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 		<c:forEach var="mySallOrder" items="${mySallOrderList}">
 		
 			<tr>
                <td>
                  <p class="pic">
                    <img src="${mySallOrder.requesturl}${mySallOrder.pictureurl}" alt=""/>
                  </p>
                  <div>
                    <p>${mySallOrder.goodsname }</p>
                    <p class="owner">商品持有人：${mySallOrder.username }</p>
                  </div>
                </td>
                <td class="price">￥${mySallOrder.price }</td>
    
                <td>
                  <button class="add_cart" onclick="addShopCat('${mySallOrder.goodsid}')">加入购物车</button>
                  <a href="">删除</a>
                </td>
              </tr>
               </c:forEach>
               <input type="hidden" id="totalPages-mySallOrder" value="${totalPages }"/> 
        <input  type="hidden" id="startPageTemp-mySallOrder" value="1">