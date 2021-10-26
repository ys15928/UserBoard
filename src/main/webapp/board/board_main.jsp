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
	<c:choose>
		<c:when test="${ loginUser == null }">
			<script type="text/javascript">
			alert('로그인 해주세요.')
			location.href="${contextPath}/login/login.jsp"
	</script>
		</c:when>
		<c:otherwise>	
			<jsp:useBean id="dao" class="com.care.root.board.dao.BoardDAO"/>
			<c:set var="list" value="${ dao.getBoardList() }" />
			<table width="100%" border="1">
				<tr align="center">
					<th width="10%">번호</th>
					<th width="20%">제목</th> 
					<th width="50%">내용</th> 
					<th width="10%">작성자</th>
				</tr>
				<c:forEach var="writing" items="${list }">
				<tr align="center">
					<td>${writing.num }</td>
					<td><a href="${contextPath}/board/board_info.jsp?id=${writing.title }">${writing.title }</a></td> 
					<td>${writing.content }</td>
					<td>${writing.id }</td> 
				</tr>
				</c:forEach>
				<tr>
					<td colspan="4" align="right">
					<button type="button" 
						onclick="location.href='${contextPath}/board/board_write.jsp?id=${loginUser }'">글쓰기</button>
					</td>
				</tr>
			</table>
		</c:otherwise>
	</c:choose>
</div>
<c:import url="../default/footer.jsp"/>
</body>
</html>