<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.hist.windlidar.common.SessionClass" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  

<!DOCTYPE html>
<html lang="ko">
	<head>
    	<meta charset="utf-8" />
        <title>Wind Lidar 관측자료 수신현황</title>
        <link rel="stylesheet" href="<c:url value='/css/common.css'/>" />
        <link rel="stylesheet" href="<c:url value='/css/layout.css'/>" />
<link rel="stylesheet" href="https://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="https://code.jquery.com/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script src="<c:url value='/js/common.js'/>" charset="utf-8"></script>
        
    </head>
    <body>
        <div id="wrap">
            <div id="header">  
<%
  if (session.getAttribute("user") == null)
  {
%>            
                <div class="head">
                    <h1 class="logo fl_left"><img src="<c:url value='/image/logo.png'/>" alt="Wind Lidar" title="Wind Lidar"/></h1>
                    <div class="gnb fl_left">
                        <ul>
                            <li><a href="#">파라미터</a></li>
                            <li><a href="#">시간대별 통계</a></li>
                            <li><a href="#">일별 통계</a></li>
                            <li><a href="#">월별 통계</a></li>
                            <li><a href="#">사용자관리</a></li>
                        </ul>
                    </div>
                    <div class="login fl_right"><a href="<c:url value='/login.do' />"><img src="<c:url value='/image/btn_login.png'/>" style="padding-left:10px"></a></div>
                </div>
<% 	  
  }else {
%>                
                <div class="head">
                    <h1 class="logo fl_left"><a href="<c:url value='/login.do' />"><img src="<c:url value='/image/logo.png'/>" alt="Wind Lidar" title="Wind Lidar"/></a></h1>
                    <div class="gnb fl_left">
                        <ul>
                            <li><a href="<c:url value='/scanList.do' />">파라미터</a></li>
                            <li><a href="<c:url value='/windLidarHList.do'/>">시간대별 통계</a></li>
                            <li><a href="<c:url value='/windLidarDList.do'/>">일별 통계</a></li>
                            <li><a href="<c:url value='/windLidarMList.do'/>">월별 통계</a></li>
                            <li><a href="<c:url value='/memberList.do'/>">사용자관리</a></li>
                        </ul>
                    </div>
                    <div class="login fl_right"><img src="<c:url value='/image/icon_member.png'/>" style="padding-right:10px"><%=((SessionClass)session.getAttribute("user")).getName()%><a href="<c:url value='/logout.do' />"><img src="<c:url value='/image/btn_logout.png'/>" style="padding-left:10px"></a></div>
                </div>           
<%	  
  }
%>                
            </div>	