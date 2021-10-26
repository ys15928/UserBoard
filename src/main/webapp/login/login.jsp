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

<div class="wrap content">
	<table class="mainTable" width="100%" >
		<c:choose>
			<c:when test="${ loginUser == null }">
				<tr>
					<td align="left">
						<h1>로그인 페이지 입니다</h1>
					</td>
				</tr>
				<tr height=40px></tr>
				<tr>
					<form action="chkUser.jsp" method="post">	
						<td width="40%"></td>
						<td width="20%"></td>
						<td width="140px" align="left">
							<div align="right">
								<input type="text" style="width: 100%; height: 25px" placeholder="아이디" name="id"><br>
								<input type="password" style="width: 100%; height: 25px" placeholder="비밀번호" name="pwd">
							</div>
							<div align="left">
								<a href = "${contextPath}/member/member_register.jsp">회원가입</a>
							</div>	
						</td>
						<td width="3px"></td>
						<td width="100px" valign="top">
							<input type="submit" style=" height: 60px;" value="로그인">
						</td>
					</form>
				</tr>
			</c:when>
			<c:otherwise>
				<div align="center">
					<h1>${ loginUser }로 로그인된 상태입니다.<br></h1>
				</div>
			</c:otherwise>
		</c:choose>
	</table>
</div>

<c:import url="../default/footer.jsp"/>
</body>
</html>