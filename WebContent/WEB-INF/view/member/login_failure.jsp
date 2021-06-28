<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }/" />

<script type="text/javascript">
	alert('"Your login process did not complete successfully..ログイン失敗');
	location.href='${root}member/login?failure=true';
</script> 

