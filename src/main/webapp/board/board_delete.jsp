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
<jsp:useBean id="dao" class="com.care.root.board.dao.BoardDAO"/>
<c:set var="result" value="${dao.delete(param.id) }" />
	
<c:choose>
	<c:when test="${result == 1 }">
		<script type="text/javascript">
			alert('삭제 성공~!!!');
			location.href='board_main.jsp'
		</script>
	</c:when>
	<c:otherwise>
		<script type="text/javascript">
			alert('삭제 실패~!!!');
			location.href='board_main.jsp'
		</script>
	</c:otherwise>
</c:choose>
	
<c:import url="../default/footer.jsp"/>
</body>
</html>