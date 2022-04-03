<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Administrator Only</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<style>
table{border: 1px solid gray; }
th{color: white; background-color: #df4759; text-align:center; border: 1px solid gray;}
td{text-align:center; border: 1px solid gray;}
</style>
</head>
<body>
<c:import url="/WEB-INF/view/include/head_meta.jsp" />
<c:import url="/WEB-INF/view/include/top_menu.jsp" />
<div class="container" style="margin:50px;">
<h5>The Page for Administrator only</h5>
<p>Member List</p>
<%--회원검색 --%>
<form action="${root }admin/search_result" method="get" class="text-left">
	<select name="type">
		<option value="member_id">ID</option>
		<option value="member_name">Name</option>
	</select>
	<input type="text" name="keyword" value="" required="required"/>
	<input type="submit" value="Search" class="btn btn-danger btn-sm" /> 
</form>
<!-- 검색기능끝 -->
<table style="width: 1250px; margin: auto;">
		<thead>
			<tr>
				<th style="text-align: center;">No</th>
				<th style="text-align: center;">ID</th>
				<th style="text-align: center;">Name</th>
				<th style="text-align: center;">Telephone No</th>
				<th style="text-align: center;">Address</th>
				<th style="text-align: center;">E-mail</th>
				<th style="text-align: center;">Register Date</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${allMemberList}" var="allMemberList">
			<tr>
				<td style="text-align: center;">${allMemberList.member_idx }</td>
				<td style="text-align: center;">${allMemberList.member_id }</td>
				<td style="text-align: center;">${allMemberList.member_name }</td>
				<td style="text-align: center;">${allMemberList.member_tel }</td>
				<td style="text-align: center;">${allMemberList.member_address }</td>
				<td style="text-align: center;">${allMemberList.member_email}</td>
				<td style="text-align: center;">
					<fmt:formatDate pattern="yyyy-MM-dd(E) HH:mm:ss" value="${allMemberList.registerDate }" />
				</td>
			</tr>
		</c:forEach>
		</tbody>
</table> 
</div>
<c:import url="/WEB-INF/view/include/bottom_info.jsp" />
</body>
</html>