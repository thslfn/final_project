<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 세부 정보</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	function showDetail(seme){
		var idNum = $('#idNum').val()
		var seme01 = seme
		var form = {'idNum':idNum,'seme01':seme}
		$.ajax({
			url: "seme_detail", 
			type: "POST",
			dataType:"json",
			data:JSON.stringify(form),
			contentType:"application/json;charset=utf-8",
			success: function(list){
				if(list.length == 0){
					let html = "<span class='badge badge-success' style='width: 110px; height: 30px; font-size: 18px; margin-top: 10px; margin-bottom: 10px;'>기본정보</span><table class='table'>"
						html += "<thead class='thead-dark' style='text-align: center;'><tr><th>번호</th><th>학기</th><th>교과목</th>"
						html += "<th>취득 학점</th><th>평점</th><th>등급</th></tr></thead>"
						html += "<tbody style='text-align: center;'><tr><td colspan='6'><b>해당 학기 성적이 없습니다.</b></td></tr></tbody>"
						$("#semeDetail").empty().append(html)
				}else{
					let html = "<div class='container'><table class='table'>"
						html += "<thead class='thead-dark' style='text-align: center;'><tr><th>번호</th><th>학기</th><th>교과목</th>"
						html += "<th>취득 학점</th><th>평점</th><th>등급</th></tr>"
				for(var i=0;i<list.length;i++){
				html += "<tbody style='text-align: center;'><tr><td>"+(i+1)+"</td><td>"+list[i].gradeSeme+"</td>"
				html += "<td>"+list[i].subjectName+"</td>"
				html += "<td>"+list[i].receivedCred+"</td>"
				html += "<td>"+list[i].score+"</td>" //나중에 수정 받은 평점으로 
				html += "<td>"+list[i].grade+"</td></tr></tbody>"
				}
				html += "</table>"
				
					$("#semeDetail").empty().append(html) //empty를 넣어줌으로 한 번만 호출되게, 같은 이름으로 걸어주니 모든 게 해결...
				}
			}
			, error:function(){
				alert('문제가 발생하였습니다.')
			}
		})
	}

</script>
<style type="text/css">
	.hr { border: 0;
		  height: 3px;
		  background-color: #A5A5A5; }
</style>
</head>
<body>
 <c:import url="../default/professorHeader.jsp" />
 
<div class="container">
<span class="badge badge-success" style="width: 110px; height: 30px; font-size: 18px; margin-top: 10px; margin-bottom: 10px;">기본 정보</span>
	<table class="table">
		<c:forEach var="pStuInfo" items="${detailStuInfo}">
			<tr>
				<th>학번</th> <td>${pStuInfo.idNum}</td> <th>이름</th> <td>${pStuInfo.name}</td>
			</tr>
			<tr>
				<th>휴대폰 번호</th> <td>${pStuInfo.phoneNum}</td> <th>생년월일</th> <td>${pStuInfo.residentNum}</td>
			</tr>
			<tr>
				<th>이메일</th> <td>${pStuInfo.email}</td> <th>학과</th> <td>${pStuInfo.major}</td>
			</tr>
			<tr>
				<th>학년 - 반</th> <td>${pStuInfo.class_}</td> <th>국적</th> <td>${pStuInfo.country}</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="3" style="border-top: none;"></td>
			<td style="float: right; border-top: none;"><input type="button" onclick="location.href='${contextPath }/professor/all_student'" value="Back"></td>
		</tr>
	</table>
	<hr class="hr">
</div>
 
<div class="container">
	<span class="badge badge-success" style="width: 110px; height: 30px; font-size: 18px; margin-top: 10px; margin-bottom: 10px;">학기 성적</span>
	<table class="table" style="text-align: center;">
		<thead class="thead-dark">
			<tr>
				<th>학년/학기</th> <th>신청학점</th> <th>취득학점</th> <th>취득학점 평균</th> <th>석차</th>
			</tr>
		</thead>
		<!-- varStatus로 인덱스를 매기면 하나 하나 개별적으로 값을 전달하는 것이 가능하다. -->
		<c:forEach var="sGrade" items="${semeGradeInfo}" varStatus="status">
			<input type="hidden" id="idNum" value="${sGrade.idNum }"/>
			<input type="hidden" id=seme${status.index} value="${sGrade.mjSeme }"/>
			<tr>
				<td><input type="button" value="${sGrade.mjSeme}" onclick="showDetail($('#seme${status.index}').val())"/></td>
				<td>${sGrade.appCred}</td>
				<td>${sGrade.receivedCred}</td> <td>${sGrade.aveGrade}</td> <td>${sGrade.rank}</td>
			</tr>
		</c:forEach>
	</table>
	<hr class="hr">
</div>

<div class="container">
	<span class="badge badge-success" style="width: 130px; height: 30px; font-size: 18px; margin-top: 10px; margin-bottom: 10px;">교과목별 성적</span>
	<div id="semeDetail">
		<table class="table" style="text-align: center;">
			<thead class="thead-dark">
				<tr>
					<th>번호</th> <th>학기</th> <th>교과목</th> <th>취득 학점</th> <th>평점</th> <th>등급</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					 <td colspan="6"><b>성적을 볼 학기를 선택해 주세요.</b></td>
				</tr>
			</tbody>
		</table>
	</div>
	<hr class="hr">
</div>
<!-- 반복되지 않으면 c:forEach를 쓰면 안 된다. list 같은 것들만 쓸 것. -->
<div class="container">
<span class="badge badge-success" style="width: 110px; height: 30px; font-size: 18px; margin-top: 10px; margin-bottom: 10px;">누적 성적</span>
<table class="table" style="text-align: center;">
	<thead class="thead-dark">
		<tr>
			<th>신청 학점</th> <th>취득 학점</th> <th>평균 평점</th> <th>환산 점수</th>
		</tr>
	</thead>
	<tbody>
		<tr>
			 <td>${accumInfo.applyGrade}</td> <td>${accumInfo.receivedGrade}</td>
			 <td>${accumInfo.aveGrade}</td> <td>${accumInfo.totalScore}</td>
		</tr>
	</tbody>
</table>
</div>
<c:import url="../default/footer.jsp" />
</body>
</html>