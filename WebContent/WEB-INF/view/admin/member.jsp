<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<h4>The Page for the Administrator only</h4>
<h5>会員名簿(Member List)</h5>

<%--회원검색 --%>
<form action="${root }admin/search_result" method="get" class="text-left">
	<select name="type">
		<option value="member_id">会員ID</option>
		<option value="member_name">名前</option>
	</select>
	<input type="text" name="keyword" value="" required="required"/>
	<input type="submit" value="Search" class="btn btn-danger btn-sm" /> 
</form>
<!-- 검색기능끝 -->


<table style="width: 1250px; margin: auto;">
		<thead>
			<tr>
				<th style="text-align: center;">No</th>
				<th style="text-align: center;">会員ID</th>
				<th style="text-align: center;">名前</th>
				<th style="text-align: center;">電話番号</th>
				<th style="text-align: center;">住所</th>
				<th style="text-align: center;">E-メール</th>
				<th style="text-align: center;">登録日</th>
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
				<td style="text-align: center;">${allMemberList.registerDate }</td>
			</tr>
		</c:forEach>
		</tbody>
</table> 

</div>
<c:import url="/WEB-INF/view/include/bottom_info.jsp" />
</body>
</html>