<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="com.hist.windlidar.common.CommonUtil" %>
<%@ page import="com.hist.windlidar.common.SessionClass" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 


<!DOCTYPE html>
<html lang="ko">
	<head>
    	<meta charset="utf-8" />
        <title>Current Alarm Message</title>
        <link rel="stylesheet" href="<c:url value='/css/common.css'/>" />
        <link rel="stylesheet" href="<c:url value='/css/layout.css'/>" />
<link rel="stylesheet" href="https://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="https://code.jquery.com/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script src="<c:url value='/js/common.js'/>" charset="utf-8"></script>

    </head>
    <script type="text/javascript">
        function end() {
	       window.close();
        }
    </script>
    <body>
        <div id="wrap">
            <div id="section"> 
                <div class="container_pop">
                    <h3><img src="image/icon_wind.png" style="margin-bottom:6px">Current Alarm Message - ${ST_TIME.S_NAME} (${ST_TIME.S_CODE})</h3>        

                    <table class="table_view" style="margin-top:15px">
                        <colgroup>
                            <col width="30%" />
                            <col width="30%" /> 
                            <col width="40%" />
                        </colgroup>
                        <tr>
                            <th>최종수신시각(UTC)</th>
                            <td colspan="2">${ST_TIME.ST_TIME}</td>
                        </tr>
                        
                        <c:forEach var="entry" items="${ALM}" varStatus="status">
                        <tr> 
                           <th>${entry.key}</th> 
                           <td colspan="2">${entry.value}</td>
                        </tr>
                        </c:forEach>   
                            
                                                    
                        <!--  tr>
                            <th>Lidar connection State</th>
                            <td colspan="2">no connection</td>
                        </tr>
                        <tr>
                            <th>Lidar status</th>
                            <td colspan="2">ready for operation</td>
                        </tr>
                        <tr>
                            <th rowspan="4">Status Element</th>                            
                            <td class="bg_blue">Connect State</td>
                            <td>Yes</td>
                        </tr>
                        <tr>                         
                            <td class="bg_blue">Start State</td>
                            <td>Yes</td>
                        </tr>
                        <tr>                         
                            <td class="bg_blue">Gps State</td>
                            <td>Yes</td>
                        </tr>
                        <tr>                         
                            <td class="bg_blue">Scanner State</td>
                            <td>Yes</td>
                        </tr>
                        <tr>
                            <th>Error Element</th>                            
                            <td class="bg_blue">WindProfilerCyclogram</td>
                            <td>Device error; ProfileProcessor init error</td>
                        </tr  -->
                    </table>  
                    <button type="button" class="btn_blue fl_right" onclick="end()" style="margin-top:15px">닫기</button>
                </div>
            </div>
        </div>
    </body>
</html>