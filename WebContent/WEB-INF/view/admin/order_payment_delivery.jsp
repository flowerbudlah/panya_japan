<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Administrator's only</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<style>
table{border: 1px solid gray; }
th{color: white; background-color: salmon; text-align:center; border: 1px solid gray;}
td{text-align:center; border: 1px solid gray;}
</style>
</head>
<body>
<c:import url="/WEB-INF/view/include/head_meta.jsp" />
<c:import url="/WEB-INF/view/include/top_menu.jsp" />
<div class="container" style="margin:50px;">
<h5>The Page for the Administrator only</h5>
<p>注文·決済·配送の状態(Order and Payment and Delivery's Circumstance) </p>
<table style="width: 1250px; margin: auto; ">
		<thead>
			<tr>
				<th style="text-align: center;">No</th>
				<th style="text-align: center;">注文人(ID)</th>
				<th style="text-align: center;">注文内容</th>
				<th style="text-align: center;">Total Goods Price</th>
				<th style="text-align: center;">Delivery Fee</th>
				<th style="text-align: center;">Payment Price</th>
				<th style="text-align: center;">決済日</th>
				<th style="text-align: center;">決済情報</th>
				<th style="text-align: center;">配送状況</th>
				
				
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${allPaymentList }" var="allPaymentList">
			<tr>
				<td style="text-align: center;">${allPaymentList.order_idx }</td>
				<td style="text-align: center;">${allPaymentList.member_id }</td>
				<td style="text-align: center;">
					<a href="${root }mypage/order/orderInfo_Details?order_idx=${allPaymentList.order_idx}">자세히 보기</a>
				</td>
				<td style="text-align: center;">
					<fmt:formatNumber pattern="###,###,###" value="${allPaymentList.paymentprice-3000}"/>￦
				</td>
				<td style="text-align: center;">3,000 ￦</td>
				<td style="text-align: center;">
					<fmt:formatNumber pattern="###,###,###" value="${allPaymentList.paymentprice}"/>￦
				</td>
				<td style="text-align: center;">
					<fmt:formatDate pattern="yyyy-MM-dd(E) HH:mm:ss" value="${allPaymentList.order_date}" />
				</td>
				<td style="text-align: center;">${allPaymentList.payment_method }</td>
				<td style="text-align: center;">
				<form action='${root }admin/change' method='post' modelAttribute="changeDeliveryOrderDTO">
				<input type="hidden" name="order_idx" value="${allPaymentList.order_idx}"/>
					<select name="circumstance">
						<option value="${allPaymentList.circumstance }">${allPaymentList.circumstance }</option>
						<option value="決済完了(配送準備の前)">決済完了(配送準備の前)</option>
    					<option value="配送準備中">配送準備中</option>
    					<option value="配送中">配送中</option>
    					<option value="配送完了">配送完了</option>
					</select>
					<button type="submit" class="btn btn-link btn-sm">変更</button>
					
		</form>	
				</td>
			</tr>
		</c:forEach>
		</tbody>
</table> 

</div>
<c:import url="/WEB-INF/view/include/bottom_info.jsp" />
</body>
</html>