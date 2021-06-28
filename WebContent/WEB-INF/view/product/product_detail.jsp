<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var='root' value="${pageContext.request.contextPath }/"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>パン屋 パン屋 ♥</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	var product_idx = $("#product_idx").val();
	var member_id = $("#member_id").val();

	$.getJSON("/admin/product/getAttaches/"+product_idx, function(result) {
		var str = '';
		$(result).each(function() {
			var data = this;
			str += makeHtmlcode_read(data);
		});
	});
	
	$("#select_count").on('blur', function() {
		var amount = $(this).val();
		var price = $("#price").val();
		var shipping = 3000; //배송비
		var finalPrice = (amount*price) + shipping;

		var str = '';
		
		str += '<p><strong>数量: </strong><span>&nbsp;'+amount+'個</span>&nbsp;&nbsp;&nbsp;';	
		str += '<strong>送料: </strong><span>&nbsp;'+shipping+'￦</span>&nbsp;&nbsp;&nbsp;';
		str	+= '<strong>価格: </strong><span>&nbsp;' + price + '￦</span></p>';
		str += '<h5><strong>決済金額:<span>&nbsp;' + finalPrice + '￦</strong></span></h5>'; 
		str += '<span class="glyphicon glyphicon-exclamation-remove"></span>';
		
		$(".selected_option").html(str);
	});
	
	//장바구니에 넣기
	$(".btn-cart").click(function(){
			
		if(member_id.length == 0){ alert('You should Login.'); return; }
		
		var product_idx = $("#product_idx").val();
		var amount = $(".numBox").val();
		      
		var data = {
		     product_idx : product_idx,
		     amount : amount
		     };
		
		$.ajax({
			type : "post",
			url : "${root}mypage/cart/",
			data : data,
			success : function(result) {
				if (result.trim() == 'add_success') {
					var check = confirm("買い物かごにこの品物が入れられました。");
						if (check) {//내 장바구니로 이동! 
							location.assign("${root}mypage/cart/cartlist/"+member_id);
						}
				} else if (result.trim() == 'already_existed') {
						alert("すでに 買い物かごに この品物は 入っています。");
				}
			}
		}); //아작스 끝
	}); //장바구니 넣기 부분 
		
});
</script>
</head>
<style>
.entire{border: 1px solid lightgray; font-size: 15px; }
</style>
<body>
<c:import url="/WEB-INF/view/include/head_meta.jsp" />
<c:import url="/WEB-INF/view/include/top_menu.jsp"/>
<!-- 내용 -->
<div align="center">
<div class="container" style="margin-top:50px; margin-bottom: 200px; ">
<!-- 시작 -->
<table class="entire">
	<tr><!-- 상품 사진 출력 영역 -->
		<td>
			<img src="${root }image/product/${productDetail.product_img}" width="500px" height="450px" alt="${productDetail.product_name}">
		</td>
		<td align="center">
			<table style=" width:500px; height:450px;">
				<tr align="center">
					<td width="80">&nbsp;&nbsp;商品番号: </td>
					<td width="160">${productDetail.product_idx}</td>
				</tr>
				<tr align="center">
					<td width="80">&nbsp;&nbsp;商品名: </td>
					<td width="160">${productDetail.product_name}</td>
				</tr>
				<tr align="center">
					<td width="80">&nbsp;&nbsp;価格: </td>
					<td width="160"><fmt:formatNumber value="${productDetail.product_price}" pattern="###,###,###"/>￦</td>
				</tr>
				<tr align="center">
					<td width="80">&nbsp;&nbsp;送料: </td>
					<td width="160">3,000￦</td>
					
				</tr>
				<tr align="center">
					<td width="80">&nbsp;&nbsp;保管方法: </td>
					<td width="160">${productDetail.storage_method }</td>
				</tr>
				<tr align="center">
					<td width="80">&nbsp;&nbsp;賞味期限: </td>
					<td width="160">${productDetail.expiration_date }</td>
				</tr>
				<tr align="center">
					<td width="80">&nbsp;&nbsp;仕入れ数量: </td>
					<td width="160">
						<!-- 해당 제품 장바구니 담기 -->
						<input type="number" name="amount" value="${amount}" placeholder="0" min="1" max="999" class="numBox" id="select_count">個
						<input type="hidden" name="product_idx" value="${productDetail.product_idx }" id="product_idx">
						<input type="hidden" name="price" value="${productDetail.product_price }" id="price">	
						<input type="hidden" name="member_id" value="${loginMemberDTO.member_id }" id="member_id">
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center" width="240"><hr>
						<div class="selected_option" style="height:90px; text-align: right;"></div> 
						<div class="btn-group-justified" style="text-align: center;" >
						 	<div class="btn btn-group">
								<button type="button" class="btn btn-danger btn-cart">買い物かごに入れる</button>
							</div>
						</div>
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<!-- 끝 -->

</div>
<!-- 상품삭제버튼과 정보수정버튼은 관리자에게만 보인다. -->
<c:choose>
	<c:when test="${loginMemberDTO.member_id eq 'admin'}"><%--관리자가 로그인을 한 경우(공지사항 게시판의 경우는 관리자만 사용가능하다. ) --%>
		<a href="${root }product/modify?category_idx=${productDetail.category_idx}&product_idx=${productDetail.product_idx}" class="btn btn-secondary btn-sm" style="color:white">この商品情報修正</a>
		<a href="${root }product/delete?category_idx=${productDetail.category_idx}&product_idx=${productDetail.product_idx}" class="btn btn-dark btn-sm" style="color:white">この商品を削除</a>
	</c:when>
	<c:otherwise></c:otherwise>
</c:choose>
</div>
<!-- 하단정보 -->
<c:import url="/WEB-INF/view/include/bottom_info.jsp" />
</body>
</html>