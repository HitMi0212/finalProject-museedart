<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<link href="resources/hansolCss/hansol_default.css" rel="stylesheet">
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script><!-- 달력 선언 -->
	<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
	<div class="container">
    <h2>공고 등록하기</h2>
    <form action="/requritInsert.do" method="post">
      <div class="form-group">
        <h3><span class="line">공</span>고명</h3>
        <input type="text" class="form-control" id="requritTitle" placeholder="공고명을 입력해주세요" name="requritTitle">
      </div>
      <h3><span class="line">공</span>고 기간</h3>
      <div class="form-group col-sm-6">
        <h4>시작일</h4>
        <input type="text" class="form-control" id="datepicker" name="requritStart">
      </div>
      <div class="form-group col-sm-6">
        <h4>종료일</h4>
        <input type="text" class="form-control" id="datepicker2" name="requritEnd">
      </div>
      <div class="form-group">
        <h3><span class="line">경</span>력 사항</h3>
        <input type="text" class="form-control" id="resumecareer" placeholder="경력사항을 입력해주세요" name="requritCareer">
      </div>
      <h3><span class="line">성</span>별</h3>
       <div class="radio">
                <label class="radio-inline"><input type="radio" name="requritGender" value="남자">남자</label>
                <label class="radio-inline"><input type="radio" name="requritGender" value="여자">여자</label>
          </div>
         <div class="form-group">
          <h3>직종</h3>
          <input type="text" class="form-control" id="requritField" placeholder="직종을 입력해주세요" name="requritField">
        </div>
        <h3><span class="line">고</span>용형태</h3>
       <div class="radio">
                <label class="radio-inline"><input type="radio" name="employeeType" value="정규직">정규직</label>
                <label class="radio-inline"><input type="radio" name="employeeType" value="계약직">계약직</label>
       </div>
      <div>
        <h3><span class="line">상</span>세 설명</h3>
       <textarea id="summernote" class="form-control" name="requritDetail"></textarea>
      </div><br>
      <input type="submit" class="btn btn-info" style="float:right" value="공고 등록하기">
    </form>
  </div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
<script>
$('#summernote').summernote({
	  height: 300,                 // set editor height
	  minHeight: null,             // set minimum height of editor
	  maxHeight: null,             // set maximum height of editor
	  focus: true                  // set focus to editable area after initializing summernote
	});
$(document).ready(function() {
	  $('#summernote').summernote();
	});
$(function() {
	
    var date = new Date();
    $( "#datepicker" ).datepicker({
        dateFormat: "yy-mm-dd",
        monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월','9월', '10월', '11월', '12월' ],
        monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월','9월', '10월', '11월', '12월' ],
        dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
        dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
        dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
        yearSuffix : '년',
        minDate: date
    });
    $( "#datepicker2" ).datepicker({
        dateFormat: "yy-mm-dd",
        monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월','9월', '10월', '11월', '12월' ],
        monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월','9월', '10월', '11월', '12월' ],
        dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
        dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
        dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
        yearSuffix : '년',
        minDate: date
    });
    
});	
</script>
</html>