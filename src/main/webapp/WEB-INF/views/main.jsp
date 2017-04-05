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
             <td><a href="#" id="pam01">more</a></td>
		  </tr>
		  <tr>
		     <td>Lidar Connection STS</td>
		     <td>&nbsp;</td>
		     <td><c:if test="${not empty ALM01.RemoteConnect}"><c:out value="${ALM01.RemoteConnect}"/></c:if></td>
		  </tr>
		  <tr>
		     <td>Lidar status</td>
		     <td>&nbsp;</td>
		     <td><c:if test="${not empty ALM01.LidarState}"><c:out value="${ALM01.LidarState}"/></c:if></td>
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
		     <td><a href="#" id="scan01">more</a></td>
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
        <c:forEach var="entry" items="${ALM01}" varStatus="status">
          <tr> 
             <td>${entry.key}</td> 
             <td>${entry.value}</td>
             <td>&nbsp;</td>
          </tr>
        </c:forEach>
		</tbody>
	</table>
	
</td>
<td align="center" width="400">
	<table class="mainList">
		<tbody>
		  <tr>
		     <td>${PAM2.S_NAME} ( ${PAM2.S_CODE} )</td>
		     <td>&nbsp;</td>
             <td><a href="#" id="pam02">more</a></td>
		  </tr>
		  <tr>
		     <td>Lidar Connection STS</td>
		     <td>&nbsp;</td>
		     <td><c:if test="${not empty ALM02.RemoteConnect}"><c:out value="${ALM02.RemoteConnect}"/></c:if></td>
		  </tr>
		  <tr>
		     <td>Lidar status</td>
		     <td>&nbsp;</td>
		     <td><c:if test="${not empty ALM02.LidarState}"><c:out value="${ALM02.LidarState}"/></c:if></td>
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
		     <td><a href="#" id="scan02">more</a></td>
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
        <c:forEach var="entry" items="${ALM02}" varStatus="status">
          <tr> 
             <td>${entry.key}</td> 
             <td>${entry.value}</td>
             <td>&nbsp;</td>
          </tr>
        </c:forEach>		  
		</tbody>
	</table>
</td>
<td align="center" width="400">
	<table class="mainList">
		<tbody>
		  <tr>
		     <td>${PAM3.S_NAME} ( ${PAM3.S_CODE} )</td>
		     <td>&nbsp;</td>
             <td><a href="#" id="pam03">more</a></td>
		  </tr>
		  <tr>
		     <td>Lidar Connection STS</td>
		     <td>&nbsp;</td>
		     <td><c:if test="${not empty ALM03.RemoteConnect}"><c:out value="${ALM03.RemoteConnect}"/></c:if></td>
		  </tr>
		  <tr>
		     <td>Lidar status</td>
		     <td>&nbsp;</td>
		     <td><c:if test="${not empty ALM03.LidarState}"><c:out value="${ALM03.LidarState}"/></c:if></td>
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
		     <td><a href="#" id="scan03">more</a></td>
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
        <c:forEach var="entry" items="${ALM03}" varStatus="status">
          <tr> 
             <td>${entry.key}</td> 
             <td>${entry.value}</td>
             <td>&nbsp;</td>
          </tr>
        </c:forEach>		  
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
			
			$("#scan01").on("click", function(e){ 
				e.preventDefault();
				fn_scanGoUrl("13211");
			});	
			$("#scan02").on("click", function(e){ 
				e.preventDefault();
				fn_scanGoUrl("13210");
			});	
			$("#scan03").on("click", function(e){ 
				e.preventDefault();
				fn_scanGoUrl("13206");
			});	
			$("#pam01").on("click", function(e){ 
				e.preventDefault();
				fn_pamGoUrl("13211");
			});	
			$("#pam02").on("click", function(e){ 
				e.preventDefault();
				fn_pamGoUrl("13210");
			});	
			$("#pam03").on("click", function(e){ 
				e.preventDefault();
				fn_pamGoUrl("13206");
			});	
		});

		Date.prototype.yyyymmdd = function() {
			  var yyyy = this.getFullYear().toString();
			  var mm = (this.getMonth()+1).toString(); // getMonth() is zero-based
			  var dd  = this.getDate().toString();
			  return yyyy + "-" + (mm[1]?mm:"0"+mm[0]) + "-" + (dd[1]?dd:"0"+dd[0]); // padding
			};
			
		
		function fn_scanGoUrl(s_code)
		{
			var comSubmit = new ComSubmit("frm");
			comSubmit.addParam("s_code", s_code);
			comSubmit.setUrl("<c:url value='/scanList.do'/>");
			comSubmit.submit();
		}
		
		function fn_pamGoUrl(s_code)
		{
			var comSubmit = new ComSubmit("frm");
			var date = new Date();
			comSubmit.addParam("s_code", s_code);
			comSubmit.addParam("s_date", date.yyyymmdd());
			comSubmit.setUrl("<c:url value='/windLidarHList.do'/>");
			comSubmit.submit();
		}
	</script>	
</body>
</html>