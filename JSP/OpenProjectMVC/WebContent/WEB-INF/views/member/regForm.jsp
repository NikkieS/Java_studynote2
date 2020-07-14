<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="<%= request.getContextPath() %>/css/default.css" type="text/css">

<style>
</style>
</head>
<body>
	<!-- header module화 -->
	<%@ include file="/WEB-INF/views/include/header.jsp" %>
	
	<div>
		<h1 id=header>회원 가입</h1>
		<hr>
		<form action="login.jsp" method="post">
			<table>
				<tr>
					<td>아이디(email)</td>
					<td><input type="email" name="uid"></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="upw"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="uname"></td>
				</tr>
				<tr>
					<td>사진</td>
					<td><input type="file" name="uphoto"></td>
				</tr>
				<tr>
					<td></td>
					<td>
						<input type="submit" value="회원가입">
						<input type="reset" value="초기화">
					</td>
				</tr>
			</table>
		</form>
	</div>
	
	<!-- footer module화 -->
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>