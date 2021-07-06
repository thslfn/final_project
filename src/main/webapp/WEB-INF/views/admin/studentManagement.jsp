<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생 관리_조회</title>
<style type="text/css">
.title {
	width: 90%;
	height: 10% margin:auto;
	margin-top: 10px;
}

.officerInfo {
	width: 90%;
	height: 30%;
	display: flex;
	margin: auto;
	margin-top: 5px;
}

.menuBar {
	width: 100%;
	height: 8%;
	margin: auto;
	border-top: 1px solid black;
	border-bottom: 1px solid black;
}

.imgdiv {
	
}

.content {
	width: 90%;
	height: 50%;
	margin: auto;
}

.infoTable {
	width: 35%;
	margin-left: 10px;
	margin-right: 30px;
	text-align: center;
}
</style>
<script type="text/javascript">

	function findAll(num){
		let form = {}
		form['major'] = $('#infoAll').val()
		$.ajax({
			url:"findinfo?num="+num ,type:"POST",dataType:"json",
			data:JSON.stringify(form),
			contentType:"application/json; charset=utf-8",
			success:function(map){
					$('#searchMajor').val('all')
					let html = "<div class='container'><table class='table' style='margin-top:20px; margin-left:20px;'>"
						html += "<thead class='thead-dark' style='text-align: center;'>"
						html += "<tr><th>번호</th><th>이름</th><th>학번</th>"
						html += "<th>학년</th><th>학과</th><th>연락처</th></tr></thead>"
						for(var i=0;i<map.list.length;i++){
						html += "<tbody><tr><td align='center'>"+(i+1)+"</td><td align='center'><a href = 'studentInfo?idNum="+ map.list[i].idNum +"'>"+map.list[i].name+"</a></td>"
						html += "<td align='center'>"+map.list[i].idNum+"</td>"
						html += "<td align='center'>"+map.list[i].grade+"</td>"
						html += "<td align='center'>"+map.list[i].major+"</td>"
						html += "<td align='center'>"+map.list[i].phoneNum+"</td></tr></tbody>"
						}
						html += "</table></div>"
					let pagehtml = "<table style='margin-top: 20px; margin-left: 20px; width: 275px; text-align: center; font-size: 20px;'><tr>"
						pagehtml += "<td colspan='5'>"
						for(var num = 1; num <= map.repeat; num++){
							pagehtml += "<a class='btn btn-outline-secondary' href = '#' onclick = 'findAll("+num+")'>"+num+"</a>"
						}
						pagehtml += "</td></tr></table>"
						$("#studentList").empty().append(html) //empty를 넣어줌으로 한 번만 호출되게, 같은 이름으로 걸어주니 모든 게 해결...
						$("#paging").empty().append(pagehtml)
			},
			error:function(request,status,error){	
				alert("문제가 발생했습니다.");
			}
		})
	}

	function findinfoTel(num){
		let form = {}
		form['major'] = $('#infoTel').val()
		$.ajax({
			url:"findinfo?num="+num ,type:"POST",dataType:"json",
			data:JSON.stringify(form),
			contentType:"application/json; charset=utf-8",
			success:function(map){
					$('#searchMajor').val('정보통신과')
					let html = "<div class='container'><table class='table' style='margin-top:20px; margin-left:20px;'>"
						html += "<thead class='thead-dark' style='text-align: center;'>"
						html += "<tr><th>번호</th><th>이름</th><th>학번</th>"
						html += "<th>학년</th><th>학과</th><th>연락처</th></tr></thead>"
						for(var i=0;i<map.list.length;i++){
						html += "<tbody><tr><td align='center'>"+(i+1)+"</td><td align='center'><a href = 'studentInfo?idNum="+ map.list[i].idNum +"'>"+map.list[i].name+"</a></td>"
						html += "<td align='center'>"+map.list[i].idNum+"</td>"
						html += "<td align='center'>"+map.list[i].grade+"</td>"
						html += "<td align='center'>"+map.list[i].major+"</td>"
						html += "<td align='center'>"+map.list[i].phoneNum+"</td></tr></tbody>"
						}
						html += "</table></div>"
					let pagehtml = "<table style='margin-top: 20px; margin-left: 20px; width: 275px; text-align: center; font-size: 20px;'><tr>"
						pagehtml += "<td colspan='5'>"
						for(var num = 1; num <= map.repeat; num++){
							pagehtml += "<a class='btn btn-outline-secondary' href = '#' onclick = 'findinfoTel("+num+")'>"+num+"</a>"
						}
						pagehtml += "</td></tr></table>"
						$("#studentList").empty().append(html) //empty를 넣어줌으로 한 번만 호출되게, 같은 이름으로 걸어주니 모든 게 해결...
						$("#paging").empty().append(pagehtml)
			},
			error:function(request,status,error){
				alert("문제가 발생했습니다.");
			}
		})
	}
	
	function findCar(num){
		let form = {}
		form['major'] = $('#car').val()
		$.ajax({
			url:"findinfo?num="+num ,type:"POST",dataType:"json",
			data:JSON.stringify(form),
			contentType:"application/json; charset=utf-8",
			success:function(map){
				$('#searchMajor').val('자동차공학과')
					let html = "<div class='container'><table class='table' style='margin-top:20px; margin-left:20px;'>"
						html += "<thead class='thead-dark' style='text-align: center;'>"
						html += "<tr><th>번호</th><th>이름</th><th>학번</th>"
						html += "<th>학년</th><th>학과</th><th>연락처</th></tr></thead>"
						for(var i=0;i<map.list.length;i++){
						html += "<tbody><tr><td align='center'>"+(i+1)+"</td><td align='center'><a href = 'studentInfo?idNum="+ map.list[i].idNum +"'>"+map.list[i].name+"</a></td>"
						html += "<td align='center'>"+map.list[i].idNum+"</td>"
						html += "<td align='center'>"+map.list[i].grade+"</td>"
						html += "<td align='center'>"+map.list[i].major+"</td>"
						html += "<td align='center'>"+map.list[i].phoneNum+"</td></tr></tbody>"
						}
						html += "</table></div>"
					let pagehtml = "<table style='margin-top: 20px; margin-left: 20px; width: 275px; text-align: center; font-size: 20px;'><tr>"
						pagehtml += "<td colspan='5'>"
						for(var num = 1; num <= map.repeat; num++){
							pagehtml += "<a class='btn btn-outline-secondary' href = '#' onclick = 'findCar("+num+")'>"+num+"</a>"
						}
						pagehtml += "</td></tr></table>"
						$("#studentList").empty().append(html) //empty를 넣어줌으로 한 번만 호출되게, 같은 이름으로 걸어주니 모든 게 해결...
						$("#paging").empty().append(pagehtml)
			},
			error:function(request,status,error){
				alert("문제가 발생했습니다.");
			}
		})
	}
	
	function findOperation(num){
		let form = {}
		form['major'] = $('#operation').val()
		$.ajax({
			url:"findinfo?num="+num ,type:"POST",dataType:"json",
			data:JSON.stringify(form),
			contentType:"application/json; charset=utf-8",
			success:function(map){
				$('#searchMajor').val('경영학과')
					let html = "<div class='container'><table class='table' style='margin-top:20px; margin-left:20px;'>"
						html += "<thead class='thead-dark' style='text-align: center;'>"
						html += "<tr><th>번호</th><th>이름</th><th>학번</th>"
						html += "<th>학년</th><th>학과</th><th>연락처</th></tr></thead>"
						for(var i=0;i<map.list.length;i++){
						html += "<tbody><tr><td align='center'>"+(i+1)+"</td><td align='center'><a href = 'studentInfo?idNum="+ map.list[i].idNum +"'>"+map.list[i].name+"</a></td>"
						html += "<td align='center'>"+map.list[i].idNum+"</td>"
						html += "<td align='center'>"+map.list[i].grade+"</td>"
						html += "<td align='center'>"+map.list[i].major+"</td>"
						html += "<td align='center'>"+map.list[i].phoneNum+"</td></tr></tbody>"
						}
						html += "</table></div>"
					let pagehtml = "<table style='margin-top: 20px; margin-left: 20px; width: 275px; text-align: center; font-size: 20px;'><tr>"
						pagehtml += "<td colspan='5'>"
						for(var num = 1; num <= map.repeat; num++){
							pagehtml += "<a class='btn btn-outline-secondary' href = '#' onclick = 'findOperation("+num+")'>"+num+"</a>"
						}
						pagehtml += "</td></tr></table>"
						$("#studentList").empty().append(html) //empty를 넣어줌으로 한 번만 호출되게, 같은 이름으로 걸어주니 모든 게 해결...
						$("#paging").empty().append(pagehtml)
			},
			error:function(request,status,error){
				alert("문제가 발생했습니다.");
			}
		})
	}
	
	function searchPage(num){
		var searchSelect = $('#searchSel').val()
		var searchText = $('#searchTxt').val()
		var searchMajor = $('#searchMaj').val()
		var form = {'searchSelect' : searchSelect, 'searchText' : searchText, 'searchMajor' : searchMajor}
		$.ajax({
			url:"searchStudent?num="+num ,type:"POST",dataType:"json",
			data:JSON.stringify(form),
			contentType:"application/json; charset=utf-8",
			success:function(map){
					let html = "<div class='container'><table class='table' style='margin-top:20px; margin-left:20px;'>"
						html += "<thead class='thead-dark' style='text-align: center;'>"
						html += "<tr><th>번호</th><th>이름</th><th>학번</th>"
						html += "<th>학년</th><th>학과</th><th>연락처</th></tr></thead>"
						for(var i=0;i<map.list.length;i++){
						html += "<tbody><tr><td align='center'>"+(i+1)+"</td><td align='center'><a href = 'studentInfo?idNum="+ map.list[i].idNum +"'>"+map.list[i].name+"</a></td>"
						html += "<td align='center'>"+map.list[i].idNum+"</td>"
						html += "<td align='center'>"+map.list[i].grade+"</td>"
						html += "<td align='center'>"+map.list[i].major+"</td>"
						html += "<td align='center'>"+map.list[i].phoneNum+"</td></tr></tbody>"
						}
						html += "</table></div>"
					let pagehtml = "<table style='margin-top: 20px; margin-left: 20px; width: 275px; text-align: center; font-size: 20px;'><tr>"
						pagehtml += "<td colspan='5'>"
						for(var num = 1; num <= map.repeat; num++){
							pagehtml += "<a class='btn btn-outline-secondary' href = '#' onclick = 'searchPage("+num+")'>"+num+"</a>"
						}
						pagehtml += "</td></tr></table>"
						$("#studentList").empty().append(html) //empty를 넣어줌으로 한 번만 호출되게, 같은 이름으로 걸어주니 모든 게 해결...
						$("#paging").empty().append(pagehtml)
			},
			error:function(request,status,error){
				alert("문제가 발생했습니다.");
			}
		})
	}
	
	function saveSearch(num){
		$('#searchSel').val($('#searchSelect').val())
		$('#searchTxt').val($('#searchText').val())
		$('#searchMaj').val($('#searchMajor').val())
		searchPage(num)
	}
	
