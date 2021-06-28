<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>パン屋 パン屋 ♥</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<style>
.member_email{}
</style>
</head>
<body>
<c:import url="/WEB-INF/view/include/head_meta.jsp" />
<c:import url="/WEB-INF/view/include/top_menu.jsp" />
<div class="container" style="margin-top:100px; margin-bottom:100px;">
<!-- 내용 -->
<div class="text-center">
<form action="${root }member/find_id" method="post">

		<p>以下に会員登録時に入力したメールアドレス(Email)を入力してください!<br>
			<center>
			<input class="form-control" style="width:300px;" type="text" id="member_email" name="member_email" required>
			</center>
		</p>
		<br>
		<p>
			<button type="submit" id=findBtn class="btn btn-danger">会員IDを探す</button>
			<button type="button" onclick="history.go(-1);" class="btn btn-primary">キャンセル</button>
		</p>

</form>
			
<!-- 하단 -->
</div>
</div>
<c:import url="/WEB-INF/view/include/bottom_info.jsp" />
</body>
</html>
