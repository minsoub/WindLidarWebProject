<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/header.jsp" %>

<%
   SessionClass user = (SessionClass)session.getAttribute("user");
%>
<div class="centered-wrapper">
<form id="frm">
	<h2>접속시간 : <%=user.getLoginDt()%></h2>

<c:forEach items="${toList}" var="row" varStatus="status">
  <c:if test="${row.S_CODE == '13211'}">
       <c:set var="rate01" value="${row.RCV_RATE}" />
  </c:if>
  <c:if test="${row.S_CODE == '13210'}">
       <c:set var="rate02" value="${row.RCV_RATE}" />
  </c:if>
  <c:if test="${row.S_CODE == '13206'}">
       <c:set var="rate03" value="${row.RCV_RATE}" />
  </c:if>
</c:forEach>	
<c:forEach items="${yeList}" var="row" varStatus="status">
  <c:if test="${row.S_CODE == '13211'}">
       <c:set var="yrate01" value="${row.RCV_RATE}" />
  </c:if>
  <c:if test="${row.S_CODE == '13210'}">
       <c:set var="yrate02" value="${row.RCV_RATE}" />
  </c:if>
  <c:if test="${row.S_CODE == '13206'}">
       <c:set var="yrate03" value="${row.RCV_RATE}" />
  </c:if>
</c:forEach>	
<table border=0 width="1200" align="center">
<tr>
  <td aligin="center" width="400">	
	<table class="mainList">
		<tbody>
		  <tr>
		     <td>${PAM1.S_NAME} ( ${PAM1.S_CODE} )</td>
		     <td>&nbsp;</td>
		     <td>more</td>
		  </tr>
		  <tr>
		     <td>Lidar Connection STS</td>
		     <td>&nbsp;</td>
		     <td>connected</td>
		  </tr>
		  <tr>
		     <td>Lidar status</td>
		     <td>&nbsp;</td>
		     <td>scanning</td>
		  </tr>
		  <tr>
		     <td>관측 데이터 수신</td>
		     <td>&nbsp;</td>
		     <td><c:if test="${PAM1.FILE_RCV_STS == '0'}">ERR</c:if><c:if test="${PAM1.FILE_RCV_STS == '1'}">OK</c:if></td>
		  </tr>
		  <tr>
		     <td>데이터 송신 프로세스</td>
		     <td>&nbsp;</td>
		     <td><c:if test="${PAM1.PRO_STS == '0'}">ERR</c:if><c:if test="${PAM1.PRO_STS == '1'}">OK</c:if></td>
		  </tr>
		  <tr>
		     <td>최종 수신 시각</td>
		     <td>&nbsp;</td>
		     <td><c:if test="${not empty PAM1.FILE_RCV_DT}">${PAM1.FILE_RCV_DT}</c:if></td>
		  </tr>
		  <tr>
		     <td>Today 수신율</td>
		     <td>&nbsp;</td>
		     <td><c:out value="${rate01}"/>%</td>
		  </tr>
		  <tr>
		     <td>Yesterday 수신율</td>
		     <td>&nbsp;</td>
		     <td><c:out value="${yrate01}"/>%</td>
		  </tr>
		</tbody>
	</table>
	<br/>
	
	<table class="mainList">
		<tbody>
		  <tr>
		     <td>Scanning Parameters</td>
		     <td>&nbsp;</td>
		     <td>more</td>
		  </tr>
		  <tr>
		     <td>최종수신시각(UTC)</td>
		     <td>&nbsp;</td>
		     <td><c:if test="${not empty PAM1.S_CODE}">${PAM1.ST_TIME}</c:if></td>
		  </tr>
		  <tr>
		     <td>Measurement Type</td>
		     <td>&nbsp;</td>
		     <td><c:if test="${not empty PAM1.S_CODE}">${PAM1.P_TYPE}</c:if></td>
		  </tr>
		  <tr>
		     <td>Azimuth angle</td>
		     <td>&nbsp;</td>
		     <td><c:if test="${not empty PAM1.S_CODE}">${PAM1.PAM1}</c:if></td>
		  </tr>
		  <tr>
		     <td>Elevation angle</td>
		     <td>&nbsp;</td>
		     <td><c:if test="${not empty PAM1.S_CODE}">${PAM1.PAM2}</c:if></td>
		  </tr>
		  <tr>
		     <td>Sector size</td>
		     <td>&nbsp;</td>
		     <td><c:if test="${not empty PAM1.S_CODE}">${PAM1.PAM3}</c:if></td>
		  </tr>
		  <tr>
		     <td>Scanning speed</td>
		     <td>&nbsp;</td>
		     <td><c:if test="${not empty PAM1.S_CODE}">${PAM1.PAM4}</c:if></td>
		  </tr>
		  <tr>
		     <td>Accumulation time</td>
		     <td>&nbsp;</td>
		     <td><c:if test="${not empty PAM1.S_CODE}">${PAM1.PAM5}</c:if></td>
		  </tr>
		</tbody>
	</table>
	
	<table class="mainList">
		<tbody>
		  <tr>
		     <td>Alaram Messages</td>
		     <td>&nbsp;</td>
		     <td>&nbsp;</td>
		  </tr>
		  
		</tbody>
	</table>
	
