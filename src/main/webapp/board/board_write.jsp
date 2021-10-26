<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:import url="../default/header.jsp"/>
<div class="wrap" align="center">
	<form action="${contextPath }/board/board_register.jsp" method="post">
		- 제 목 -<br> <input type="text" name="title" placeholder="제목" style ="width:400px; height:50px"><br><br><br>
		- 내 용 -<br> <input type="text" name="content" placeholder="내용" style ="width:600px; height:200px"><br><br><br>
		<input type="hidden" name="id" value="${loginUser }">
		<input type="submit" value="등록">
	</form>
</div>

<c:import url="../default/footer.jsp"/>
</body>
</html>