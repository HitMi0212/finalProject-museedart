<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link href="resources/spaceCss/space_default.css" rel="stylesheet">
    <link href="resources/spaceCss/space_main.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="container">
		<h4 class="s-title">대관 안내</h4>
		<div class="space-img">
			<img src="resources/spaceImage/연습실1.png">
			<p>
				무지다 문화센터에는 연습실, 다목적실, 강의실, 세미나실 총 4개의 공간이 있습니다.<br>
				비영리 모임, 생활문화동아리와 문화인, 그리고 지역의 예술가들을 위해 제공합니다.<br>
				공간 특성에 따라 사용할 수 있는 용도가 다르며, 실별 용도와 보유물품 리스트는 아래 상세내용에서 확인하실 수 있습니다.<br>
				쾌적한 공간 사용을 위해, 실별 적정인원 확인을 추천드리고, 사용 후에는 사용 후 게시판에 게시물을 작성하여야 합니다. <br>
			</p>
		</div>
		<div class="rental-sequence">
			<h4 class="s-title">대관 절차</h4>
			<img src="resources/spaceImage/대관절차.png">
		</div>
		<div class="rental-price">
			<h4 class="s-title">대관료 안내</h4>
			<div class="spaceRes"><a href="/spaceRes.do">>신청하기</a></div>
			<div>
				<c:forEach items="${list }" var ="s">
					<table   id="s-table">
					<c:forEach items="${fList }" var="f">
						<tr>
							<th rowspan="5" >
								<c:if test="${s.spaceNo } eq ${f.spaceNo }">
									<img style='width: 300px' class="info-img" src="resources/spaceImage/upload/${f.filename }">
								</c:if>
							</th>
						</tr>
					</c:forEach>
					<tr>
						<td>이름</td>
						<td>${s.spaceName }</td>
					</tr>
					<tr>
						<td>용도</td>
						<td>${s.spacePurpose }</td>
					</tr>
					<tr>
						<td>수용인원</td>
						<td>${s.maxPeople } 명</td>
					</tr>
					<tr>
						<td>가격</td>
						<td>${s.price } / 2시간</td>
					</tr>
				</table>
				</c:forEach>
				
			</div>
		</div>
		<button class="btn btn-default" id="rentalBtn" onclick="location.href='/rentalSpace.do'">대관 신청하기</button>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>