<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/header.jsp" %>

<%
   SessionClass user = (SessionClass)session.getAttribute("user");
%>
<form id="frm">
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


            <div id="section"> 
                <div class="container">
                    <div class="wind_box fl_left" style="margin-right:25px">
                        <h1 class="fl_left"><img src="image/icon_wind.png" style="margin-bottom:6px">${PAM1.S_NAME} (${PAM1.S_CODE})</h1>
                        <button type="button" id="pam01" class="btn_more fl_right">MORE</button>
                        <div class="status fl_left">
                            <div class="box2 s_01" style="margin-right:5px">
                                <span class="white">Lidar Connections STS</span> <br/>
                                <c:if test="${not empty ALM01.RemoteConnect}"> 
                                   <img src="image/sts_blue.png" style="margin-bottom:6px;margin-right:4px;">
                                   <span class="blue"><c:out value="${ALM01.RemoteConnect}"/></span>
                                </c:if>
                                <c:if test="${empty ALM01.RemoteConnect}">
                                   <img src="image/sts_red.png" style="margin-bottom:6px;margin-right:4px;">
                                   <span class="red">N/A</span>
                                </c:if>                                
                            </div>
                            <div class="box2 s_01">
                                <span class="white">Lidar Status</span> <br/> 
                                <span class="gray">
                                  <c:if test="${not empty ALM01.LidarState}"><c:out value="${ALM01.LidarState}"/></c:if>
                                  <c:if test="${empty ALM01.LidarState}">N/A</c:if>
                                </span>
                            </div>
                            <div class="box2 s_01" style="margin-right:5px;margin-top:5px">
                                <span class="white">관측데이터 수신</span> <br/>
                                <c:if test="${PAM1.FILE_RCV_STS == '1'}"> 
                                   <img src="image/sts_blue.png" style="margin-bottom:6px;margin-right:4px;">
                                   <span class="blue">OK</span>
                                </c:if>
                                <c:if test="${PAM1.FILE_RCV_STS == '0'}">
                                   <img src="image/sts_red.png" style="margin-bottom:6px;margin-right:4px;">
                                   <span class="red">ERR</span>                                
                                </c:if>   
                            </div>
                            <div class="box2 s_01"  style="margin-top:5px">
                                <span class="white">데이터 송신 프로세스</span> <br/> 
                                <c:if test="${PAM1.PRO_STS == '1'}">
                                  <img src="image/sts_blue.png" style="margin-bottom:6px;margin-right:4px;">
                                  <span class="blue">OK</span>
                                </c:if>
                                <c:if test="${PAM1.PRO_STS == '0'}">
                                  <img src="image/sts_red.png" style="margin-bottom:6px;margin-right:4px;">
                                  <span class="red">ERR</span>                                
                                </c:if>
                            </div>
                            <div class="box2 s_02" style="margin-right:5px;margin-top:5px">
                                <span class="white">최종수신시각(UTC)</span>
                            </div>
                            <div class="box2 s_02_1"  style="margin-top:5px">
                                <span class="gray"><c:if test="${not empty PAM1.FILE_RCV_DT}">${PAM1.FILE_RCV_DT}</c:if></span>
                            </div>
                            <div class="box2 s_03" style="margin-right:5px;margin-top:5px">
                                <span class="white">Today 수신율</span>
                            </div>
                            <div class="box2 s_03_1"  style="margin-top:5px; padding-right:185px;">
                                <progress min="0" max="100" value="<c:out value="${rate01}"/>"></progress>
                                <span class="gray" style="padding-left:142px;"><c:out value="${rate01}"/>%</span>
                            </div>
                            <div class="box2 s_03" style="margin-right:5px;margin-top:5px">
                                <span class="white">Yesterday 수신율</span>
                            </div>
                            <div class="box2 s_03_1"  style="margin-top:5px; padding-right:185px;">
                                <progress min="0" max="100" value="${yrate01}"></progress>
                                <span class="gray" style="padding-left:142px;">${yrate01}%</span>
                            </div>
                        </div>
                        
                        <h2 class="fl_left">Scanning Parameters</h2>
                        <button type="button" class="btn_more fl_right" id="scan01">MORE</button>
                        <table class="table_scan">
                            <colgroup>
                                <col width="45%">
                                <col width="55%">
                            </colgroup>
                            <tr>
                                <th>최종수신시간 (UTC)</th>
                                <td><c:if test="${not empty PAM1.S_CODE}">${PAM1.ST_TIME}</c:if></td>
                            </tr>
                            <tr>
                                <th>Measurement Type</th>
                                <td><c:if test="${not empty PAM1.S_CODE}">${PAM1.P_TYPE}</c:if></td>
                            </tr>
                            <tr>
                                <th>Azimuth Angle</th>
                                <td><c:if test="${not empty PAM1.S_CODE}">${PAM1.PAM1}</c:if></td>
                            </tr>
                            <tr>
                                <th>Elevation Angle</th>
                                <td><c:if test="${not empty PAM1.S_CODE}">${PAM1.PAM2}</c:if></td>
                            </tr>
                            <tr>
                                <th>Sector Size</th>
                                <td><c:if test="${not empty PAM1.S_CODE}">${PAM1.PAM3}</c:if></td>
                            </tr>
                            <tr>
                                <th>Scanning Speed</th>
                                <td><c:if test="${not empty PAM1.S_CODE}">${PAM1.PAM4}</c:if></td>
                            </tr>
                            <tr>
                                <th>Accumulation Time</th>
                                <td><c:if test="${not empty PAM1.S_CODE}">${PAM1.PAM5}</c:if></td>
                            </tr>
                        </table>
                        
                        <h2 class="fl_left">Alaram Message</h2>
                        <button type="button" class="btn_more fl_right" onclick="alarm()">MORE</button>
                        <table class="table_alaram">
                            <colgroup>
                                <col width="45%">
                                <col width="55%">
                            </colgroup>
                            <c:forEach var="entry" items="${ALM01}" varStatus="status">
                            <tr> 
                               <th>${entry.key}</th> 
                               <td>${entry.value}</td>
                            </tr>
                            </c:forEach>                           
                        </table>
                    </div>
                    
                    <div class="wind_box fl_left" style="margin-right:25px">
                        <h1 class="fl_left"><img src="image/icon_wind.png" style="margin-bottom:6px">${PAM2.S_NAME} ( ${PAM2.S_CODE} )</h1>
                        <button type="button" id="pam02" class="btn_more fl_right">MORE</button>
                        <div class="status fl_left">
                        
                            <div class="box2 s_01" style="margin-right:5px">
                                <span class="white">Lidar Connections STS</span> <br/>
                                <c:if test="${not empty ALM02.RemoteConnect}"> 
                                   <img src="image/sts_blue.png" style="margin-bottom:6px;margin-right:4px;">
                                   <span class="blue"><c:out value="${ALM02.RemoteConnect}"/></span>
                                </c:if>
                                <c:if test="${empty ALM02.RemoteConnect}">
                                   <img src="image/sts_red.png" style="margin-bottom:6px;margin-right:4px;">
                                   <span class="red">N/A</span>
                                </c:if>                                
                            </div>
                            <div class="box2 s_01">
                                <span class="white">Lidar Status</span> <br/> 
                                <span class="gray">
                                  <c:if test="${not empty ALM02.LidarState}"><c:out value="${ALM02.LidarState}"/></c:if>
                                  <c:if test="${empty ALM02.LidarState}">N/A</c:if>
                                </span>
                            </div>
                            <div class="box2 s_01" style="margin-right:5px;margin-top:5px">
                                <span class="white">관측데이터 수신</span> <br/>
                                <c:if test="${PAM2.FILE_RCV_STS == '1'}"> 
                                   <img src="image/sts_blue.png" style="margin-bottom:6px;margin-right:4px;">
                                   <span class="blue">OK</span>
                                </c:if>
                                <c:if test="${PAM2.FILE_RCV_STS == '0'}">
                                   <img src="image/sts_red.png" style="margin-bottom:6px;margin-right:4px;">
                                   <span class="red">ERR</span>                                
                                </c:if>   
                            </div>
                            <div class="box2 s_01"  style="margin-top:5px">
                                <span class="white">데이터 송신 프로세스</span> <br/> 
                                <c:if test="${PAM2.PRO_STS == '1'}">
                                  <img src="image/sts_blue.png" style="margin-bottom:6px;margin-right:4px;">
                                  <span class="blue">OK</span>
                                </c:if>
                                <c:if test="${PAM2.PRO_STS == '0'}">
                                  <img src="image/sts_red.png" style="margin-bottom:6px;margin-right:4px;">
                                  <span class="red">ERR</span>                                
                                </c:if>
                            </div>
                            <div class="box2 s_02" style="margin-right:5px;margin-top:5px">
                                <span class="white">최종수신시각(UTC)</span>
                            </div>
                            <div class="box2 s_02_1"  style="margin-top:5px">
                                <span class="gray"><c:if test="${not empty PAM2.FILE_RCV_DT}">${PAM2.FILE_RCV_DT}</c:if></span>
                            </div>
                            <div class="box2 s_03" style="margin-right:5px;margin-top:5px">
                                <span class="white">Today 수신율</span>
                            </div>
                            <div class="box2 s_03_1"  style="margin-top:5px; padding-right:185px;">
                                <progress min="0" max="100" value="<c:out value="${rate02}"/>"></progress>
                                <span class="gray" style="padding-left:142px;"><c:out value="${rate02}"/>%</span>
                            </div>
                            <div class="box2 s_03" style="margin-right:5px;margin-top:5px">
                                <span class="white">Yesterday 수신율</span>
                            </div>
                            <div class="box2 s_03_1"  style="margin-top:5px; padding-right:185px;">
                                <progress min="0" max="100" value="${yrate02}"></progress>
                                <span class="gray" style="padding-left:142px;">${yrate02}%</span>
                            </div>

                        </div>
                        
                        <h2 class="fl_left">Scanning Parameters</h2>
                        <button type="button" id="scan02" class="btn_more fl_right">MORE</button>
                        <table class="table_scan">
                            <colgroup>
                                <col width="45%">
                                <col width="55%">
                            </colgroup>
                            <tr>
                                <th>최종수신시간 (UTC)</th>
                                <td><c:if test="${not empty PAM2.S_CODE}">${PAM2.ST_TIME}</c:if></td>
                            </tr>
                            <tr>
                                <th>Measurement Type</th>
                                <td><c:if test="${not empty PAM2.S_CODE}">${PAM2.P_TYPE}</c:if></td>
                            </tr>
                            <tr>
                                <th>Azimuth Angle</th>
                                <td><c:if test="${not empty PAM2.S_CODE}">${PAM2.PAM1}</c:if></td>
                            </tr>
                            <tr>
                                <th>Elevation Angle</th>
                                <td><c:if test="${not empty PAM2.S_CODE}">${PAM2.PAM2}</c:if></td>
                            </tr>
                            <tr>
                                <th>Sector Size</th>
                                <td><c:if test="${not empty PAM2.S_CODE}">${PAM2.PAM3}</c:if></td>
                            </tr>
                            <tr>
                                <th>Scanning Speed</th>
                                <td><c:if test="${not empty PAM2.S_CODE}">${PAM2.PAM4}</c:if></td>
                            </tr>
                            <tr>
                                <th>Accumulation Time</th>
                                <td><c:if test="${not empty PAM2.S_CODE}">${PAM2.PAM5}</c:if></td>
                            </tr>
                        </table>
                        
                        <h2 class="fl_left">Alaram Message</h2>
                        <button type="button" class="btn_more fl_right">MORE</button>
                        <table class="table_alaram">
                            <colgroup>
                                <col width="45%">
                                <col width="55%">
                            </colgroup>
                            <c:forEach var="entry" items="${ALM02}" varStatus="status">
                            <tr> 
                               <th>${entry.key}</th> 
                               <td>${entry.value}</td>
                            </tr>
                            </c:forEach>
                        </table>
                    </div>
                    
                    <div class="wind_box fl_left">
                        <h1 class="fl_left"><img src="image/icon_wind.png" style="margin-bottom:6px">${PAM3.S_NAME} ( ${PAM3.S_CODE} )</h1>
                        <button type="button" id="pam03" class="btn_more fl_right">MORE</button>
                        <div class="status fl_left">
                            <div class="box2 s_01" style="margin-right:5px">
                                <span class="white">Lidar Connections STS</span> <br/>
                                <c:if test="${not empty ALM03.RemoteConnect}"> 
                                   <img src="image/sts_blue.png" style="margin-bottom:6px;margin-right:4px;">
                                   <span class="blue"><c:out value="${ALM03.RemoteConnect}"/></span>
                                </c:if>
                                <c:if test="${empty ALM03.RemoteConnect}">
                                   <img src="image/sts_red.png" style="margin-bottom:6px;margin-right:4px;">
                                   <span class="red">N/A</span>
                                </c:if>                                
                            </div>
                            <div class="box2 s_01">
                                <span class="white">Lidar Status</span> <br/> 
                                <span class="gray">
                                  <c:if test="${not empty ALM03.LidarState}"><c:out value="${ALM03.LidarState}"/></c:if>
                                  <c:if test="${empty ALM03.LidarState}">N/A</c:if>
                                </span>
                            </div>
                            <div class="box2 s_01" style="margin-right:5px;margin-top:5px">
                                <span class="white">관측데이터 수신</span> <br/>
                                <c:if test="${PAM3.FILE_RCV_STS == '1'}"> 
                                   <img src="image/sts_blue.png" style="margin-bottom:6px;margin-right:4px;">
                                   <span class="blue">OK</span>
                                </c:if>
                                <c:if test="${PAM3.FILE_RCV_STS == '0'}">
                                   <img src="image/sts_red.png" style="margin-bottom:6px;margin-right:4px;">
                                   <span class="red">ERR</span>                                
                                </c:if>   
                            </div>
                            <div class="box2 s_01"  style="margin-top:5px">
                                <span class="white">데이터 송신 프로세스</span> <br/> 
                                <c:if test="${PAM3.PRO_STS == '1'}">
                                  <img src="image/sts_blue.png" style="margin-bottom:6px;margin-right:4px;">
                                  <span class="blue">OK</span>
                                </c:if>
                                <c:if test="${PAM3.PRO_STS == '0'}">
                                  <img src="image/sts_red.png" style="margin-bottom:6px;margin-right:4px;">
                                  <span class="red">ERR</span>                                
                                </c:if>
                            </div>
                            <div class="box2 s_02" style="margin-right:5px;margin-top:5px">
                                <span class="white">최종수신시각(UTC)</span>
                            </div>
                            <div class="box2 s_02_1"  style="margin-top:5px">
                                <span class="gray"><c:if test="${not empty PAM3.FILE_RCV_DT}">${PAM3.FILE_RCV_DT}</c:if></span>
                            </div>
                            <div class="box2 s_03" style="margin-right:5px;margin-top:5px">
                                <span class="white">Today 수신율</span>
                            </div>
                            <div class="box2 s_03_1"  style="margin-top:5px; padding-right:185px;">
                                <progress min="0" max="100" value="<c:out value="${rate03}"/>"></progress>
                                <span class="gray" style="padding-left:142px;"><c:out value="${rate03}"/>%</span>
                            </div>
                            <div class="box2 s_03" style="margin-right:5px;margin-top:5px">
                                <span class="white">Yesterday 수신율</span>
                            </div>
                            <div class="box2 s_03_1"  style="margin-top:5px; padding-right:185px;">
                                <progress min="0" max="100" value="${yrate03}"></progress>
                                <span class="gray" style="padding-left:142px;">${yrate03}%</span>
                            </div>
                        </div>
                        
                        <h2 class="fl_left">Scanning Parameters</h2>
                        <button type="button" id="scan03" class="btn_more fl_right">MORE</button>
                        <table class="table_scan">
                            <colgroup>
                                <col width="45%">
                                <col width="55%">
                            </colgroup>
                            <tr>
                                <th>최종수신시간 (UTC)</th>
                                <td><c:if test="${not empty PAM3.S_CODE}">${PAM3.ST_TIME}</c:if></td>
                            </tr>
                            <tr>
                                <th>Measurement Type</th>
                                <td><c:if test="${not empty PAM3.S_CODE}">${PAM3.P_TYPE}</c:if></td>
                            </tr>
                            <tr>
                                <th>Azimuth Angle</th>
                                <td><c:if test="${not empty PAM3.S_CODE}">${PAM3.PAM1}</c:if></td>
                            </tr>
                            <tr>
                                <th>Elevation Angle</th>
                                <td><c:if test="${not empty PAM3.S_CODE}">${PAM3.PAM2}</c:if></td>
                            </tr>
                            <tr>
                                <th>Sector Size</th>
                                <td><c:if test="${not empty PAM3.S_CODE}">${PAM3.PAM3}</c:if></td>
                            </tr>
                            <tr>
                                <th>Scanning Speed</th>
                                <td><c:if test="${not empty PAM3.S_CODE}">${PAM3.PAM4}</c:if></td>
                            </tr>
                            <tr>
                                <th>Accumulation Time</th>
                                <td><c:if test="${not empty PAM3.S_CODE}">${PAM3.PAM5}</c:if></td>
                            </tr>
                        </table>
                        
                        <h2 class="fl_left">Alaram Message</h2>
                        <button type="button" class="btn_more fl_right">MORE</button>
                        <table class="table_alaram">
                            <colgroup>
                                <col width="45%">
                                <col width="55%">
                            </colgroup>
                            <c:forEach var="entry" items="${ALM03}" varStatus="status">
                            <tr> 
                               <th>${entry.key}</th> 
                               <td>${entry.value}</td>
                            </tr>
                            </c:forEach>
                        </table>
                    </div>
                
                </div>
            </div>
 </form>  	
	<%@ include file="/WEB-INF/include/body.jsp" %>
	<%@ include file="/WEB-INF/include/footer.jsp" %>
	
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
		
		var AjaxSearch = function(){
			$.ajax ({
				url : "/windlidar/ajax/connSearch", 
				type : "get",
				data : { "s_code" :  "13211" },
				success : function(responseData) {
					$("#ajax").remove();
					var data = JSON.parse(responseData);
					if (data != null)
					{
					   // alert(data.ST_TIME);
					}
				}
			});
		};
		setTimeout(AjaxSearch, 10000);
	</script>	