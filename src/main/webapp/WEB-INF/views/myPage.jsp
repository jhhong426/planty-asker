<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="include/header.jsp" %>

  <!DOCTYPE html>
<html>
<head><title>관리자 페이지</title>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- DataTables -->
  <link rel="stylesheet" href="/resources/plugins/datatables/dataTables.bootstrap.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="/resources/dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="/resources/dist/css/skins/_all-skins.min.css">
  <link rel="stylesheet" href=" https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css">
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
</head>
<body>
  
 	<h1>My 정보</h1>
 	
 	<p> ID : ${login.getMngrId()}</p>
 	<p> 이름 : ${login.getMngrName()}	</p>
 	<p> 사원번호 : ${login.getEmp_no()}		</p>
 	<p> 소속부서 : ${login.getDepartment()}	</p>
 	<p> 직책 : ${login.getPosition()}			</p>
 	<p> 권한 : ${login.getAuthority()}			</p>
 	
 	
 	<h1>비밀번호 변경</h1>
 	
 	<a href="/ask/editPW"><button>비밀번호 변경</button></a>
 	
 	
 	
 	
	<h1>처리내역</h1>
	
	<h3>처리된 내역 : 건</h3>

	<p>기간 설정: <input type="text" id="datepicker"> ~ <input type="text" id="datepicker"></p>
 
 

	
	
	
	
	
	
	<h3>처리된 신고 : 건</h3>
  	
 	
 	
 	
 	
			

<!-- jQuery 2.2.3 -->
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="/resources/bootstrap/js/bootstrap.min.js"></script>
<!-- DataTables -->
<script src="/resources/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="/resources/plugins/datatables/dataTables.bootstrap.min.js"></script>
<!-- SlimScroll -->
<script src="/resources/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="/resources/plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="/resources/dist/js/app.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="/resources/dist/js/demo.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- page script -->
<script>

$( function() {
    $( "#datepicker" ).datepicker();
  } );
	
</script>
</body>
</html>


<%@include file="include/footer.jsp" %>