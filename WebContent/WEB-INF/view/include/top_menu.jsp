<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<c:set var="root" value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=], initial-scale=1.0">
<title>Document</title>
<style>
.main{ text-align: center; margin: 0;  padding: 0; background: salmon; font-size:20px; }
.main li {display: inline-block; font-weight: bolder; list-style: none;  color: whitesmoke; }
.main ul{ background: salmon;  opacity: 0;   transition: opacity 0.4s; pointer-events: none; position: absolute; padding-left: 0px; }
.main:after{ content: ''; display: block; clear: both; }
.main > li { margin-right: 50px;  margin-left: 50px;  margin-top: 140px; margin-bottom: 110px; line-height: 40px; padding-bottom: 10px; }
.main > li ul li{ float: left; list-style: none; font-weight: lighter; font-size: 17px;  position: relative; margin:0 auto; }
.main > li:hover ul{  opacity: 1; pointer-events: auto; }
</style>
</head>
<body>
<ul class="main">
	<li>商品紹介 
     	<ul> 
        	<li><a href="${root }product/product_by_category?category_idx=1" style="color:white;">パン </a></li><br>
        	<li><a href="${root }product/product_by_category?category_idx=2" style="color:white;">ケーキ</a></li><br>
        	<li><a href="${root }product/product_by_category?category_idx=3" style="color:white;">菓子</a></li>
        </ul>
    </li> 
   	<li>マイページ
      	<ul>
      	<c:choose>
      		<c:when test="${loginMemberDTO.memberLogin == true }">
      			<li><a href="${root}mypage/cart/cartlist/${loginMemberDTO.member_id}" style="color:white;">買い物かご</a></li><br>
      			<li><a href="${root}mypage/order/orderInfo" style="color:white;">注文 & 決済 & 配送</a></li>
      		</c:when>
      	</c:choose>
		</ul>
    </li>
	
	<li><a href="${root }board/main?board_idx=1" style="color:white;">お知らせ</a></li>
	<li><a href="${root }board/main?board_idx=2" style="color:white;">お問い合わせ</a></li>
	
	<li><a href="${root }etc/map" style="color:white;">位置</a></li>
	
	<li>管理者
      <ul>
      	<c:choose>
      		<c:when test="${loginMemberDTO.memberLogin == true }">
				<li><a href="${root}admin/order_payment_delivery" style="color:white;">注文 & 決済 & 配送</a></li><br>
 				<li><a href="${root }admin/member" style="color:white;">会員管理</a></li>
			</c:when>
			<c:otherwise></c:otherwise>    
		</c:choose>
      </ul>
    </li>
	
</ul>
</body>
</html>

