<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등록금 관리</title>
<style type="text/css">
 div{/* border: 1px solid black; */}
 .content{width:90%; height: 12%; margin: auto; margin-top: 20px;}
 .infomation{width:90%; height: 50%; overflow: auto; margin: auto; margin-top: 20px; border: 1px solid black;}
 .payment{width:90%; height: 20%; margin: auto; margin-top: 20px;}
</style>
<script type="text/javascript">
	function payment(){
		var str = document.getElementById("account").value;

		if(document.getElementById("bankSelect").value == 0  || str.length == 0){
			alert('은행 정보를 정확히 입력하세요.');
			document.getElementById("account").focus();		
		}else{
			var answer = "";
			//var s = str.replace(/[A-z]/g, "");
			var s = str.replace(/-/gim, "");
			var s2 = s.replace(/[A-z]/g, "")
			answer = s2;
			document.getElementById("account").value = answer;
			pay.submit();
		}
			
	}
</script>
	
</head>
<body>
<c:import url="../default/studentheader.jsp" />

<div class="wrap">
<div class="title">
<h1>등록금 관리</h1>
</div>
<c:if test="${tuitionInfo.paymentStu == 'N' && tuitionInfo.payment == 'Y'}">
<div class="content" align="center">
	<table class="table" style="text-align: center;">
						<thead class="thead-dark">
							<tr>
								<th>학과/학기</th>
								<th>이 름</th>
								<th>납 부 금(만원)</th>
								<th>납 부 상 태</th>
								<th>납 부 기 한</th>
							</tr>
						</thead>
						<tbody>
						<tr>
							<td>${studentInfo.major}/${studentInfo.gradeSemester}</td>
							<td>${studentInfo.name}</td>
							<td>${300 - scholar}</td>
							<td>${tuitionInfo.paymentStu}</td>
							<td>${tuitionInfo.regStart }&nbsp;~&nbsp;${ tuitionInfo.regEnd}</td>
						</tr>
					</tbody>
					</table>
</div>
<div class="infomation">

  ▣ 유의 사항 <br><br>

 가. 정해진 기간 내에 등록을 완료하지 않으면 학칙 제28조에 의거 미등록 제적됩니다.<br>
 나. 휴학생은 등록금을 납부할 필요가 없습니다. 학칙 제55조에 의거 휴학은 등록금 반환사유에 해당되지 않으므로<br><br>
      등록금 납부 후 휴학하는 경우에도 기납부한 등록금은 환불되지 않습니다. 등록금 납부 후 학기개시일 부터 7주<br>
      이내 휴학한 학생은 복학 시 해당학기 등록금 변동에 따른 차액 납부/환불 없이 복학 수속합니다.<br><br>
 다. 당해 학기 장학생으로 선발된 자는 해당학기 등록을 필하여야 장학생으로 인정되며 등록을 완료하지 않을 경우<br>
      해당학기의 장학사항은 취소됩니다.<br>
      (휴학신청자도 정해진 기간 내에 등록완료하지 않으면 선발된 장학내역이 취소됨)<br><br>
 라. 휴학 당시 장학생으로 선발되어 등록금 감면혜택을 받아 등록 완료한 학생은 이후 복학학기에 타장학금을 받을 수<br>
      없으며 타장학금을 수혜받기 위해 휴학 당시의 수혜 받았던 장학을 포기할 수 없습니다.<br><br>
 마. 전과 시, 기 선발된 장학금(실용인재 장학금, 한양브레인 장학금, 학부리더십 장학금 등)은 취소되며<br>
      해당학과의 타 학생이 추가 선발됩니다.<br><br>
 바. 외국국적의 학부/대학원생은 한국정부의 외국인 유학생보험 의무화정책에 따라 등록금 납부시 보험료를 포함하여<br>
      등록하여야 합니다.(보험료 납부와 관련하여 기타 문의사항이 있을 경우 국제팀으로 연락하여 주시기 바랍니다.<br>
      ☎ 국제팀 (신/편입생) 02)2220-2444~5, (재학생)02)2220-2847)<br><br>
</div>
<div class="payment">
<div>
<h5 style="text-decoration: underline;">환불계좌 입력</h5>
</div>
<form action="tuitionPayment" id="pay" method="post">
<table class="table" style="text-align: center;">
						<thead class="thead-dark">
							<tr>
								<th>은 행</th>
								<th>계 좌 번 호</th>
							</tr>
						</thead>
						<tbody>
						<tr>
							<td style="width: 100px;">
								<div class="input-group mb-3" style="width: 200px;">
									<select class="custom-select" id="bankSelect" name="bankSelect">
										<option value="0" selected >은행선택</option>
										<option value="국민은행">국민은행</option>
										<option value="신한은행">신한은행</option>
										<option value="카카오뱅크">카카오뱅크</option>
										<option value="우리은행">우리은행</option>
										<option value="케이뱅크">케이뱅크</option>
										<option value="농협">농협</option>
										<option value="우체국">우체국</option>
										<option value="수협">수협</option>
										
									</select>
								</div>
							</td>
							<td><input type="text" class="form-control form-control" placeholder="계좌번호 입력 (-)없이 숫자만 입력하세요" id="account" name="account" ></td>
						</tr>
					</tbody>
					</table>
    <div align="center">
    <button type="button" class="btn btn-secondary" onclick="payment()">계좌등록</button>
    </div>
    </form>
</div>
</c:if>
<c:if test="${tuitionInfo.paymentStu == 'Y' && tuitionInfo.payment == 'Y'}">
<h3>등록금이 납부가 완료되었습니다.</h3>
</c:if>
<c:if test="${tuitionInfo.payment == 'N'}">
<h3>등록금 납부 기간이 아닙니다.</h3>
</c:if>
</div>
  <c:import url="../default/footer.jsp" />
</body>
</html>