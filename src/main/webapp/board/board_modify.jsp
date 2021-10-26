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
<%	request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="dao" class="com.care.root.board.dao.BoardDAO"/>
<c:set var="board" value="${dao.getBoard(param.id) }"/>
<c:set var="origin" value="${board.title }"/>

<c:import url="../default/header.jsp"/>
<form action="${contextPath }/board/board_modify_save.jsp" method="post">
	<input type="hidden" name="origin" value="${origin}">
	title : <input type="text" name="title" value="${board.title }"><br>
	content : <input type="text" name="content" value="${board.content }"><br>
	<input type="hidden" name="id" value="${board.id }">
	
	<input type="submit" value="수정완료">
	<input type="button" value="이전" onclick="history.back()">
</form>
	
<c:import url="../default/footer.jsp"/>
</body>
</html>