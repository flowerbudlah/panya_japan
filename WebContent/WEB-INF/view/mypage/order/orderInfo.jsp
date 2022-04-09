<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Panya</title>
<link rel="icon" type="image/x-icon" href="${root }image/favicon.png">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<style>
th{color: white; background-color: salmon; text-align: center; width: 250px;  }
tr{border: 1px solid lightgray; }
td{background-color: whitesmoke; text-align: left; }

h4:hover{color: salmon;}
h4:active{color: gray;}
.attention{color:red; }
</style>
</head>
<body>
<c:import url="/WEB-INF/view/include/head_meta.jsp" />
<c:import url="/WEB-INF/view/include/top_menu.jsp" />
<!-- content -->
<div class="container text-center" style="margin-top:100px; margin-bottom:100px;">
<h4>
Hello, ${loginMemberDTO.member_name }! <br>
This page shows your order, payment and delivery informaton. 
</h4>
<c:choose>
	<c:when test="${orderPaymentList != null}">
		<c:forEach items="${orderPaymentList}" var="orderPaymentList">
		<table style="border: 1px solid lightgray; width:100%;" >
			<tr>
				<th>Order number</th>
 				<td><a href="${root }mypage/order/orderInfo_Details?order_idx=${orderPaymentList.order_idx}">${orderPaymentList.order_idx}</a></td>
			</tr>
			<tr>
				<th>Order Date</th>
 				<td><fmt:formatDate pattern="yyyy-MM-dd(E) hh:mm:ss" value="${orderPaymentList.order_date}" /></td>
			</tr>
			<tr>
				<th>Sender's name<br>Sender's phoneNumber<br>Sender's Address</th>
 				<td>${orderPaymentList.sender_name}<br>${orderPaymentList.sender_tel}
 				<br>${orderPaymentList.sender_address}&nbsp;&nbsp;&nbsp;&nbsp;(zipcode: ${orderPaymentList.sender_postcode})</td>
			</tr>
			<tr>
				<th>Recipient's name<br>Recipient's phoneNumber<br>Recipient's Address</th>
 				<td>${orderPaymentList.recipient_name}<br>${orderPaymentList.recipient_tel}
 				<br>${orderPaymentList.recipient_address}&nbsp;&nbsp;&nbsp;&nbsp;
 				(zipcode: ${orderPaymentList.recipient_postcode})</td>
			</tr>
			<tr>
				<th>Memo</th>
 				<td>${orderPaymentList.memo}</td>
			</tr>	
			<tr>
				<th>Total Payment Price</th>
 				<td>
 					<strong>Total<fmt:formatNumber pattern="###,###,###" value="${orderPaymentList.paymentprice }" />won</strong>
 					(Sum of commodity prices<fmt:formatNumber pattern="###,###,###" value="${orderPaymentList.paymentprice-3000 }" />won
 					+ Delivery Fee 3,000 won)
 				</td>
			</tr>
			<tr>
				<th>Payment method</th>
 				<td>${orderPaymentList.payment_method}</td>
			</tr>
			<tr>
				<th>Delivery status</th>
 				<td><strong>${orderPaymentList.circumstance}</strong>
 					<p class="attention">
 						※ You can get a 100% refund before delivery starts after payment is completed. 
 						<br>But You can return it after starting delivery.
 						<br>Please contact me if you want to return it. (Tel. +82-10-5824-9508)
 					</p>
 				</td> 
			</tr>
		</table><br>
		</c:forEach>
	</c:when>
	<c:otherwise>
		<p>
			There is no information about order, payment, and delivery. <br>
			I think that You haven't placed an order yet.
		</p>
	</c:otherwise>
</c:choose>
</div>
<!-- bottom information -->
<c:import url="/WEB-INF/view/include/bottom_info.jsp" />
</body>
</html>