</script>
</head>
<body>
	<c:import url="../default/adminHeader.jsp" />
	<div class="wrap">
		<div class="title">
			<h1 style="text-align: center;">학생 관리</h1>
		</div>
	</div>
	<div class="menuBar">
		<div class="btn-group" role="group" aria-label="Basic example"
			style="margin-top: 7px; margin-left: 25px; margin-bottom: 7px; padding-left: 80%;">
			<button type="button" class="btn btn-secondary"
				onclick="location.href='studentManagement'">조회</button>
		</div>
		<div class="btn-group" role="group" aria-label="Basic example"
			style="margin-top: 7px; margin-bottom: 7px;">
			<button type="button" class="btn btn-secondary"
				onclick="location.href='studentInsert'">등록</button>
		</div>
	</div>
	<div class="container">
		<div class="btn-group" role="group" aria-label="Basic example">
			<button type="button" class="btn btn-secondary" id="infoAll"
				onclick="findAll($('#firstNum').val())" value="전체">전체</button>
			<button type="button" class="btn btn-secondary" id="infoTel"
				onclick="findinfoTel($('#firstNum').val())" value="정보통신과">정보통신과</button>
			<button type="button" class="btn btn-secondary" id="car"
				onclick="findCar($('#firstNum').val())" value="자동차공학과">자동차공학과</button>
			<button type="button" class="btn btn-secondary" id="operation"
				onclick="findOperation($('#firstNum').val())" value="경영학과">경영학과</button>
		</div>
		<select id="searchSelect">
			<option value="name">이름</option>
			<option value="id_num">학번</option>
			<option value="grade">학년</option>
		</select> <input type="text" id="searchText"> <input type="button" class="btn btn-secondary"
			onclick="saveSearch($('#firstNum').val())" value="검색">
		<input type="hidden" id="searchMajor" value="all">
	</div>
	<input type = "hidden" value = "1" id = "firstNum">
	<input type = "hidden" value = "" id = "searchSel">
	<input type = "hidden" value = "" id = "searchTxt">
	<input type = "hidden" value = "" id = "searchMaj">
	<div id="studentList">
		<div class="container">
			<table class="table" style='margin-top: 20px; margin-left: 20px;'>
				<thead class="thead-dark" style="text-align: center;">
					<tr>
						<th>번호</th>
						<th>이름</th>
						<th>학번</th>
						<th>학년</th>
						<th>학과</th>
						<th>연락처</th>
					</tr>
				</thead>
				<tbody style="text-align: center;">
					<c:set var="cnt" value="0" />
					<c:forEach var="list" items="${list}">
						<tr>
							<td>${cnt+1}</td>
							<td><a href='studentInfo?idNum=${list.idNum}'>${list.name}</a></td>
							<td>${list.idNum}</td>
							<td>${list.grade}</td>
							<td id='major'>${list.major}</td>
							<td>${list.phoneNum}</td>
						</tr>
						<c:set var="cnt" value="${cnt+1}" />
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<div id="paging" style="padding-left: 37%;">
		<table
			style='margin-top: 20px; margin-left: 20px; width: 275px; text-align: center; font-size: 20px;'>
			<tr>
				<td colspan='5'>
						<c:forEach var="num" begin="1" end="${repeat}">
							<a class="btn btn-outline-secondary" href="studentManagement?num=${num}">${num}</a>
						</c:forEach>
				</td>
			</tr>
		</table>
	</div>
	<c:import url="../default/footer.jsp" />
</body>
</html>