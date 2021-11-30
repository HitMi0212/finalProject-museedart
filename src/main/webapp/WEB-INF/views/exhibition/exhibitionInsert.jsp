<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<link href="resources/hansolCss/hansol_default.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
	<div class="container">
		  <h2>전시 등록하기</h2>
  <form action="/action_page.php">
    <div class="form-group">
      <h3><span class="line">전</span>시제목</h3>
      <input type="text" class="form-control" id="exhibitionTitle" placeholder="전시 제목을 입력해주세요" name="exhibitionTitle">
    </div>
     <div class="form-group">
        <h3><span class="line">전</span>시 대표사진</h3>
        <input type="file"  id="resumefile"  name="resumefile">
      </div>
    <h3><span class="line">전</span>시 기간</h3>
    <div class="form-group col-sm-6">
      <h4>시작일</h4>
      <input type="date" class="form-control" id="startDate" name="startDate">
    </div>
    <div class="form-group col-sm-6">
      <h4>종료일</h3>
      <input type="date" class="form-control" id="endDate" name="endDate">
    </div>
    <h3><span class="line">관</span>람 연령</h3>
     <div class="checkbox">
      		<label><input type="radio" name="all"> 전체 관람</label><label><input type="radio" name="children">12세 이상</label><label><input type="radio" name="student">15세 이상</label><label><input type="radio" name="adult">19세 이상</label>
    	</div>
       <h3><span class="line">전</span>시 시간</h3>
    <div class="form-group col-sm-6">
      <h4>시작시간</h4>
      <input type="time" class="form-control" id="startTime" name="startTime">
    </div>
    <div class="form-group col-sm-6">
      <h4>종료일</h4>
      <input type="time" class="form-control" id="endTime" name="endTime">
    </div>
    <div class="form-group">
      <h3><span class="line">가</span>격</h3>
      <input type="text" class="form-control" id="exhibitionPrice" placeholder="가격을 입력해주세요" name="exhibitionPrice">
    </div>
    <div class="form-group">
      <h3><span class="line">상</span>세설명</h3>
     <textarea id="summernote" class="form-control" name="exhibitionDetail"></textarea>
    </div>
       <input type="submit" class="btn btn-info" style="float:right" value="등록하기">
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
</script>
</html>