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
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<h1>자유</h1>
	<table border="1">
		<tr>
			<th>글번호</th>
			<td>${b.boardNo }</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${b.boardTitle }</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${b.boardWriter }</td>
		</tr>
		<tr>
			<th>작성일</th>
			<td>${b.regDate }</td>
		</tr>
		<tr>
			<th>조회수</th>
			<td>${b.readCount }</td>
		</tr>
		<tr>
			<th>첨부파일</th>
			<td>
				<c:forEach items="${b.list }" var="f">
					<a href="/boardFileDownload?fileNo=${f.fileNo }">${f.filename }</a><br>
				</c:forEach>
			</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>${b.boardContent }</td>
		</tr>
	</table>
	<button><a href="/boardDelete.do?boardNo=${b.boardNo }">글삭제</a></button>
	<button><a href="/boardUpdate.do?boardNo=${b.boardNo }">글수정</a></button>
	<a href="/">메인으로</a>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>