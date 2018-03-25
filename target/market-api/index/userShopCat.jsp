<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 		<c:forEach var="userShopCat" items="${shopcats}">
 			<tr>
                <td>
                  <p class="pic">
                  <img src="${userShopCat.requesturl}${userShopCat.pictureurl}"  alt=""/>
                  </p>
                  <div>
                    <p>${userShopCat.goodsname }</p>
                    <p class="owner">商品持有人：${userShopCat.userid }</p>
                  </div>
                </td>
                <td class="price">￥${userShopCat.price }</td>
                <td>
                  <button id="surebuy" onclick="buy('${userShopCat.goodsid}')">确认购买</button>
                  <a href="">删除</a>
                </td>
              </tr>
               </c:forEach>
               <input type="hidden" id="totalPages-shopcat" value="${totalPages}"/> 
        <input  type="hidden" id="startPageTemp-shopcat" value="1">