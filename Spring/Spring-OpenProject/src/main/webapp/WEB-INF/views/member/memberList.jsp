<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Open Project</title>

<link rel="stylesheet" href="<c:url value="/css/default.css" />">

</head>
<body>
	<%@ include file="/WEB-INF/views/include/header.jsp" %>
	
	<div>
		<h1 class="header">회원 목록</h1>
		<hr>
		
		<c:if test="${! empty listView}">
		<div>전체회원 ${listView.memberTotalCount}명</div>
		<hr>
		
		<table class="table">
			<tr>
				<th>No.</th>
				<th>아이디</th>
				<th>비밀번호</th>
				<th>이름</th>
				<th>첨부파일</th>
				<th>관리</th>
			</tr>
			
		<c:if test="${not empty listView.memberList}">
		<c:forEach items="${listView.memberList}" var="member">
			<tr>
				<td>${member.idx}</td>
				<td>${member.uid}</td>
				<td>${member.upw}</td>
				<td>${member.uname}</td>
				<td><img alt="img" src="${imagePath}/${member.uphoto}"></td>
				<td><a href="memberEdit?idx=${member.idx}">수정</a> | <a href="javascript:memberDel(${member.idx})">삭제</a></td>
			</tr>
		</c:forEach>
		</c:if>
		
		<c:if test="${empty listView}">
			<tr>
				<th colspan="6">조회된 회원이 없습니다.</th>
			</tr>
		</c:if>
		</table>
		
		<div class="paging">
			<c:forEach begin="1" end="${listView.pageTotalCount}" var="i">
				<a class="paging_num ${i == listView.currentPageNumber? 'now_page':'' }" href="memberList?page=${i}">${i}</a>
			</c:forEach>
		</div>
		
		</c:if>
	</div>
	
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>
<script>
	function memberDel(idx){
		if(confirm('선택하신 회원 정보를 삭제하시겠습니까?')){
			location.href="memberDelete?idx="+idx;
		}
	}
</script>