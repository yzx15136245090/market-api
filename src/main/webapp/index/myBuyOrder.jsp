<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 		<c:forEach var="myBuyOrder" items="${myBuyOrderList}">
 		
 			<tr>
                <td>
                  <p class="pic">
                    <img src="${myBuyOrder.requesturl}${myBuyOrder.pictureurl}" alt=""/>
                  </p>
                  <div>
                    <p>${myBuyOrder.goodsname }</p>
                    <p class="owner">商品持有人：${myBuyOrder.username }</p>
                  </div>
                </td>
                <td class="price">￥${myBuyOrder.price }</td>
    
                <td>
                  <button class="add_cart" onclick="addShopCat('${myBuyOrder.goodsid}')">联系卖家</button>
                  <a href="">删除</a>
                </td>
              </tr>
               </c:forEach>
               <input type="hidden" id="totalPages-myBuyOrder" value="${totalPages }"/> 
        <input  type="hidden" id="startPageTemp-myBuyOrder" value="1">