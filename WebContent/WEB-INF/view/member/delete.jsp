<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>パン屋 パン屋 ♥</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<script type="text/javascript">
	$(document).ready(function(){// 취소
		$(".cencle").on("click", function(){
			location.href = "${root}main";
		})
		
		$("#submit").on("click", function(){
			if($("#member_pw").val()==""){
				alert("最後にパスワードを入力してください。");
					$("member_pw").focus();
					return false;
				}	
			});
		})
</script>
<body>
<!-- 상단메뉴 -->
<c:import url="/WEB-INF/view/include/head_meta.jsp" />
<c:import url="/WEB-INF/view/include/top_menu.jsp"/>
<!-- 본문내용 -->
<div class="container" style="margin-top:100px; margin-bottom:100px">
<div class="text-center">
<p>退会をお望みですか？ </p>
<p>退会前に情報を確認するため、あなたのパスワード(Your Password)を入力してください。 </p>
<p>パン屋をご利用いただきありがとうございます。</p>
<form action="${root }member/delete_proc" method="post">
	<input type="hidden" id="member_id" name="member_id" value="${loginMemberDTO.member_id}"/>
	
	<div class="form-group">
		<input type="password" id="member_pw" name="member_pw" size="30" />
	</div>
				
	<div class="form-group">
		<button class="btn btn-success" type="submit" id="submit">退会</button>
		<button class="cencle btn btn-danger" type="button">退会 取り消し</button>
	</div>
</form>
	<div>
		<c:if test="${msg == false}">パスワードが見つかりません。正確なパスワードを入力してください。</c:if>
	</div>
	
</div>
</div>
<!-- 하단정보 -->
<c:import url="/WEB-INF/view/include/bottom_info.jsp"/>
</body>
</html>

