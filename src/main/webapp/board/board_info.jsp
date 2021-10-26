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
<c:set var="board" value="${dao.getBoard(param.id) }"/>
<div>
	<table width="100%"  border="1">
		<tr align="center">
			<td width="30%">- 제 목 -</td> 
			<td width="60%">- 내 용 -</td>
			<td width="10%">- 작성자 -</td> 
		</tr>
		<tr align="center">
			<td width="10%">${board.title }</td> 
			<td width="10%">${board.content }</td>
			<td width="10%">${board.id }</td> 
		</tr>
		<c:if test="${ loginUser == board.id }">
			<tr>
				<td colspan="4" align="right">
				<button type="button" 
					onclick="location.href='${contextPath}/board/board_modify.jsp?id=${board.title }'">수정</button>
				<button type="button" 
					onclick="location.href='${contextPath}/board/board_delete.jsp?id=${board.title }'">삭제</button>
				</td>
			</tr>
		</c:if>
	</table>
</div>
<c:import url="../default/footer.jsp"/>
</body>
</html>