<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="root" value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Panya</title>
<link rel="icon" type="image/x-icon" href="${root }image/favicon.png">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
</head>
<body>
<!--Top Menu-->
<c:import url="/WEB-INF/view/include/head_meta.jsp" />
<c:import url="/WEB-INF/view/include/top_menu.jsp" />
<!--  -->
<div class="container" style="margin-top:100px; margin-bottom:100px;">
	<div class="row">
		<div class="col-lg-4 col-sm-6"></div>
		<div class="col-sm-4">
			<div class="card shadow-none">
				<div class="card-body">
				<c:if test="${failure == true }" >
				<div class="alert alert-danger">
					<p> The ID and password you input do not match. Please check again.</p>
				</div>
				</c:if>
				<form:form action="${root }member/login_proc" method="post" modelAttribute="tmpLoginMemberDTO" >
				<div class="form-group">
					<form:label path="member_id">ID</form:label>
					<form:input path="member_id" class="form-control"/>
					<form:errors path="member_id" style="color: red;"/>
				</div>
				<div class="form-group">
					<form:label path="member_pw">Password</form:label>
					<form:password path="member_pw" class="form-control"/>
					<form:errors path="member_pw" style="color: red;"/>
				</div>
				<div class="form-group text-right">
					<font color=red>Help</font><br>
					<a href="${root }member/find_id_form" style="">Forgot your Id ?</a><br>
					<a href="${root }member/find_password_question" style="">Forgot your Password?</a><br><br>
					<form:button class="btn btn-danger">Login</form:button>
				</div>
				</form:form>
				</div>
			</div>
		</div>
		<div class="col-sm-3"></div>
	</div>
</div>
<!-- bottom information -->
<c:import url="/WEB-INF/view/include/bottom_info.jsp" />
</body>
</html>