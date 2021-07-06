<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<<<<<<< HEAD
<title>Insert title here</title>
<script type="text/javascript">
function classInfo(semester){
	$.ajax({
		url:"classInfo/"+semester, type:"GET", dataType:"json",
		contentType:"application/json;charset=utf-8",
		success: function(rep){
			let num = 1;
			let html='<table class="table" style="margin-top: 7px; text-align: center;"><thead class="thead-dark">';
			html += '<tr><th>번호</th><th>학과/학기</th><th>교과목</th><th>강의실</th><th>교수</th></tr></thead><tbody>'

			rep.forEach(function(data){
				
				html += "<tr><td>"+num+"</td>";
				
				if(data.gradeSemester == 1){
				html += "<td>"+data.major+"-"+101+"</td>";
				}else if(data.gradeSemester == 2){
				html += "<td>"+data.major+"-"+102+"</td>";	
				}else if(data.gradeSemester == 3){
				html += "<td>"+data.major+"-"+201+"</td>";	
				}else if(data.gradeSemester == 4){
				html += "<td>"+data.major+"-"+202+"</td>";	
				}
				
				html += "<td>"+data.subjectName+"</td>";
				html += "<td>"+data.classRoom+"</td>";
				html += "<td>"+data.professor+"</td></tr>";
				num += 1;
			})
			html += "</tbody></table>";
			$("#content").html(html)
			
		}, error:function(){
			alert('문제 발생')
		}
		
	})
}

</script>

=======
<title>종합 정보 조회_수강</title>
>>>>>>> 73a1c963e707316b219ec0169e449e93152b3f62
<style type="text/css">
div {
	/* border: 1px solid black; */
}

.title {
	width: 90%;
	height: 10%
	margin :auto;
	margin-top: 10px;
	
}

.memberInfo {
	width: 90%;
	height: 30%;
	display: flex;
	margin :auto;
	margin-top: 5px;
}

.menuBar {
	width: 100%;
	height: 6.5%;
	margin :auto;
	border-top: 1px solid black;
	border-bottom: 1px solid black;
}
.imgdiv{}

.content {
	width: 90%;
	height: 50%;
	margin :auto;
	overflow: auto;
	display: flex;
}

.infoTable{width: 35%; margin-left: 10px; margin-right: 30px;}
</style>

</head>
<body>
	<c:import url="../default/studentheader.jsp" />

	<div class="wrap">
		<div class="title">
			<h1>종합정보 조회</h1>
		</div>
		<div class="memberInfo">
			<div class="imgDiv">
			<c:choose>
			<c:when test="${info.imageFile == 'nan'}">	
				<img class="navbar-brand rounded-circle"
					src="../resources/img/nan.png" width=150px; height=150px; style="margin-left: 15px; margin-right: 15px;">
			</c:when>
			<c:otherwise>
			<img class="navbar-brand rounded-circle"
					src="${contextPath }/root/student/download?file=${info.imageFile}" width=150px; height=150px; style="margin-left: 15px; margin-right: 15px;">
			</c:otherwise>
			</c:choose>
			</div>
			<div class="infoTable">
				<table class="table">
					<thead>
						<tr>
							<th scope="col">학    번</th>
							<td scope="col">${info.idNum}</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">휴 대 폰</th>
							<td>${info.phoneNum}</td>
						</tr>
						<tr>
							<th scope="row">이 메 일</th>
							<td>${info.email}</td>
						</tr>
						<tr>
							<th scope="row">학년 - 반</th>
							<td>${info.grade}-${info.classInfo}</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="infoTable">
			
							<table class="table">
					<thead>
						<tr>
							<th scope="col">이   름</th>
							<td scope="col">${info.name }</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">생 년 월 일</th>
							<td>${info.birthDate}</td>
						</tr>
						<tr>
							<th scope="row">학   과</th>
							<td>${info.major }</td>
						</tr>
						<tr>
							<th scope="row">국   적</th>
							<td>${info.country}</td>
						</tr>
					</tbody>
				</table>
			
			</div>
			</div>

			<div class="menuBar">
			<div class="btn-group" role="group" aria-label="Basic example" style="margin-top: 7px; margin-left: 25px;">
				<button type="button" class="btn btn-secondary" onclick="location.href='${contextPath }/root/student/totalInquiry'">기본정보</button>
				<button type="button" class="btn btn-secondary" onclick="location.href='${contextPath }/root/student/totalInquiry_C'">수강</button>
				<button type="button" class="btn btn-secondary" onclick="location.href='${contextPath }/root/student/totalInquiry_G'">성적</button>
				<button type="button" class="btn btn-secondary" onclick="location.href='${contextPath }/root/student/totalInquiry_T'">등록/장학</button>
			</div>
		</div>
		<div style="margin-top: 10px; padding-left: 50px;">
		<c:if test="${info.classReq >= 1}">
		<button type="button" class="btn btn-outline-secondary" onclick="classInfo(5)">전체</button>
		</c:if>
		<c:if test="${info.classReq >= 1}">
		<button type="button" class="btn btn-outline-secondary" onclick="classInfo(1)">101</button>
		</c:if>
		<c:if test="${info.classReq >= 2}">
		<button type="button" class="btn btn-outline-secondary" onclick="classInfo(2)">102</button>
		</c:if>
		<c:if test="${info.classReq >= 3}">
		<button type="button" class="btn btn-outline-secondary" onclick="classInfo(3)">201</button>
		</c:if>
		<c:if test="${info.classReq >= 4}">
		<button type="button" class="btn btn-outline-secondary" onclick="classInfo(4)">202</button>
		</c:if>
		</div>
			<div class="content" id="content">
		<table class="table" style="margin-top: 7px; text-align: center; width: 80px;">
			<thead class="thead-dark">
				<tr>
					<th>번호</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="num" begin="1" end="${repeat}">
				<tr>
					<td>${num}</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		<table class="table" style="margin-top: 7px; text-align: center;">
			<thead class="thead-dark">
				<tr>
					<th>학과_학기</th>
					<th>교과목</th>
					<th>강의실</th>
					<th>교 수</th>
				</tr>
			</thead>
			<tbody>
		<c:choose>
			<c:when test="${subject.size() != 0}">
			<c:forEach var="list" items="${subject}" >
				<tr>
					<td>${list.major}-
					<c:choose>
					<c:when test="${list.gradeSemester == 1}">
					101
					</c:when>
					<c:when test="${list.gradeSemester == 2}">
					102
					</c:when>
					<c:when test="${list.gradeSemester == 3}">
					201
					</c:when>
					<c:when test="${list.gradeSemester == 4}">
					202
					</c:when>
					</c:choose>
					
					</td>
					<td>${list.subjectName}</td>
					<td>${list.classRoom}</td>
					<td>${list.professor}</td>
				</tr>
				</c:forEach>
				</c:when>
				<c:otherwise>
				<tr>
				<th colspan="4">수강신청 내역이 없습니다.</th>
				</tr>
				</c:otherwise>
			</c:choose> 
			</tbody>
		</table>
		</div>
	</div>
	  <c:import url="../default/footer.jsp" />

</body>

</html>