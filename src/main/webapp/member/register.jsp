<%@page import="com.care.root.member.dao.MemberDAO"%>
<%@page import="com.care.root.member.dto.MemberDTO"%>
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

<c:import url="../default/header.jsp"/>

<jsp:useBean id="dto" class="com.care.root.member.dto.MemberDTO"/>
<jsp:useBean id="dao" class="com.care.root.member.dao.MemberDAO"/>
<jsp:setProperty property="*" name="dto"/>
<c:set var="result" value="${dao.register(dto) }"/>
<c:choose>
	<c:when test="${result == 1 }">
		<script type="text/javascript">
			alert('회원가입을 축하합니다~~');
			location.href='${contextPath}/member/membership.jsp'
		</script>
	</c:when>
	<c:otherwise>
		<script type="text/javascript">
			alert('문제가 생겼습니다');
			location.href='${contextPath}/member/member_register.jsp'
		</script>
	</c:otherwise>
</c:choose>
<c:import url="../default/footer.jsp"/>

</body>
</html>






