<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 		<c:forEach var="myCollect" items="${collecgoodsList}">
 		
 			<tr>
                <td>
                  <p class="pic">
                    <img src="${myCollect.requesturl}${myCollect.pictureurl}" alt=""/>
                  </p>
                  <div>
                    <p>${myCollect.goodsname }</p>
                    <p class="owner">商品持有人：${myCollect.username }</p>
                  </div>
                </td>
                <td class="price">￥${myCollect.price }</td>
    
                <td>
                  <button class="add_cart" onclick="addShopCat('${myCollect.goodsid}')">加入购物车</button>
                  <a href="">删除</a>
                </td>
              </tr>
               </c:forEach>
               <input type="hidden" id="totalPages" value="${totalPages }"/> 
        <input  type="hidden" id="startPageTemp" value="1">