</td>
<td align="center" width="400">
	<table class="mainList">
		<tbody>
		  <tr>
		     <td>${PAM2.S_NAME} ( ${PAM2.S_CODE} )</td>
		     <td>&nbsp;</td>
		     <td>more</td>
		  </tr>
		  <tr>
		     <td>Lidar Connection STS</td>
		     <td>&nbsp;</td>
		     <td>connected</td>
		  </tr>
		  <tr>
		     <td>Lidar status</td>
		     <td>&nbsp;</td>
		     <td>scanning</td>
		  </tr>
		  <tr>
		     <td>관측 데이터 수신</td>
		     <td>&nbsp;</td>
		     <td><c:if test="${PAM2.FILE_RCV_STS == '0'}">ERR</c:if><c:if test="${PAM2.FILE_RCV_STS == '1'}">OK</c:if></td>
		  </tr>
		  <tr>
		     <td>데이터 송신 프로세스</td>
		     <td>&nbsp;</td>
		     <td><c:if test="${PAM2.PRO_STS == '0'}">ERR</c:if><c:if test="${PAM2.PRO_STS == '1'}">OK</c:if></td>
		  </tr>
		  <tr>
		     <td>최종 수신 시각</td>
		     <td>&nbsp;</td>
		     <td><c:if test="${not empty PAM2.FILE_RCV_DT}">${PAM2.FILE_RCV_DT}</c:if></td>
		  </tr>
		  <tr>
		     <td>Today 수신율</td>
		     <td>&nbsp;</td>
		     <td><c:out value="${rate02}"/>%</td>
		  </tr>
		  <tr>
		     <td>Yesterday 수신율</td>
		     <td>&nbsp;</td>
		     <td><c:out value="${yrate02}"/>%</td>
		  </tr>
		</tbody>
	</table>
	<br/>
	
	<table class="mainList">
		<tbody>
		  <tr>
		     <td>Scanning Parameters</td>
		     <td>&nbsp;</td>
		     <td>more</td>
		  </tr>
		  <tr>
		     <td>최종수신시각(UTC)</td>
		     <td>&nbsp;</td>
		     <td><c:if test="${not empty PAM2.S_CODE}">${PAM2.ST_TIME}</c:if></td>
		  </tr>
		  <tr>
		     <td>Measurement Type</td>
		     <td>&nbsp;</td>
		     <td><c:if test="${not empty PAM2.S_CODE}">${PAM2.P_TYPE}</c:if></td>
		  </tr>
		  <tr>
		     <td>Azimuth angle</td>
		     <td>&nbsp;</td>
		     <td><c:if test="${not empty PAM2.S_CODE}">${PAM2.PAM1}</c:if></td>
		  </tr>
		  <tr>
		     <td>Elevation angle</td>
		     <td>&nbsp;</td>
		     <td><c:if test="${not empty PAM2.S_CODE}">${PAM2.PAM2}</c:if></td>
		  </tr>
		  <tr>
		     <td>Sector size</td>
		     <td>&nbsp;</td>
		     <td><c:if test="${not empty PAM2.S_CODE}">${PAM2.PAM3}</c:if></td>
		  </tr>
		  <tr>
		     <td>Scanning speed</td>
		     <td>&nbsp;</td>
		     <td><c:if test="${not empty PAM2.S_CODE}">${PAM2.PAM4}</c:if></td>
		  </tr>
		  <tr>
		     <td>Accumulation time</td>
		     <td>&nbsp;</td>
		     <td><c:if test="${not empty PAM2.S_CODE}">${PAM2.PAM5}</c:if></td>
		  </tr>
		</tbody>
	</table>
	
	<table class="mainList">
		<tbody>
		  <tr>
		     <td>Alaram Messages</td>
		     <td>&nbsp;</td>
		     <td>&nbsp;</td>
		  </tr>
		  
		</tbody>
	</table>
