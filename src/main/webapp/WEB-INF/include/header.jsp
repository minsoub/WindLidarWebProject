<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.hist.windlidar.common.SessionClass" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<title>WindLidar System</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  

<link rel="stylesheet" type="text/css" href="<c:url value='/css/ui.css'/>" />

<link rel="stylesheet" href="https://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="https://code.jquery.com/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>

<!-- jQuery -->
<!--  script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script   -->
<script src="<c:url value='/js/common.js'/>" charset="utf-8"></script>


</head>
<body>
<table class="head_list">
<thead>
<%
  if (session.getAttribute("user") == null)
  {
%>
  <tr>
	<th scope="col">Wind Lidar 관측자료 수신현황</th>
	<th scope="col">Scanning Parameter</th>
	<th scope="col">시간대별 통계</th>
	<th scope="col">일별통계</th>
	<th scope="col">월별통계</th>
	<th scope="col">계정관리</th>
	<th scope="col">[ <a href="<c:url value='/login.do' />">로그인</a> ]</th>
	</tr>
<% 	  
  }else {
%>
  <tr>
	<th scope="col">Wind Lidar 관측자료 수신현황</th>
	<th scope="col"><a href="<c:url value='/scanList.do' />">Scanning Parameter</a></th>
	<th scope="col">시간대별 통계</th>
	<th scope="col">일별통계</th>
	<th scope="col">월별통계</th>
	<th scope="col"><a href="<c:url value='/memberList.do'/>">계정관리</a></th>
	<th scope="col">[ <a href="<c:url value='/logout.do' />">로그아웃( <%=((SessionClass)session.getAttribute("user")).getName()%> )</a> ]</th>
	</tr>
<%	  
  }
%>
</thead>
</table>
				