<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#title{
	padding-top:30px;
	padding-left:30px;
	font-weight:700;
	font-size: 40px;
	padding-bottom: 30px;
	}
	#table{
	margin-left: 50px;
	margin-right: 50px;
	text-align: center;
	}
	#table>div:first-child{
	margin: 30px;
	}
	#search{
		padding-right:20px;
		padding-bottom:20px;
		float: right;
	}
	#write{
		float: left;
	}
	#my{
		float: right;
	}
	#page{
	text-align: center;
	}
	
	#firtr>td:nth-child(1){
	width: 80px;
	}
	#firtr>td:nth-child(3){
	width: 100px;
	}
	#firtr>td:nth-child(4){
	width: 150px;
	}
	#firtr>td:nth-child(5){
	width: 80px;
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="container" id="container">
		<p id="title">FAQ</p>
		<div>챗봇자리</div>
		<p id="title">질문과 답변</p>
		<div id="table">
			<div>
				<form action="/searchKeyword.do?boardType=2&reqPage=1" method="post">
				 	<select name="type">
				 		<option value="tac">제목+내용</option>
				 		<option value="writer">작성자</option>
				 	</select>
				 	<input type="text" id="keyword" name="keyword">
				 	<input type="submit" id="submit" value="검색">
				</form>
			</div>
			<table class="table">
				<tr id="firtr">
					<td>번호</td><td>제목</td><td>작성자</td><td>작성일</td><td>답변상태</td>
				</tr>
				<c:forEach	items="${list }" var="b" varStatus="i">
				<tr>
					<td>${b.bnum }</td>
					<td><a href="/boardView.do?boardType=2&boardNo=${b.boardNo}">${b.boardTitle }</a></td>
					<td>${b.boardWriter }</td>
					<td>${b.regDate }</td>
					<c:choose>
						<c:when test="${b.commentCount ne 0}">
						<td>답변완료</td>
						</c:when>
						<c:otherwise>
						<td>미답변</td>
						</c:otherwise>
					</c:choose>
				</tr>
				</c:forEach>
			</table>
		</div>
		<div id="page">
			<div id="pageNavi">${pageNavi }</div>
		</div>
		<c:if test="${not empty sessionScope.m }">
			<div id="table">
				<a class="btn" id="write" href="/boardWriteFrm.do?boardType=2">글작성</a>
				<a class="btn" id="my" href="#">내문의보기</a>
			</div>	
		</c:if>
	</div>
	<script type="text/javascript">
	$("#submit").click(function(){
		var keyword = $("#keyword").val();
		if(keyword == ""){
			alert("검색어를 입력하세요.");
			return false;
		}
	});
	</script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>