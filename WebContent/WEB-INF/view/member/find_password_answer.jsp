<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>パン屋 パン屋 ♥</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
</head>
<body>
<c:import url="/WEB-INF/view/include/head_meta.jsp" />
<c:import url="/WEB-INF/view/include/top_menu.jsp" />
<div class="container" style="margin-top:100px; margin-bottom:100px;">
<div class="text-center">
<!-- 내용 -->

<p>下記はあなたが会員登録をする際に入力した質問です。
<br>質問に対する答えを入力すると、あなたのパスワードを知ることができます。 </p><br>

<p>${memberDTO.question}</p>
<form action="find_password" method="post">
	<div class="form-group">
	<center>
		<input type="text" id="answer" name="answer" class="form-control" style="width:300px;"/>
	</center>
		<input type="hidden" id="member_id" name="member_id" value="${memberDTO.member_id}"/>
	</div>
	<div class="form-group">
		<input  type="submit" class="btn btn-danger" value="次に">
		<button type="button" onclick="history.go(-1);" class="btn btn-warning">戻る</button>
	</div>
	
	<c:if test="${check == 1}">
		<label>見つかりません。</label>
	</c:if>
	<c:if test="${check == 0 }">
		<label>あなたのパスワードは ${password} です。</label>
	</c:if>
	
</form>
<!-- 하단 -->
</div>
</div>
<c:import url="/WEB-INF/view/include/bottom_info.jsp" />
</body>
</html>