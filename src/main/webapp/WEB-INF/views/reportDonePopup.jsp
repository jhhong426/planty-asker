<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="box box-primary">
	<div class="box-header with-border">
		<div class="box-title">
			<p>신고 처리 결과</p>
		</div>
	</div>

	<div class="box-body">
		<div class="col-md-6">


			<div class="form-group">

				<div class="row">
					<div class="center-block" style="width: 600px; padding: 5px 15px;">
						<label for="">등록번호</label> <input type="text" name=""
							value="${survyInfo.survey_no}" disabled> <label for="">작성자</label>
						<input type="text" name="" value="${survyInfo.email}" disabled>
					</div>
				</div>
				<div class="row">
					<div class="center-block" style="width: 600px; padding: 5px 15px;">
						<label for="">작성일</label> <input type="text" name=""
							value="${survyInfo.reg_date}" disabled> <label for="">투표시간</label>
						<input type="text" name="" value="${survyInfo.limit_time}"
							disabled>
					</div>
				</div>
				<div class="row">
					<div class="center-block" style="width: 600px; padding: 5px 15px;">
						<label for="">진행상태</label>
						<c:choose>
							<c:when test="${survyInfo.status == 'SS00'}">
								<input type="text" name="" value="투표 진행중" disabled>
							</c:when>

							<c:when test="${survyInfo.status == 'SS01'}">
								<input type="text" name="" value="투표 완료" disabled>
							</c:when>

							<c:when test="${survyInfo.status == 'SS02'}">
								<input type="text" name="" value="블라인드" disabled>
							</c:when>
							<c:otherwise>
								<input type="text" name="" value="투표 진행중" disabled>
							</c:otherwise>
						</c:choose>
						<label for="">신고건수</label> <input type="text" name=""
							value="${survyInfo.reported_cnt}" disabled>
					</div>

				</div>

				<div class="form-group">
					<label>투표내용</label>
					<textarea class="form-control" rows="8" cols="30" disabled>${survyInfo.survey_contents}</textarea>
				</div>

				<table id="surveyTable" class="table table-bordered">
					<tbody>
						<tr>
							<th>선택지</th>
							<th>투표자 수</th>
							<th>남자</th>
							<th>여자</th>
						</tr>
						<c:forEach items="${survyResult}" var="result">
							<tr>
								<td>${result.item_contents}</td>
								<td>${result.male_score + result.female_score} 명</td>
								<td>${result.male_score} 명</td>
								<td>${result.female_score} 명</td>
							</tr>
						</c:forEach>

					</tbody>
				</table>

			</div>
		</div>

		<div class="col-md-6">
			<div class="form-group">
				<div class="row">
					<div class="center-block" style="width: 600px; padding: 5px 15px;">
						<label for="">신고글 번호</label> <input type="text" name=""
							value="${vo.report_no}" disabled> <label for="">신고자</label>
						<input type="text" name="" value="${vo.email}" disabled>
					</div>
				</div>

				<div class="row">
					<div class="center-block" style="width: 600px; padding: 5px 15px;">
						<label for="">신고유형</label> <input type="text" name=""
							value="${vo.report_category}" disabled> <label for="">접수시간</label>
						<input type="text" name="" value="${vo.reg_date}" disabled>
					</div>
				</div>

				<div class="row">
					<div class="center-block" style="width: 600px; padding: 5px 15px;">
						<label>신고사유</label>
						<textarea class="form-control" rows="5" cols="30" disabled>${vo.report_contents}</textarea>
					</div>
				</div>

				<div class="row">
					<div class="center-block" style="width: 600px; padding: 5px 15px;">
						<label for="">담당자</label> <input type="text" name=""
							value="${vo.mngr_id}" disabled> <label for="">처리시간</label>
						<input type="text" name="" value="${vo.cmpl_date}" disabled>
					</div>

					<div class="center-block" style="width: 600px; padding: 5px 15px;">
						<label>처리유형</label> <input type="text" name=""
							value="${vo.answer_category}" disabled>
					</div>


					<div class="center-block" style="width: 600px; padding: 5px 15px;">
						<label>답변내용</label>
						<textarea class="form-control" rows="5" cols="30" readOnly>${vo.answer_contents}</textarea>

					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="box-footer">
		<button id="btnClosePopup" type="button" name="button"
			class="btn btn-primary center-block">확인</button>
	</div>
</div>



<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<script src="/resources/plugins/jQuery/jquery.bpopup.min.js"></script>
<script type="text/javascript">
	$("#btnClosePopup").click(function() {
		$("#popupWrapper").bPopup().close();
	});

	function validateInsertForm() {
		var insertWord = $('#answerCategoryInput').val();
		if (confirm(insertWord + "를 삽입하시겠습니까 ?")) {
			jQuery.ajax({
				type : "get",
				url : "/reportRegister",
				data : {
					"popupWord" : insertWord
				},
				success : function(data) {
					alert(data + "가 금칙어에 추가되었습니다.");
				},
				error : function(xhr, status, error) {
					alert("에러발생");
				}
			});

		} else {
			alert("ss");
		}
	}

	var rowCount = 0;
	var totalCount = 0;
	var maleCount = 0;
	var femaleCount = 0;

	$("#surveyTable tr").each(function() {
		if (rowCount != 0) {

			var tds = $(this).children("td");

			totalCount += parseInt($(tds).eq(1).text());
			maleCount += parseInt($(tds).eq(2).text());
			femaleCount += parseInt($(tds).eq(3).text());
		}

		rowCount++;
	});

	if (rowCount > 1) {

		var str = "<tr><td>합계</td><td>" + totalCount + " 명</td><td>"
				+ maleCount + " 명</td><td>" + femaleCount + " 명</td></tr>"
		$("#surveyTable > tbody:last").append(str);
	}

	console.log(totalCount, maleCount, femaleCount);

	$("#btnClosePopup").click(function() {
		$("#popupWrapper").bPopup().close();
	});
	
</script>


