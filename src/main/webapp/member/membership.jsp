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
	<jsp:useBean id="dao" class="com.care.root.member.dao.MemberDAO"/>
	<c:set var="list" value="${ dao.getMemberList() }" />

	<table width="80%" border="1">
		<tr>
			<th width="15%">아이디</th> 
			<th width="15%">비밀번호</th> 
			<th width="20%">이름</th> 
			<th width="30%">주소</th>
		</tr>
		<c:forEach var="member" items="${list }">
		<tr>
			<td>${member.id }</td> 
			<td>${member.pwd }</td>
			<td>
				<a href="${contextPath}/member/member_info.jsp?id=${member.id }">${member.name }</a>
			</td> 
			<td>${member.addr }</td>
		</tr>
		</c:forEach>
	</table>
</div>
	<c:import url="../default/footer.jsp"/>
</body>
</html>
