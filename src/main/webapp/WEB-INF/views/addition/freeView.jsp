<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/4054b6ceaa.js" crossorigin="anonymous"></script>
<style type="text/css">
	#title{
	width:205px;
	border-top: 7px solid #563D39;
	margin-top:70px;
	margin-left:70px;
	font-weight:700;
	font-size: 40px;
	margin-bottom: 50px;
	}
	#table{
	margin-left: 50px;
	margin-right: 50px;
	text-align: left;
	}
	#table>a:first-child {
	float: left;
	}
	#table>a:nth-child(2) {
	float: left;
	}
	#table>a:nth-child(3) {
	float: left;
	}
	.inputCommentBox ul{
	list-style-type: none;
	padding : 0;
	display: flex;
	}
	.inputCommentBox textarea[name=commentContent]{
		height:100%;
		resize: none;
	}
	.inputCommentBox ul>li:first-child,.inputCommentBox ul>li:last-child {
		width:15%;
		text-align: center;
		display: flex;	
		justify-content: center;
		align-items: center;
	}
	.inputCommentBox ul>li:nth-child(2) {
		width:70%;
	}
	.comments,.recomments{
		list-style-type: none;
		padding : 0;
		display: flex;
		background-color: #f2f2f2;
	}
	.comments>li>p,.recomments>li>p{
		margin: 0;
	}
	.comments>li:first-child{
		display: flex;
		flex-flow:column;
		justify-content: flex-start;
		align-items: center;
		width:15%;
		padding : 5px 0px 5px 0px;
	}
	
	.comments>li:last-child{
		padding : 5px 0px 5px 0px;
		width : 85%;
		display:flex;
		flex-flow:column;
		justify-content: space-between;	
		
	}
	.commentsBtn{	
		text-align: right;	
	}
	.recoment{
		display: none;	
		justify-content: space-around;
	}
	.recoment>textarea{
		width: 85%;
		resize: none;
	}
	textarea.form-control{
		height:100%;
		resize:none;
	}
	.recoment>div{
		width:10%;
	}
	.recomments>li:first-child{
		display: flex;	
		justify-content: center;
		align-items: center;
		width:15%;
		padding : 5px 0px 5px 0px;
	}
	.recomments>li:nth-child(2){
		display: flex;
		flex-flow:column;	
		justify-content: center;
		align-items: center;
		width:10%;
		padding : 5px 0px 5px 0px;
	}
	.recomments>li:last-child{
		padding : 5px 0px 5px 0px;
		width : 75%;
		display:flex;
		flex-flow:column;
		justify-content: space-between;	
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="container" id="container">
		<div id="title">소통게시판</div>
		<input id="loginId" type="hidden" value="${sessionScope.m.memberId }">
		<div id="table">
		<div>
			<div>다음글&nbsp;
				<a href="/boardView.do?boardType=3&boardNo=${info.nextNo}" onclick="return chkNext();">
				<input type="hidden" id="next" value="${info.nextNo }">${info.nextTitle }
				</a>
			</div>
			<div>이전글&nbsp;
				<a href="/boardView.do?boardType=3&boardNo=${info.prevNo}" onclick="return chkPrev();">
				<input type="hidden" id="prev" value="${info.prevNo }">${info.prevTitle }
				</a>
			</div>
			<a class="btn" href="/additionBoard.do?boardType=3&reqPage=1">글목록</a>
			<c:if test="${sessionScope.m.memberLevel eq 0 }">
			<c:choose>
				<c:when test="${b.boardLevel eq 2 }">
				<a class="btn" href="/removeRegulationBoard.do?boardNo=${b.boardNo }">규제풀기</a>
				</c:when>
				<c:otherwise>
				<a class="btn" href="/regulationBoard.do?boardNo=${b.boardNo }">규제하기</a>
				</c:otherwise>
			</c:choose>
			</c:if>
		</div>
			<table class="table">
				<tr>
					<td colspan="7">${b.boardTitle }(제목자리)</td>
				</tr>
				<tr>
					<td>${b.boardWriter }</td>
					<td>조회수</td>
					<td>${b.readCount }</td>
					<td>작성일</td>
					<td>${b.regDate }</td>
					<td>댓글수</td>
					<td>${b.commentCount }</td>
				</tr>
				<tr>
					<td>첨부파일</td>
					<td colspan="6">
						<c:forEach items="${b.list }" var="f">
							<a href="/fileDown.do?filename=${f.filename }&filepath=${f.filepath }">${f.filename }</a>
						</c:forEach>
					</td>
				</tr>
				<tr>
					<td colspan="7">${b.boardContent }(내용자리)</td>
				</tr>
			</table>
			
			<!-- 댓글쓰기창 로그인 되있을때 -->
			
				<div class="inputCommentBox">
					<form action="/insertComment.do?boardType=3" method="post">
						<ul>
							<li>
								<i class="far fa-user fa-5x"></i>
							</li>
							<li>
								<input type="hidden" name="bcLevel" value="1">
								<input type="hidden" name="bcWriter" value="${sessionScope.m.memberId }">
								<input type="hidden" name="boardRef" value="${b.boardNo }">
								<input type="hidden" name="bcRef" value="">
								<input type="hidden" name="bcidRef" value="">
								<textarea id="comment" name="bcContent" class="form-control"></textarea>
							</li>
							<li>
								<button type="submit" class="btn btn-primary btn-lg btn-block" onclick="return commentChk();">등록</button>
							</li>
						</ul>
					</form>
				</div>

			
			<!-- 댓글출력 -->
			<div class="commentBox">
				<c:forEach items="${list }" var="bc">
					<!-- ncLevel ==1 일반댓글인 경우 -->
					<c:if test="${bc.bcLevel eq 1 }">
						<ul class="comments">
							<li>
								<p>${bc.bcWriter }</p>
								<p>${bc.regDate }</p>
							</li>
							<li>
								<p>${bc.bcContentBr }</p>
								<textarea name="bcContent" class="form-control" style="display:none;">${bc.bcContentBr }</textarea><!-- 수정시보임 -->
								<p class="commentsBtn">
									<c:if test="${sessionScope.m.memberId eq bc.bcWriter }">
										<a href="javascript:void(0)"  onclick="modifyComment(this,'${bc.bcNo }','${b.boardNo }');">수정</a>
										<a href="javascript:void(0)" onclick="deleteComment(this,'${bc.bcNo }','${b.boardNo }');">삭제</a>
									</c:if>
									<a href="javascript:void(0)" class="recShow">답글달기</a>
								</p>
								<form action="/insertComment.do?boardType=3" class="recoment" method="post"> <!-- recoment 클래스가 안보이게 하는 속성 -->
									<input type="hidden" name="bcLevel" value="2">
									<input type="hidden" name="bcWriter" value="${sessionScope.m.memberId }"> <!--로그인 된 아이디로 변경해야함 -->
									<input type="hidden" name="boardRef" value="${b.boardNo }">
									<input type="hidden" name="bcRef" value="${bc.bcNo }">
									<input type="hidden" name="bcidRef" value=""> 
									<textarea name="bcContent" class="bcContent form-control"></textarea> 
									<div>
										<button type="submit" class="recomment btn btn-outline-primary">등록</button>
										<button type="reset" class="btn btn-outline-primary recCancel">취소</button>
									</div>
								</form>
							</li>
						</ul>
						<!-- 대댓글 시작 -->
						<c:forEach items="${list }" var="bcc">
							<c:if test="${bcc.bcLevel eq 2 && bc.bcNo eq bcc.bcRef }">
								<ul class="recomments">
									<li>
										<i class="fas fa-arrow-right"></i><!-- 화살표 -->
									</li>
									<li>
										<p>${bcc.bcWriter }</p>
										<p>${bcc.regDate }</p>
									</li>
									<li>
										<c:choose>
											<c:when test="${not empty bcc.bcidRef }">
											<p>@${bcc.bcidRef} ${bcc.bcContentBr }</p>
											</c:when>
											<c:otherwise>
											<p>${bcc.bcContentBr }</p>
											</c:otherwise>
										</c:choose>
										<textarea name="bcContent" class="form-control" style="display:none;">${bcc.bcContentBr }</textarea>
										<p class="commentsBtn">
											<c:if test="${sessionScope.m.memberId eq bcc.bcWriter }">
												<a href="javascript:void(0)" onclick="modifyComment(this,'${bcc.bcNo }','${b.boardNo }');">수정</a>
												<a href="javascript:void(0)" onclick="deleteComment(this,'${bcc.bcNo }','${b.boardNo }');">삭제</a>
											</c:if>	
												<a href="javascript:void(0)" class="recShow">답글달기</a>
										</p>
										<form action="/insertComment.do?boardType=3" class="recoment" method="post"> <!-- recoment 클래스가 안보이게 하는 속성 -->
											<input type="hidden" name="bcLevel" value="2">
											<input type="hidden" name="bcWriter" value="${sessionScope.m.memberId }"> <!--로그인 된 아이디로 변경해야함 -->
											<input type="hidden" name="boardRef" value="${b.boardNo }">
											<input type="hidden" name="bcRef" value="${bc.bcNo }">
											<input type="hidden" name="bcidRef" value="${bcc.bcWriter} "> 
											<textarea name="bcContent" class="bcContent form-control"></textarea> 
											<div>
												<button type="submit" class="recomment btn btn-outline-primary">등록</button>
												<button type="reset" class="btn btn-outline-primary recCancel">취소</button>
											</div>
										</form>
									</li>
								</ul>
							</c:if>
						</c:forEach>
					</c:if>
				</c:forEach>
			</div>
			
			
			
			<c:if test="${sessionScope.m.memberId == b.boardWriter}">
			<a class="btn" href="/boardDelete.do?boardType=3&boardNo=${b.boardNo }">글삭제</a>
			<a class="btn" href="/boardUpdate.do?boardNo=${b.boardNo }">글수정</a>
			</c:if>
			<c:if test="${sessionScope.m.memberLevel ==0 }">
			<a class="btn" href="/boardDelete.do?boardType=3&boardNo=${b.boardNo }">글삭제</a>
			</c:if>
			<a class="btn" onclick="history.go(-1);">이전</a>
		</div>
	</div>
	
	<script type="text/javascript">
	$(document).on("click",".recomment",function(){
		var idx=$(".recomment").index(this);
		var bcContent=$(".bcContent").eq(idx).val();
		if(bcContent==""){
			alert("내용을 입력하세요.");
			return false;
		}
    });
	
	
	//답댓글 등록창 켜기
	$(".recShow").click(function(){
		var loginId = $("#loginId").val();
		if(loginId == ""){
			alert("로그인 후 이용하실 수 있습니다.");
			return false;
		}
		//몇번째 답글달기 버튼을 클릭했는지
		var idx=$(".recShow").index(this);
		console.log(idx);
		$(this).hide();
		$(".recoment").eq(idx).css("display","flex");
	});
	
	//답댓글 등록창 끄기
	$(".recCancel").click(function(){
		var idx=$(".recCancel").index(this);
		$(".recoment").eq(idx).css("display","none");
		$(".recShow").eq(idx).show();
	});
	
	//댓글삭제
	function deleteComment(obj,bcNo,boardNo){
		if(confirm("댓글을 삭제하시겠습니까?")){
			location.href="/deleteComment.do?boardType=3&bcNo="+bcNo+"&boardNo="+boardNo;
		}
	}
	
	//댓글수정창띄움
	function modifyComment(obj,bcNo,boardNo){
		//textarea를 화면에 표현
		$(obj).parent().prev().show();
		//기존본문 내용 숨김
		$(obj).parent().prev().prev().hide();
		//수정>수정완료
		$(obj).html('수정완료');
		$(obj).attr("onclick","modifyComplete(this,'"+bcNo+"','"+boardNo+"');");
		//삭제 > 취소
		$(obj).next().html('취소');
		$(obj).next().attr("onclick","modifyCancel(this,'"+bcNo+"','"+boardNo+"');");
		//답글달기버튼 숨기기
		$(obj).next().next().hide();
		
	}
	
	//수정취소
	function modifyCancel(obj,bcNo,boardNo){
		//textarea숨김
		$(obj).parent().prev().hide();
		//기존 본문내용을 화면에 다시 표현
		$(obj).parent().prev().prev().show();
		//수정완료 > 수정
		$(obj).prev().html("수정");
		$(obj).prev().attr("onclick","modifyComment(this,'"+bcNo+"','"+boardNo+"');");
		//취소 >삭제
		$(obj).html("삭제");
		$(obj).attr("onclick","deleteComment(this,'"+bcNo+"','"+boardNo+"');");
		//답글달기 버튼 화면에 표현
		$(obj).next().show();
	}
	
	//수정제출
	function modifyComplete(obj,bcNo,boardNo){ /* 자바스크립트이용 */
			var content=$(obj).parent().prev().val();
			if(content==""){
				alert("내용을 입력하세요.");
				return false;
			}
			//새로운 form생성
			var form =$("<form action='/updateComment.do?boardType=3' method='post'></form>");
			//폼안에 수정댓글번호 설정
			form.append($("<input type='text' name='bcNo' value='"+bcNo+"'>"));
			//폼안에 공지사항번호설정
			form.append($("<input type='text' name='boardNo' value='"+boardNo+"'>"));
			//수정한 댓글내용 설정 텍스트에리아 추가
			form.append($(obj).parent().prev());
			//전송할 폼태그 현재페이지(바디태그)에 추가
			$("body").append(form);
			//폼태그 전송
			form.submit();
		} 
	
	function commentChk(){
		var loginId = $("#loginId").val();
		var comment = $("#comment").val();
		if(loginId == ""){
			alert("로그인 후 이용하실 수 있습니다.");
			return false;
		}
		if(comment == ""){
			alert("내용을 입력하세요.");
			return false;
		}
	}
	
	function chkPrev(){
		var prev = $("#prev").val();
		if(prev==0){
			return false;
		}
	}
	function chkNext(){
		var next = $("#next").val();
		if(next==0){
			return false;
		}
	}
	
	</script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>