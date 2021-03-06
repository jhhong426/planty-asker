<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="box box-primary">
        <div class="box-header with-border">
          <div class="box-title">
            <p>질문 글 상세 정보</p>
          </div>
        </div>

        <div class="box-body">
          <div class="form-group">

            <div class="row">
              <div class="center-block" style="width:600px; padding:15px;">
                <label for="">등록번호</label>
                <input type="text" name="" value="${survyInfo.survey_no }" disabled>
                <label for="">작성자</label>
                <input type="text" name="" value="${survyInfo.email }" disabled>
              </div>
            </div>
            <div class="row">
	           	<div class="center-block" style="width:600px; padding:15px;">
	                <label for="">작성일</label>
	                <input type="text" name="" value="${survyInfo.reg_date }" disabled>
	                <label for="">투표시간</label>
	                <input type="text" name="" value="${survyInfo.limit_time }" disabled>
	             	</div>       
            </div>
            <div class="row">
            	<div class="center-block" style="width:600px; padding:15px;">
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
	                
	                <label for="">신고건수</label>
	                <input type="text" name="" value="${survyInfo.reported_cnt }" disabled>
              	</div>  
                
            </div>

            <div class="form-group">
              <label>투표내용</label>
              <textarea class="form-control" rows="8" cols="30" disabled>${survyInfo.survey_contents }</textarea>
            </div>

            <table class="table table-bordered" id="tabResult">
              <tbody>
                <tr>
                  <th>선택지</th>
                  <th>투표자 수</th>
                  <th>남자</th>
                  <th>여자</th>
                </tr>
                <c:forEach items="${survyResult}" var="result">
                	<tr>
                		<td>${result.item_contents }</td>
                		<td>${result.male_score + result.female_score }  명</td>
                		<td>${result.male_score }  명</td>
                		<td>${result.female_score}  명</td>
                	</tr>
                </c:forEach>
                
                
              </tbody>
            </table>

          </div>
        </div>
        <div class="box-footer">
          <button id="btnClosePopup" type="button" name="button" class="btn btn-primary center-block">확인</button>
        </div>
      </div>
      
      <script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
      <script src="/resources/plugins/jQuery/jquery.bpopup.min.js"></script>
      <script type="text/javascript">
			
      		var rowCount = 0;
      		var totalCount = 0;
      		var maleCount = 0;
      		var femaleCount = 0;
      		
      		$("#tabResult tr").each(function(){
      			if(rowCount != 0){
      				
      				var tds = $(this).children("td");
      				
      				totalCount += parseInt($(tds).eq(1).text());
      				maleCount += parseInt($(tds).eq(2).text());
      				femaleCount += parseInt($(tds).eq(3).text());
      			}
      			
      			rowCount ++;
      		});
      		
      		if(rowCount > 1){
      			
      			var str = "<tr><td>합계</td><td>" +
      						totalCount + " 명</td><td>" +
      						maleCount + " 명</td><td>" +
      						femaleCount + " 명</td></tr>"
      			$("#tabResult > tbody:last").append(str);
      		}
      		
      		console.log(totalCount, maleCount, femaleCount);
      
			$("#btnClosePopup").click(function(){
				$("#popupWrapper").bPopup().close();
			}); 
		      
		      
		      
		      
      
      </script>
      
      
