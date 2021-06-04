<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:import url="../default/header.jsp" />
	
	<div style="height: 750px; display: flex;">
		<div
			style="border: 1px solid black; width: 15%; margin-left: 30px; margin-top: 30px; margin-right: 30px; padding-left: 20px; height: 280px;">
			<table>
				<tr>
					<th>로그인정보</th>
					<td rowspan="4"><img class="navbar-brand rounded-circle"
						src="resources/img/nan.png" width=100px; height=100px;></td>
				</tr>
				<tr>
					<th style="padding-top: 30px;">이름</th>
				</tr>
				<tr>
					<th style="padding-top: 30px;">학생</th>
				</tr>
				<tr>
					<th style="padding-top: 30px; padding-bottom: 25px;">전공</th>
				</tr>
				<tr>
					<th style="padding-right: 20px;"><button type="button"
							class="btn btn-secondary" onclick="location.href='<%=request.getContextPath()%>/logout'">로그아웃</button></th>
					<th><button type="button" class="btn btn-secondary" onclick="location.href='<%=request.getContextPath()%>/modifyInfo'">정보수정</button></th>
				</tr>
			</table>
		</div>
</body>
</html>