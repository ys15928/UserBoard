<%@page import="com.care.root.board.dao.BoardDAO"%>
<%@page import="com.care.root.board.dto.BoardDTO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" />
<fmt:requestEncoding value="utf-8"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="dao" class="com.care.root.board.dao.BoardDAO"/>
<jsp:useBean id="dto" class="com.care.root.board.dto.BoardDTO"/>
<jsp:setProperty property="*" name="dto"/>
<c:set var="result" value="${dao.modifySave(dto) }"/>

<c:choose>
	<c:when test="${result == 1 }">
		<script type="text/javascript">
			alert('수정 성공~!!!');
			location.href='board_main.jsp'
		</script>
	</c:when>
	<c:otherwise>
		<script type="text/javascript">
			alert('수정 실패~!!!');
			location.href='board_main.jsp'
		</script>
	</c:otherwise>
</c:choose>

</body>
</html>