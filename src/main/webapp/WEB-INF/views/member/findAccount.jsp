<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>YW University</title>
<link href="resources/css/styles.css" rel="stylesheet" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"
	crossorigin="anonymous"></script>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	function findId(){
		let form = {}
		let arr = $("#findId").serializeArray()
		for(i=0; i<arr.length; i++){
			form[arr[i].name] = arr[i].value
		}
		$.ajax({
			url:"findId" ,type:"POST",dataType:"json",
			data:JSON.stringify(form),
			contentType:"application/json; charset=utf-8",
			success:function(rep){
				if($.trim(rep.result) == 'null') {
					alert("회원이 아니거나 이름 또는 전화번호를 잘못 입력하셨습니다. 다시 한 번 확인해 주세요.");
				}
				else {
					alert($("#inputName").val() + ' 님의 아이디는 ' + rep.result + ' 입니다.');
				}
			},
			error:function(request,status,error){
				alert("회원이 아니거나 이름 또는 전화번호를 잘못 입력하셨습니다. 다시 한 번 확인해 주세요.");

			}
		})
	}
	
	function findPw(){
		let form = {"inputId" : $("#inputId").val(), "inputEmail" : $("#inputEmail").val() + "@" + $("#domain").val()}
		//let arr = $("#findPw").serializeArray()
		//for(i=0; i<arr.length; i++){
		//	form[arr[i].name] = arr[i].value
		//}
		$.ajax({
			url:"findPw" ,type:"POST",dataType:"json",
			data:JSON.stringify(form),
			contentType:"application/json; charset=utf-8",
			success:function(rep){
				alert("임시 비밀번호가 메일로 발송되었습니다.");
			},
			error:function(request,status,error){
				alert("아이디 또는 이메일을 잘못 입력하셨습니다. 다시 한 번 확인해 주세요.");

			}
		})
	}
</script>
</head>
<body class="bg-secondary">
	<c:set var="contextPath" value="<%=request.getContextPath() %>" />
	<div id="layoutAuthentication">
		<div id="layoutAuthentication_content">
			<div
				style="text-align: center; padding-top: 2%; font-size: 30pt; color: white;">
				YW University</div>
			<main>
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-lg-5" style="margin-right: 0;">
							<div class="card shadow-lg border-0 rounded-lg mt-5">
								<div class="card-header">
									<h3 class="text-center font-weight-light my-4">아이디 찾기</h3>
								</div>
								<div class="card-body">
									<form id = "findId" method="post">
										<div class="form-floating mb-3">
											<input class="form-control" name="inputName" id = "inputName" type="text"
												placeholder="name" /> <label for="inputName">이름 입력</label>
										</div>
										<div class="form-floating mb-3">
											<input class="form-control" name="inputPhone" id = "inputPhone" type="text"
												placeholder="01000000000" /> <label for="inputPhone">전화번호 입력</label>
										</div>
										<div
											class="d-flex align-items-center justify-content-between mt-4 mb-0">
											<input type="button" class="btn btn-primary" onclick="findId()" value="아이디 찾기">
											<input type="button" class="btn btn-primary" onclick="location.href='${contextPath}'" value="로그인하기">
										</div>
									</form>
								</div>
							</div>
						</div>
						<div class="col-lg-5" style="margin-right: 0;">
							<div class="card shadow-lg border-0 rounded-lg mt-5">
								<div class="card-header">
									<h3 class="text-center font-weight-light my-4">비밀번호 찾기</h3>
								</div>
								<div class="card-body">
									<form id = "findPw" method="post">
										<div class="form-floating mb-3">
											<input class="form-control" name="inputId" id="inputId" type="text"
												placeholder="id" /> <label for="inputId">아이디 입력</label>
										</div>
										<div class="form-floating mb-3" style="display: flex;">
											<input class="form-control" name="inputEmail" id="inputEmail" type="text"
												placeholder="abc@aaa.com" style="width: 50%;"> <label for="inputEmail">E-mail 입력</label>
											<font style="padding-top: 15px;">@</font>
											<div class="form-floating">
												<select class="form-select" id="domain" aria-label="Floating label select example" style="width: 180%;">
													<option value="none" selected>== 선택 ==</option>
													<option value='gmail.com'>gmail.com</option>
											        <option value='naver.com'>naver.com</option>
											        <option value='nate.com'>nate.com</option>
											        <option value='daum.net'>daum.net</option>
											        <option value='dreamwiz.com'>dreamwiz.com</option>
											        <option value='yahoo.co.kr'>yahoo.co.kr</option>
											        <option value='empal.com'>empal.com</option>
											        <option value='chollian.net'>chollian.net</option>
											        <option value='korea.com'>korea.com</option>
											        <option value='paran.com'>paran.com</option>
											        <option value='freechal.com'>freechal.com</option>
											        <option value='hotmail.com'>hotmail.com</option>
											        <option value='hanafos.com'>hanafos.com</option>
											        <option value='hanmail.net'>hanmail.net</option>
												</select> <label for="floatingSelect" style="width: 100%;">Domain</label>
											</div>
										</div>
										<div
											class="d-flex align-items-center justify-content-between mt-4 mb-0">
											<input type="button" class="btn btn-primary" onclick="findPw()" value="비밀번호 찾기">
											<input type="button" class="btn btn-primary" onclick="location.href='${contextPath}'" value="로그인하기">
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</main>
		</div>

		<div id="layoutAuthentication_footer">
		           <c:import url="../default/footer.jsp" />

		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
</body>
</html>