</td>
<td align="center" width="400">
	<table class="mainList">
		<tbody>
		  <tr>
		     <td>${PAM3.S_NAME} ( ${PAM3.S_CODE} )</td>
		     <td>&nbsp;</td>
		     <td>more</td>
		  </tr>
		  <tr>
		     <td>Lidar Connection STS</td>
		     <td>&nbsp;</td>
		     <td>connected</td>
		  </tr>
		  <tr>
		     <td>Lidar status</td>
		     <td>&nbsp;</td>
		     <td>scanning</td>
		  </tr>
		  <tr>
		     <td>관측 데이터 수신</td>
		     <td>&nbsp;</td>
		     <td><c:if test="${PAM3.FILE_RCV_STS == '0'}">ERR</c:if><c:if test="${PAM3.FILE_RCV_STS == '1'}">OK</c:if></td>
		  </tr>
		  <tr>
		     <td>데이터 송신 프로세스</td>
		     <td>&nbsp;</td>
		     <td><c:if test="${PAM3.PRO_STS == '0'}">ERR</c:if><c:if test="${PAM3.PRO_STS == '1'}">OK</c:if></td>
		  </tr>
		  <tr>
		     <td>최종 수신 시각</td>
		     <td>&nbsp;</td>
		     <td><c:if test="${not empty PAM3.FILE_RCV_DT}">${PAM3.FILE_RCV_DT}</c:if></td>
		  </tr>
		  <tr>
		     <td>Today 수신율</td>
		     <td>&nbsp;</td>
		     <td><c:out value="${rate03}"/>%</td>
		  </tr>
		  <tr>
		     <td>Yesterday 수신율</td>
		     <td>&nbsp;</td>
		     <td><c:out value="${yrate03}"/>%</td>
		  </tr>
		</tbody>
	</table>
	<br/>
	
	<table class="mainList">
		<tbody>
		  <tr>
		     <td>Scanning Parameters</td>
		     <td>&nbsp;</td>
		     <td>more</td>
		  </tr>
		  <tr>
		     <td>최종수신시각(UTC)</td>
		     <td>&nbsp;</td>
		     <td><c:if test="${not empty PAM3.S_CODE}">${PAM3.ST_TIME}</c:if></td>
		  </tr>
		  <tr>
		     <td>Measurement Type</td>
		     <td>&nbsp;</td>
		     <td><c:if test="${not empty PAM3.S_CODE}">${PAM3.P_TYPE}</c:if></td>
		  </tr>
		  <tr>
		     <td>Azimuth angle</td>
		     <td>&nbsp;</td>
		     <td><c:if test="${not empty PAM3.S_CODE}">${PAM3.PAM1}</c:if></td>
		  </tr>
		  <tr>
		     <td>Elevation angle</td>
		     <td>&nbsp;</td>
		     <td><c:if test="${not empty PAM3.S_CODE}">${PAM3.PAM2}</c:if></td>
		  </tr>
		  <tr>
		     <td>Sector size</td>
		     <td>&nbsp;</td>
		     <td><c:if test="${not empty PAM3.S_CODE}">${PAM3.PAM3}</c:if></td>
		  </tr>
		  <tr>
		     <td>Scanning speed</td>
		     <td>&nbsp;</td>
		     <td><c:if test="${not empty PAM3.S_CODE}">${PAM3.PAM4}</c:if></td>
		  </tr>
		  <tr>
		     <td>Accumulation time</td>
		     <td>&nbsp;</td>
		     <td><c:if test="${not empty PAM3.S_CODE}">${PAM3.PAM5}</c:if></td>
		  </tr>
		</tbody>
	</table>
	
	<table class="mainList">
		<tbody>
		  <tr>
		     <td>Alaram Messages</td>
		     <td>&nbsp;</td>
		     <td>&nbsp;</td>
		  </tr>
		  
		</tbody>
	</table>
</td>	
</tr>
</table>	
	</form>	
</div>
	
	<%@ include file="/WEB-INF/include/body.jsp" %>
	<script type="text/javascript">
		$(document).ready(function(){
			
			if ("${commandMap.msg}" != "")
			{
				alert("${commandMap.msg}");
			} 
			
			$("#login").on("click", function(e){ //로그인 하기  버튼
				e.preventDefault();
				fn_loginProcess();
			});	
		});
		
		
		function fn_loginProcess(){
			if (frm.id.value == "")
			{
			   alert("아이디를 입력하세요!!!");
			   frm.id.focus();
			   return;
			}
			if (frm.pass.value == "")
			{
			   alert("패스워드를 입력하세요!!!");
			   frm.pass.focus();
			   return;
			}
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='/userLogin.do' />");
			comSubmit.submit();
		}
	</script>	
</body>
</html>