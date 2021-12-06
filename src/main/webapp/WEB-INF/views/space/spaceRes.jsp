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
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>	
	<script type="text/javascript" src="/resources/jquery-ui/jquery-ui.min.js"></script>
	<link rel="stylesheet" href="/resources/jquery-ui/jquery-ui-big.css">
    <link href="resources/spaceCss/space_default.css" rel="stylesheet">	
    <link href="resources/spaceCss/space_res.css" rel="stylesheet">	
	<div class="container">
			<h3>신청 현황-${s.spaceName } </h3>
		<form action="/spaceInfo.do" method="post">
			<input type="hidden" value="${s.spaceNo  }" name="spaceNo">
			<div class="select-btn">
				<c:forEach items="${list }" var= "l">
					<button type="button" onclick="location.href='/spaceRes.do?spaceNo=${l.spaceNo}'">${l.spaceName }</button>
				</c:forEach>
			</div>
		<!-- 캘린더 코드 -->
		<div id="datepicker"></div>
		<div class="time-table">
			<table class="table table-hover">
						<c:forEach items="${st }" var ="st">
							<tr>
								<td>이용시간<input type="hidden" value="${st.stNo }"></td>
								<td><input type="text" value="${st.startTime }" ></td>
								<td>~</td>
								<td><input type="text" value="${st.endTime }"></td>
								<td><button type="button" class="checkBtn">선택</button></td>
							</tr>
					</c:forEach>
					<tr>
						<td >선택한날짜</td>
						<td colspan="4"><input type="text" id="selectDate" name="rentalDate"></td>
					</tr>
					<tr>
						<td>선택시간</td>
						<td><input type="text" name="startTime"></td>
						<td>~</td>
						<td><input type="text" name="endTime"></td>
					</tr>	
			</table>
			<input type="hidden" name="stNo">
		</div>
			<div id="insert-btn">
				<c:choose>
					<c:when test="${empty sessionScope.m }">
						<button class="btn btn-default" type="button"  onclick="location.href='/loginFrm.do'">로그인 후 예약하기</button>
					</c:when>
					<c:otherwise>
						<button class="btn btn-default" type="submit">신청하기</button>
					</c:otherwise>				
				</c:choose>
			</div>
		</form>
	</div>
		<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    <script>
   		$(function () {
			 $(".time-table").hide();
		});
	    $(function() {
	        var today = new Date(); //오늘부터
	        var endDate = new Date(today);
	        endDate.setDate(endDate.getDate()+30); //+30일까지만 예약받음
	        $("#datepicker").datepicker({
	        	//캘린더 기본베이스
	            dateFormat: "yy-mm-dd",
	            monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월','9월', '10월', '11월', '12월' ],
	            monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월','9월', '10월', '11월', '12월' ],
	            dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
	            dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
	            dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
	            yearSuffix : '년',
	            minDate: today,
	            maxDate: endDate,
	            beforeShowDay: noMondays, //월요일은 휴무일
	            onSelect : function(data){
	            	$("#selectDate").val(data);
	            	$(".time-table").show();
	            }
	        });
	    });
	   	//월요일 휴무 코드
	    function noMondays(date) {
	    	return [date.getDay() != 1, ''];
	    }
		$(".checkBtn").click(function(){ 
           var str = ""
           var tdArr = new Array();    // 배열 선언
           var checkBtn = $(this);
           var tr = checkBtn.parent().parent();
           var td = tr.children();
           
           var startTime = td.eq(1).find('input').val();
           var endTime = td.eq(3).find('input').val();
           var stNo = td.eq(0).find('input').val();
           
           // 반복문을 이용해서 배열에 값을 담아 사용할 수 도 있다.
           td.each(function(i){    
               tdArr.push(td.eq(i).text());
           });
           
           $("[name=startTime]").val(startTime);
           $("[name=endTime]").val(endTime);
           $("[name=stNo]").val(stNo);
       });
    </script>
</body>
</html>