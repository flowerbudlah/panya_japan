<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
table{border: 1px solid lightgray; }
th{color: white; background-color: #df4759; text-align:center; }
.sender{  }
.recipient{ background-color: whitesmoke; }
.title{ }
h5:hover{color: #df4759;}
h5:active{color: gray;}
</style>
</head>
<body>
<!--상단메뉴 -->
<c:import url="/WEB-INF/view/include/head_meta.jsp" />
<c:import url="/WEB-INF/view/include/top_menu.jsp" />
<div class="container" style="margin-top: 50px; margin-bottom:50px;" align="center">
<!--본문내용-->
<c:set value="${cartMap.cartList}" var="cartList"/>
	<h5><strong>${loginMemberDTO.member_name }'s CartList</strong></h5> 
	<table class="table table-hover" style="width: 100%; margin: auto; border-bottom: 1px solid #D5D5D5;">
		<thead>
			<tr>
				<th style="text-align: center;"></th>
				<th colspan="2" style="text-align: center;">Product Name</th>
				<th style="text-align: center;">Unit Price</th>
				<th style="text-align: center;">Quantity</th>
				<th style="text-align: center;">Total Price</th>
				<th style="text-align: center;"></th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${cartList != null}">
					<c:forEach items="${cartList}" var="vo" varStatus="status">
						<tr>
							<td>${vo.cart_idx }</td>
							<td>
								<a href="${root }product/product_detail?product_idx=${vo.product_idx}">
									<img src="${root }image/product/${vo.product_img}" width="80px" height="80px" alt="${vo.product_name}">
								</a>
							</td>
							<td>
								<a href="${root }product/product_detail?product_idx=${vo.product_idx}">
									${vo.product_name}
								</a>
							</td>
							<td style="text-align: center;">
								<fmt:formatNumber value="${vo.price }" pattern="###,###,###"/>￦
							</td>
							<td style="text-align: center;">
							<%--수량과 수량변경에 대한 --%>
							<form action='${root }mypage/cart/cartlist/updateAmount' method='post' modelAttribute="updateAmountCartDTO">
								<input type="hidden" name="cart_idx" value="${vo.cart_idx }"/>
								<input type="number" name="amount" value="${vo.amount }" min="1" max="999"/>個(or set)
							<button type="submit" class="btn btn-link" >Change</button>
							</form>
							<%--수량변경 관련 끝 --%>
							</td>
							<td style="text-align: center;">
								<fmt:formatNumber value="${vo.price*vo.amount }" pattern="###,###,###"/> ￦
							</td>
							<td style="text-align: center;">
								<a href="${root }mypage/cart/cartlist/delete?cart_idx=${vo.cart_idx}">Delete</a>
							</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
				<tr>
					<td colspan="7">
						<p>Now Your CartList is empty.</p>
					</td>
				</tr>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
<%--주문정보입력 테이블 --%>
<table class="table table-hover" style="width: 100%; margin: auto; border-bottom: 1px solid #D5D5D5;">
<thead>
	<tr>
		<th style="text-align: center;" colspan="7">
			<div class="text-right">
			Total Price of Ordered Goods : <fmt:formatNumber value="${paymentMoney }" pattern="###,###,###"/> ￦<br>
			Delivery Fee: 
			<c:choose>
				<c:when test="${cartList != null}"><%--장바구니에 물건이 들어있다. --%>3,000</c:when>
				<c:otherwise>0</c:otherwise>
			</c:choose>￦<br>
			Payament Price: 
			<c:choose>
				<c:when test="${cartList != null}"><%--장바구니에 물건이 들어있다. --%>	
					<fmt:formatNumber value="${paymentMoney+3000}" pattern="###,###,###"/>
				</c:when>
				<c:otherwise>0</c:otherwise>
			</c:choose>￦
			</div>
		</th>
	 </tr>
</thead>
<form action='${root }mypage/order' method='post' autocomplete="off">
<input type="hidden" name="circumstance" value="決済完了(配送準備の前)" />
<input type="hidden" name="member_id" value="${loginMemberDTO.member_id }"/>
<tbody>
	<tr class="sender">
		<td colspan="2"><input type="hidden" name="paymentprice" value="${paymentMoney+3000}"/><%--배송비 포함한 결제금액 --%></td>
		<td colspan="2">Sender's Name: </td>
		<td colspan="3">
			<input type="text" style="width:150px;" name="sender_name" id="sender_name" required="required"/>
		</td>
	</tr>
	<tr class="sender">
		<td colspan="2"></td>
		<td colspan="2">Sender's Telephone Number: </td>
		<td colspan="3">
			<input type="tel" style="width:150px;"  name="sender_tel" id="sender_tel" required="required"/>
		</td>
	</tr>
	<tr class="sender">
		<td colspan="2"></td>
		<td colspan="2">Sender's Address: </td>
		<td colspan="3">
			<input type="text" name="sender_postcode" id="postcode" placeholder="郵便番号" style="width:150px;">
			<input type="button" class="btn btn-primary btn-sm" id="searchAdd" value="郵便番号を探す" ><br>
			<input type="text" name="sender_address" placeholder="詳しい住所(Detail Address)" id="roadAddress" style="width:600px;"/>
		</td>
	</tr>
	<tr class="recipient">
		<td colspan="2" ></td>
		<td colspan="2">Recipient's name: </td>
		<td colspan="3">
			<input type="text" style="width:150px;" name="recipient_name" required="required"/>
		</td>
	</tr>
	<tr class="recipient">
		<td colspan="2"></td>
		<td colspan="2">Recipient's Telephone Number: </td>
		<td colspan="3">
			<input type="tel" style="width:150px;"  name="recipient_tel" id="recipient_tel" required="required"/>
		</td>
	</tr>
	<tr class="recipient">
		<td colspan="2"></td>
		<td colspan="2">Recipient's address: </td>
		<td colspan="3">
			<input type="text" name="recipient_postcode" id="postcode2" placeholder="郵便番号" style="width:150px;">
			<input type="button" id="searchAdd2" value="郵便番号を探す"  class="btn btn-info btn-sm"><br>
			<input type="text" name="recipient_address" placeholder="詳しい住所(Detail Address)" id="roadAddress2" style="width:600px;"/>
		</td>
	</tr>
	<tr>
		<td colspan="2"></td>
		<td colspan="2">Memo: </td>
		<td colspan="3">
			<textarea style="width:600px; resize: none;" name="memo" placeholder="注文決済配送に関するメモはこちらに入力してください。"></textarea>
		</td>
	</tr>
	<tr>
		<td colspan="2"></td>
		<td colspan="2">Payment Method</td>
		<td colspan="3">
			<input type="radio" name="payment_method" value="クレジットカード">Credit card<br>
			<input type="radio" name="payment_method" value="口座に入金">Account deposit
		</td>
	</tr>

</tbody>
</table><br>
	<c:choose>
		<c:when test="${cartList != null}"><%--장바구니에 물건이 들어있다. --%>
			<button type="submit" class="btn btn-danger">注文完了</button>
		</c:when>
		<c:otherwise></c:otherwise>
	</c:choose>
</form>
</div>
<!-- 하단정보 -->
<c:import url="/WEB-INF/view/include/bottom_info.jsp" />
<%--발송인의 우편번호 API--%>
<script>
function postcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            var roadAddr = data.roadAddress; 
            var extraRoadAddr = ''; 

            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }

            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
       
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }
      
            document.getElementById('postcode').value = data.zonecode;
            document.getElementById("roadAddress").value = roadAddr;
           }
	}).open();
}
$("#searchAdd").click(function(event) {
	event.preventDefault();
	postcode();
});
<%--수신인의 우편번호 API --%>
function postcode2() {
    new daum.Postcode({
        oncomplete: function(data) {
            var roadAddr = data.roadAddress;
            var extraRoadAddr = ''; 

      		if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
         
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
           
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            document.getElementById('postcode2').value = data.zonecode;
            document.getElementById("roadAddress2").value = roadAddr;
           }
	}).open();
}
$("#searchAdd2").click(function(event) {
	event.preventDefault();
	postcode2();
});
</script>
</body>
</html>

