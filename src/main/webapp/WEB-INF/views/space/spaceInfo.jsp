<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link href="resources/spaceCss/space_default.css" rel="stylesheet">
    <link href="resources/spaceCss/space_info.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="container">
		<form action="/spaceRental.do" method="post">
			<input type="hidden" value="${s.spaceNo }" name="spaceNo">
			<input type="hidden" value="${st.stNo }" name="stNo">
			<h3>${s.spaceName }예약하기</h3>
				<div class="space-img">
				  <div id="myCarousel" class="carousel slide" data-ride="carousel">
				    <!-- Indicators -->
				    <ol class="carousel-indicators">
				      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				      <li data-target="#myCarousel" data-slide-to="1"></li>
				      <li data-target="#myCarousel" data-slide-to="2"></li>
				    </ol>
				
				    <!-- Wrapper for slides -->
				    <div class="carousel-inner">
				      <div class="item active">
							<img class="info-img" src="resources/spaceImage/upload/${fv[0].filename }">
				      </div>
				      <div class="item">
							<img class="info-img" src="resources/spaceImage/upload/${fv[1].filename }">
				      </div>
				      <div class="item">
							<img class="info-img" src="resources/spaceImage/upload/${fv[2].filename }">
				      </div>
				    </div>
				
				    <!-- Left and right controls -->
				    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
				      <span class="glyphicon glyphicon-chevron-left"></span>
				      <span class="sr-only">Previous</span>
				    </a>
				    <a class="right carousel-control" href="#myCarousel" data-slide="next">
				      <span class="glyphicon glyphicon-chevron-right"></span>
				      <span class="sr-only">Next</span>
				    </a>
				  </div>
		
				</div>	
				<div class="space-info">
					<table class="table table-bordered" >
						<tr>
							<td colspan="2">${s.spaceName }</td>
						</tr>
						<tr>
							<th>용도</th>
							<td>${s.spacePurpose }</td>
						</tr>
						<tr>
							<th>주요시설</th>
							<td>${s.mainFacility }</td>
						</tr>
						<tr>
							<th>주요물품</th>
							<td>${s.mainProduct }</td>
						</tr>
						<tr>
							<th>수용인원</th>
							<td>${s.maxPeople } 명</td>
						</tr>
						<tr>
							<th>가격</th>
							<td>${s.price } / 2시간</td>
						</tr>
					</table>
					<p>  ※ 대관으로 인한 직접적인 수익이 발생하는 경우, 대관이 불가합니다.<br> 규정에 따라 대관이 취소될 수 있습니다.</p>
					<p>  ※ 회원가입 및 로그인 후, 대관신청이 가능합니다.</p>
				</div>
				<div class="rental-info">
					<table class="table">
						<tr>
							<td>아이디</td>
							<td><input type="text" disabled="disabled" value="${sessionScope.m.memberId }" ></td>
						</tr>
						<tr>
							<td>선택 날짜</td>
							<td><input type="text" value="${rentalDate }" name="rentalDate" disabled="disabled"></td>
						</tr>
						<tr>
							<td>시간</td>
							<td><input type="text" disabled="disabled" value="${st.startTime }~${st.endTime}" ></td>
						</tr>
						<tr>
							<td>사용인원</td>
							<td>
								<select name="rentalPeople">
									<c:forEach begin="1" end="${s.maxPeople }" varStatus="i">
										<option>${i.count }</option>
									</c:forEach>
								</select>
							</td>
						</tr>
					</table>
					<input type="hidden" value="${st.startTime }" name="startTime"> 
					<input type="hidden" value="${st.endTime }" name="endTime">
					<input type="hidden" value="${sessionScope.m.memberId }" name="memberId">
					<input type="hidden" value="${rentalDate }" name="rentalDate">
					<div class="btn-box">
						<button class="insert-btn" type="submit">신청하기</button>
					</div>
				</div>
			<div class="big-img">
				<c:forEach items="${fv }" var="fv">
					<img class="info-img" src="resources/spaceImage/upload/${fv.filename }">
				</c:forEach>
			</div>
		</form>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<script>
	</script>
</body>
</html>