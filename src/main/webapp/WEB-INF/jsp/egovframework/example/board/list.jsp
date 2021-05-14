<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<title>게시판</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="<c:url value='/css/bootstrap/css/bootstrap.min.css'/>">
<script src="<c:url value='/js/jquery-3.3.1.min.js'/>"></script>
<script src="<c:url value='/css/bootstrap/js/bootstrap.min.js'/>"></script>
<script type="text/javaScript" language="javascript" defer="defer">
	$(document).ready(function() {
		<c:if test="${!empty msg}">
			alert("${msg}");
		</c:if>
	});
	
	function add() {
		location.href = "<c:url value='/mgmt.do'/>";
	}
	function view() {
		location.href = "<c:url value='/view.do'/>";
	}
function setPwd(id) {
		if (id == "admin") {
			$('#password').val('admin');
		} else if (id == "11") {
			$('#password').val('11');
		} else if (id == "22") {
			$('#password').val('22');
		} else if (id == "123") {
			$('#password').val('123');
		}
	}
	
	
 function check(){
		//alert('1');
		if( $('#id').val( )== ''){
			alert("아이디입력하세요");
			return false;
		} 
		if( $('#password').val( )== ''){
			alert("비밀번호입력하세요");
			return false;
		} 
		return true;	
	}  
 function out() {
	 location.href = "<c:url value='/logout.do'/>";
	
}
</script>
</head>
<body>

	<div class="container">
		<h1>My First Bootstrap Page</h1>
		<div class="panel panel-default">
			<div class="panel-heading">
				<%-- <h3>${sessionScope.name}님&nbsp;환영합니다~!</h3>  --%>
				<c:if
					test="${sessionScope == null || sessionScope.id == null || sessionScope.id ==''}">
					<form class="form-inline" method="post"
						action="<c:url value='/login.do'/>">
						<div class="form-group">
							<label for="id">아이디:</label> <select class="form-control" id="id"
								name="id" onchange="setPwd(this.value);">
								<option value="">선택하세요</option>
								<option value="admin">관리자</option>
								<option value="11">11</option>
								<option value="22">22</option>
								<option value="123">123</option>
							</select>
						</div>
						<div class="form-group">
							<label for="password">비밀번호:</label> <input type="password"
								class="form-control" id="password" name="password">
						</div>

						<button type="submit" class="btn btn-default"
							onclick="return check()">로그인</button>
					</form>
				</c:if>
				<c:if
					test="${sessionScope != null || sessionScope.id != null || sessionScope.id !=''}">  
		${sessionScope.name}님&nbsp;환영합니다~!			
				<button type="button" class="btn btn-default" onclick="out();">로그아웃</button>
				</c:if>
			</div>
			<div class="panel-body">
				<form class="form-inline" action="/list.do">
					<div class="form-group">
						<label for="searchName">제목(내용)</label> <input type="text"
							class="form-control" id="searchName">
					</div>
					<button type="submit" class="btn btn-default">검색</button>
				</form>
				<div class="table-responsive">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>글번호</th>
								<th>닉네임</th>
								<th>제목</th>
								<th>내용</th>
								<th>등록날짜</th>
								<th>등록자ID</th>
							</tr>
						</thead>
						<tbody>

							<c:forEach var="row" items="${listAll}">

								<tr>
									<td><a href="javascript:view();">${row.num}</a></td>
									<td><a href="javascript:view();">${row.writer}</a></td>
									<td>${row.subject}</td>
									<td>${row.content}</td>
									<td>${row.reg_date}</td>
									<td>${row.id}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<div class="panel-footer">
				<button type="button" class="btn btn-default" onclick="add();">등록</button>
			</div>
		</div>
	</div>

</body>
</html>