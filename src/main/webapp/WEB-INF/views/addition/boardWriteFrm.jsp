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
	<h1>글쓰기 폼</h1>
	<hr>
	<form action="/boardWrite.do" method="post" enctype="multipart/form-data">
			<input type="text" name="boardType" value="${boardType }">
		제목 : <input type="text" name="boardTitle"><br>
		작성자 : <input type="text" name="boardWriter" value="hy01" readonly><br>
		첨부파일 : <input type="file" name="files" multiple><br>
		내용 : <textarea rows="3" cols="10" name="boardContent"></textarea><br>
		<input type="submit" value="게시글작성">
	</form>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>