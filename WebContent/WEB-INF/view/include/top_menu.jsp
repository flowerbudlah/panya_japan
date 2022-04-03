<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<c:set var="root" value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=], initial-scale=1.0">
<link href="https://fonts.googleapis.com/css2?family=Single+Day&display=swap" rel="stylesheet">
<title>Document</title>
<style>
.main{ text-align: center; margin: 0;  padding: 0; background: #df4759; font-family: 'Single Day', cursive; font-size:20px; }
.main li {display: inline-block; font-weight: bolder; list-style: none;  color: white; }
.main ul{opacity: 0; transition: opacity 0.4s; pointer-events: none; position: absolute; padding-left: 0px; }
.main:after{ content: ''; display: block; clear: both; }
.main > li { margin-right: 50px;  margin-left: 50px;  margin-top: 145px; margin-bottom: 70px; line-height: 25px; padding-bottom: 5px; }
.main > li ul li{ float: left; list-style: none; font-weight: bolder; font-size: 15px;  position: relative; margin:0 auto; }
.main > li:hover ul{ opacity: 1; pointer-events: auto; }

</style>
</head>
<body>
<ul class="main">
	<li>All
     	<ul> 
        	<li><a href="${root }product/product_by_category?category_idx=1" style="color:white;">Bread</a></li><br>
        	<li><a href="${root }product/product_by_category?category_idx=2" style="color:white;">Cake</a></li><br>
        	<li><a href="${root }product/product_by_category?category_idx=3" style="color:white;">Cookies</a></li>
        </ul>
    </li> 
   	<li>My Page
      	<ul>
      	<c:choose>
      		<c:when test="${loginMemberDTO.memberLogin == true }">
      			<li><a href="${root}mypage/cart/cartlist/${loginMemberDTO.member_id}" style="color:white;">CartList</a></li><br>
      			<li><a href="${root}mypage/order/orderInfo" style="color:white;">Order & Delivery & Payment</a></li>
      		</c:when>
      	</c:choose>
		</ul>
    </li>
	
	<li><a href="${root }board/main?board_idx=1" style="color:white;">Notification</a></li>
	<li><a href="${root }board/main?board_idx=2" style="color:white;">Service Center</a></li>

	<li><a href="${root }etc/map" style="color:white;">Location</a></li>
	
	<li>Administrator
      <ul>
      	<c:choose>
      		<c:when test="${loginMemberDTO.memberLogin == true }">
				<li><a href="${root}admin/order_payment_delivery" style="color:white;">Order & Delivery & Payment</a></li><br>
 				<li><a href="${root }admin/member" style="color:white;">Membership Management</a></li>
			</c:when>
			<c:otherwise></c:otherwise>    
		</c:choose>
      </ul>
    </li>
</ul>
</body>
</html>