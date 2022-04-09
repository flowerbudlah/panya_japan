<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Administrator only</title>
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
<h4>The Page for the Administrator only</h4>
<h5>Member List</h5>
<P>Total ${search_result_count}人</P>
<%--searching member  --%>
<form action="${root }admin/search_result" method="get" class="text-left">
	<select name="type">
		<option value="member_id">ID</option>
		<option value="member_name">Name</option>
	</select>
	<input type="text" name="keyword" value="" required="required"/>
	<input type="submit" value="Search" class="btn btn-danger btn-sm" /> 
</form>
<!--as a table, There appears the result of member search in this part  -->
<table style="width: 1250px; margin: auto;">
	<thead>
		<tr>
			<th style="text-align: center;">No</th>
			<th style="text-align: center;">ID</th>
			<th style="text-align: center;">Name</th>
			<th style="text-align: center;">Telephone Number</th>
			<th style="text-align: center;">Address</th>
			<th style="text-align: center;">E-mail</th>
			<th style="text-align: center;">Register Date</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach items="${memberList}" var="memberList">
		<tr>
			<td style="text-align: center;">${memberList.member_idx }</td>
			<td style="text-align: center;">${memberList.member_id }</td>
			<td style="text-align: center;">${memberList.member_name }</td>
			<td style="text-align: center;">${memberList.member_tel }</td>
			<td style="text-align: center;">${memberList.member_address }</td>
			<td style="text-align: center;">${memberList.member_email}</td>
			<td style="text-align: center;">${memberList.registerDate }</td>
		</tr>
	</c:forEach>
	</tbody>
</table> 
</div>
<c:import url="/WEB-INF/view/include/bottom_info.jsp" />
</body>
</html>