<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

	<meta charset="UTF-8">
	<!-- 기본css -->
	<link rel="stylesheet" href="/resources/commonCss/default.css">
	<!-- 부트스트랩 -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
		
	<div class="header-title">
		<div class="h-left">
        <a href="#"><img class="search-img" src="/resources/mainImage/upload/search-droopy.jpg" style="width:18px;height:40px"></a>
        </div> 
        <div class="h-logo">
			Musée d'art
        </div>
		<div class="h-right">
		<c:choose>
	    	<c:when test="${empty sessionScope.m }">
				<a href="/loginFrm.do">Sign in <span>></span></a>
			</c:when>
			<c:when test="${not empty sessionScope.m && sessionScope.m.memberLevel == 0}">
			    <a href="/adminpage.do">My Page[관리] <span>></span></a>
			    <a href="/logout.do">로그아웃</a>
			</c:when>
			<c:when test="${not empty sessionScope.m && sessionScope.m.memberLevel == 1 || sessionScope.m.memberLevel == 2}">
			    <a href="/mypage.do?memberNo=${sessionScope.m.memberNo }">My Page[일반] <span>></span></a>
			    <a href="/logout.do"> 로그아웃</a>
			</c:when>
		</c:choose>
		</div>   
	</div>
	<nav class="header-nav">
           <div class="navi">
               <ul>
                   <li><a href="/showList.do">공연 · 예매</a></li>
                   <li><a href="/spaceMain.do">공간 · 대관</a></li>
                   <li><a href="#">전시</a></li>
                   <li><a href="/readingNotice.do">열람실</a></li>
                   <li>
                       <a href="#">아카데미</a>
                       <ul class="sub">
                           <li><a href="#">수강 신청</a></li>
                           <li><a href="#">강사 모집</a></li>
	                     	<c:choose>
						    	<c:when test="${not empty sessionScope.m && sessionScope.m.memberLevel == 1 }">
									<li><a href="#">수업 관리</a></li>
								</c:when>
								<c:when test="${not empty sessionScope.m && sessionScope.m.memberLevel == 2 }">
								    <li><a href="#">학생 관리</a></li>
								</c:when>
							</c:choose>
                        </ul>
                   </li>
                   <li>
                       <a href="/addition.do">부가서비스</a>
                       <ul class="sub">
                           <li><a href="/additionNotice.do?boardType=1&reqPage=1">공지사항</a></li>
                           <li><a href="/additionFree.do?boardType=3&reqPage=1">소통게시판</a></li>
                           <li><a href="/additionQNA.do?boardType=2&reqPage=1">문의게시판</a></li>
                           <li><a href="/additionGuide.do">시설안내 · 오시는 길</a></li>
                           <li><a href="/discount.do">이벤트</a></li>
                       </ul>
                   </li>
               </ul>
           </div>
	</nav>
