<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>열람실 이용안내</title>
    <link href="resources/readingCss/reading_notice.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="container">
		<div class="main-title">
			<h1>열람실 안내</h1>
		</div>
		<br>
		<div class="single-title">
			<h3><span>대</span>상</h3>
			<ul>
				<li>회원가입을 한 지역 주민 및 현장 접수</li>
				<li>현장 접수는 지역 주민 외에도 이용 가능 ※신분증 필요</li>
			</ul>
		</div>
		<br>
		<div class="single-title">
			<h3><span>이</span>용안내 : 09:00 ~ 19:00 총 90석</h3>
			<ul>
				<li>입장은 오전 9시부터 가능</li>
				<li>점심시간(12:00 ~ 13:00)은 방역 및 소독 실시(시설 이용 불가) 전원 퇴실 후 재입장</li>
				<li>법정공휴일 및 매주 월요일 휴관</li>
				<li>사전비품대여 신청자는 좌석 이용전 메인에서 보증금 제출하고 수령</li>
			</ul>
		</div>
		<br>
		<div class="single-title">
			<h3><span>이</span>용방법</h3>
			<ul>
				<li>예약시간 : 09:00 ~ 23:00 (이용일 일주일 전부터 예약가능 당일예약은 현장 접수만)</li>
				<li>홈페이지 예약 미달인 경우 당일 현장 접수 후 이용가능</li>
				<li>※ 가족 및 타인의 계정으로 신청한 좌석이거나, 신청 외의 좌석 이용 적발시 즉시 퇴실 + 1주일 열람실 이용 제한</li>
			</ul>
		</div>
		<br>
		<div class="single-title">
			<h3><span>이</span>용수칙</h3>
			<ul>
				<li>지정좌석에서 마스크 상시 착용</li>
				<li>점심시간(12:00 ~ 13:00)에 소독을 위한 전원 퇴실 (귀중품 개인 소지 필수)</li>
				<li>방역지침으로 인한 휴게실 사용 불가 및 거리두기</li>
				<li>조기 퇴실시 다음 이용자를 위해 메인이나 퇴실장치에 찍고 퇴실</li>
				<li>비품 대여자는 비품반납 후 보증금 수령</li>
			</ul>
		</div>
		<br><br>
		<div class="readingList-form">
			<form action="/readingList.do">
				<fieldset>
					<input type="hidden" id="memberId" value="${sessionScope.m.memberId }" readonly>
					<input type="submit" class="btn btn-success btn-lg" value="열람실 예약하기" style="background-color: #563D39; border-color: #563D39">
				</fieldset>
			</form>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>