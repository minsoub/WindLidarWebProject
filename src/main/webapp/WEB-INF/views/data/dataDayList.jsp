<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="com.hist.windlidar.common.CommonUtil" %>
<%@ include file="/WEB-INF/include/header.jsp" %>


            <div id="section"> 
                <div class="container">
                    <h3><img src="image/icon_wind.png" style="margin-bottom:6px">일별 관측자료 수신 통계 - 
                    	<c:if test="${commandMap.s_code == 13211}">일산(13211)</c:if>
	                    <c:if test="${commandMap.s_code == 13210}">송도(13210)</c:if>
	                    <c:if test="${commandMap.s_code == 13206}">구로(13206)</c:if>
                    </h3>
                    <div class="search_box">
                            <fieldset>
                                <legend>검색</legend>
                                                                관측소별
                                <select id="s_code" name="select_location" class="sel" style="margin-right:25px;margin-left:10px">
                                  <option value="13211" <c:if test="${commandMap.s_code == 13211}">selected</c:if>>일산(13211)</option>
                                  <option value="13210" <c:if test="${commandMap.s_code == 13210}">selected</c:if>>송도(13210)</option>
                                  <option value="13206" <c:if test="${commandMap.s_code == 13206}">selected</c:if>>구로(13206)</option>
                                </select>
                                                                날짜
                               <select id="s_year" name="select_year" class="sel" style="margin-left:10px">
                               <% int year = Integer.parseInt(CommonUtil.getInstance().getCurrentFormat("yyyy")); %>       
                               <c:forEach var="year" begin="<%=year-2%>" end="<%=year%>">
                                  <option value="<c:out value="${year}"/>" <c:if test="${commandMap.s_year == year}">selected</c:if>><c:out value="${year}"/>년</option>
                               </c:forEach>         
                               </select>
                               
                               <select id="s_mon" name="select_month" class="sel">
                               <c:forEach var="mon" begin="1" end="12">
                                  <c:if test="${mon < 10}"><c:set var="mm" value="0${mon}"/></c:if><c:if test="${mon >= 10}"><c:set var="mm" value="${mon}"/></c:if>
                                  <option value="<c:out value="${mm}"/>" <c:if test="${commandMap.s_mon == mm}">selected</c:if>><c:out value="${mm}"/>월</option>
                               </c:forEach>
                               </select>
                               
                               <button type="button" id="search" class="btn_search" onclick="">검색</button>
                            </fieldset>                             
                    </div>
                    <div class="box1" style="margin:7px">
                        <time pubdate><strong>${commandMap.s_year}년 ${commandMap.s_mon}월</strong></time> 
                    </div>
                    <div class="box s_04_1"  style="margin:7px; padding-right:230px;">
                        <progress  id="t_grap" min="0" max="100" value="90"></progress>
                        <span class="red"  id="t_rate" style="margin:150px; padding-right:0px;">90%</span> 
                    </div>                   

                    <table class="table_list" style="margin-top:15px">
                        <thead>
                            <tr>
                                <th>일자</th>
                                <th>00시</th>
                                <th>01시</th>
                                <th>02시</th>
                                <th>03시</th>
                                <th>04시</th>
                                <th>05시</th>
                                <th>06시</th>
                                <th>07시</th>
                                <th>08시</th>
                                <th>09시</th>
                                <th>10시</th>
                                <th>11시</th>
                                <th>12시</th>
                                <th>13시</th>
                                <th>14시</th>
                                <th>15시</th>
                                <th>16시</th>
                                <th>17시</th>
                                <th>18시</th>
                                <th>19시</th>
                                <th>20시</th>
                                <th>21시</th>
                                <th>22시</th>
                                <th>23시</th>
                                <th>수신율</th>
                            </tr>
                        </thead>
                        <tbody>
            <c:set var="t_avg" value="0"/>	  
            <c:set var="t_h00" value="0"/>
            <c:set var="t_h01" value="0"/>
            <c:set var="t_h02" value="0"/>
            <c:set var="t_h03" value="0"/>
            <c:set var="t_h04" value="0"/>
            <c:set var="t_h05" value="0"/>
            <c:set var="t_h06" value="0"/>
            <c:set var="t_h07" value="0"/>
            <c:set var="t_h08" value="0"/>
            <c:set var="t_h09" value="0"/>
            <c:set var="t_h10" value="0"/>
            <c:set var="t_h11" value="0"/>
            <c:set var="t_h12" value="0"/>
            <c:set var="t_h13" value="0"/>
            <c:set var="t_h14" value="0"/>
            <c:set var="t_h15" value="0"/>
            <c:set var="t_h16" value="0"/>
            <c:set var="t_h17" value="0"/>
            <c:set var="t_h18" value="0"/>
            <c:set var="t_h19" value="0"/>
            <c:set var="t_h20" value="0"/>
            <c:set var="t_h21" value="0"/>
            <c:set var="t_h22" value="0"/> 
            <c:set var="t_h23" value="0"/>         
			<c:choose>
				<c:when test="${fn:length(list) > 0}">
					<c:forEach items="${list}" var="row" varStatus="status">
						<tr>
							<td class="bold">${row.ST_DAY}일</td>	
							<td>${row.H_TIME00}</td>				
							<td>${row.H_TIME01}</td>
							<td>${row.H_TIME02}</td>
							<td>${row.H_TIME03}</td>
							<td>${row.H_TIME04}</td>
							<td>${row.H_TIME05}</td>
							<td>${row.H_TIME06}</td>
							<td>${row.H_TIME07}</td>
							<td>${row.H_TIME08}</td>
							<td>${row.H_TIME09}</td>
							<td>${row.H_TIME10}</td>
							<td>${row.H_TIME11}</td>
							<td>${row.H_TIME12}</td>
							<td>${row.H_TIME13}</td>
							<td>${row.H_TIME14}</td>
							<td>${row.H_TIME15}</td>
							<td>${row.H_TIME16}</td>
							<td>${row.H_TIME17}</td>
							<td>${row.H_TIME18}</td>
							<td>${row.H_TIME19}</td>
							<td>${row.H_TIME20}</td>
							<td>${row.H_TIME21}</td>
							<td>${row.H_TIME22}</td>
							<td>${row.H_TIME23}</td>
								
							<td>${row.AVG}</td>
						</tr>
						<c:set var="t_h00" value="${t_h00 + row.H_TIME00}"/>
						<c:set var="t_h01" value="${t_h01 + row.H_TIME01}"/>
						<c:set var="t_h02" value="${t_h02 + row.H_TIME02}"/>
						<c:set var="t_h03" value="${t_h03 + row.H_TIME03}"/>
						<c:set var="t_h04" value="${t_h04 + row.H_TIME04}"/>
						<c:set var="t_h05" value="${t_h05 + row.H_TIME05}"/>
						<c:set var="t_h06" value="${t_h06 + row.H_TIME06}"/>
						<c:set var="t_h07" value="${t_h07 + row.H_TIME07}"/>
						<c:set var="t_h08" value="${t_h08 + row.H_TIME08}"/>
						<c:set var="t_h09" value="${t_h09 + row.H_TIME09}"/>
						<c:set var="t_h10" value="${t_h10 + row.H_TIME10}"/>
						<c:set var="t_h11" value="${t_h11 + row.H_TIME11}"/>
						<c:set var="t_h12" value="${t_h12 + row.H_TIME12}"/>
						<c:set var="t_h13" value="${t_h13 + row.H_TIME13}"/>
						<c:set var="t_h14" value="${t_h14 + row.H_TIME14}"/>
						<c:set var="t_h15" value="${t_h15 + row.H_TIME15}"/>
						<c:set var="t_h16" value="${t_h16 + row.H_TIME16}"/>
						<c:set var="t_h17" value="${t_h17 + row.H_TIME17}"/>
						<c:set var="t_h18" value="${t_h18 + row.H_TIME18}"/>
						<c:set var="t_h19" value="${t_h19 + row.H_TIME19}"/>
						<c:set var="t_h20" value="${t_h20 + row.H_TIME20}"/>
						<c:set var="t_h21" value="${t_h21 + row.H_TIME21}"/>
						<c:set var="t_h22" value="${t_h22 + row.H_TIME22}"/>
						<c:set var="t_h23" value="${t_h23 + row.H_TIME23}"/>
						<c:set var="t_avg" value="${t_avg + row.AVG}"/>	
						
					</c:forEach>
					<c:set var="t_avg" value="${t_avg/fn:length(list)}"/>	
					<c:set var="t_avg" value="${t_avg - (t_avg % 1)}"/>	
					
						<c:set var="t_h00" value="${t_h00/fn:length(list)}"/>
						<c:set var="t_h01" value="${t_h01/fn:length(list)}"/>
						<c:set var="t_h02" value="${t_h02/fn:length(list)}"/>
						<c:set var="t_h03" value="${t_h03/fn:length(list)}"/>
						<c:set var="t_h04" value="${t_h04/fn:length(list)}"/>
						<c:set var="t_h05" value="${t_h05/fn:length(list)}"/>
						<c:set var="t_h06" value="${t_h06/fn:length(list)}"/>
						<c:set var="t_h07" value="${t_h07/fn:length(list)}"/>
						<c:set var="t_h08" value="${t_h08/fn:length(list)}"/>
						<c:set var="t_h09" value="${t_h09/fn:length(list)}"/>
						<c:set var="t_h10" value="${t_h10/fn:length(list)}"/>
						<c:set var="t_h11" value="${t_h11/fn:length(list)}"/>
						<c:set var="t_h12" value="${t_h12/fn:length(list)}"/>
						<c:set var="t_h13" value="${t_h13/fn:length(list)}"/>
						<c:set var="t_h14" value="${t_h14/fn:length(list)}"/>
						<c:set var="t_h15" value="${t_h15/fn:length(list)}"/>
						<c:set var="t_h16" value="${t_h16/fn:length(list)}"/>
						<c:set var="t_h17" value="${t_h17/fn:length(list)}"/>
						<c:set var="t_h18" value="${t_h18/fn:length(list)}"/>
						<c:set var="t_h19" value="${t_h19/fn:length(list)}"/>
						<c:set var="t_h20" value="${t_h20/fn:length(list)}"/>
						<c:set var="t_h21" value="${t_h21/fn:length(list)}"/>
						<c:set var="t_h22" value="${t_h22/fn:length(list)}"/>
						<c:set var="t_h23" value="${t_h23/fn:length(list)}"/>
						
						<c:set var="t_h00" value="${t_h00 - (t_h00 % 1)}"/>
						<c:set var="t_h01" value="${t_h01 - (t_h01 % 1)}"/>
						<c:set var="t_h02" value="${t_h02 - (t_h02 % 1)}"/>
						<c:set var="t_h03" value="${t_h03 - (t_h03 % 1)}"/>
						<c:set var="t_h04" value="${t_h04 - (t_h04 % 1)}"/>
						<c:set var="t_h05" value="${t_h05 - (t_h05 % 1)}"/>
						<c:set var="t_h06" value="${t_h06 - (t_h06 % 1)}"/>
						<c:set var="t_h07" value="${t_h07 - (t_h07 % 1)}"/>
						<c:set var="t_h08" value="${t_h08 - (t_h08 % 1)}"/>
						<c:set var="t_h09" value="${t_h09 - (t_h09 % 1)}"/>
						<c:set var="t_h10" value="${t_h10 - (t_h10 % 1)}"/>
						<c:set var="t_h11" value="${t_h11 - (t_h11 % 1)}"/>
						<c:set var="t_h12" value="${t_h12 - (t_h12 % 1)}"/>
						<c:set var="t_h13" value="${t_h13 - (t_h13 % 1)}"/>
						<c:set var="t_h14" value="${t_h14 - (t_h14 % 1)}"/>
						<c:set var="t_h15" value="${t_h15 - (t_h15 % 1)}"/>
						<c:set var="t_h16" value="${t_h16 - (t_h16 % 1)}"/>
						<c:set var="t_h17" value="${t_h17 - (t_h17 % 1)}"/>
						<c:set var="t_h18" value="${t_h18 - (t_h18 % 1)}"/>
						<c:set var="t_h19" value="${t_h19 - (t_h19 % 1)}"/>
						<c:set var="t_h20" value="${t_h20 - (t_h20 % 1)}"/>
						<c:set var="t_h21" value="${t_h21 - (t_h21 % 1)}"/>
						<c:set var="t_h22" value="${t_h22 - (t_h22 % 1)}"/>
						<c:set var="t_h23" value="${t_h23 - (t_h23 % 1)}"/>						
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="26">조회된 결과가 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>                        

                        </tbody>
                        
                        <tfoot>
                            <tr>
                                <td class="bold">합계</td>
                                <td>${t_h00}%</td>
                                <td>${t_h01}%</td>
                                <td>${t_h02}%</td>
                                <td>${t_h03}%</td>
                                <td>${t_h04}%</td>
                                <td>${t_h05}%</td>
                                <td>${t_h06}%</td>
                                <td>${t_h07}%</td>
                                <td>${t_h08}%</td>
                                <td>${t_h09}%</td>
                                <td>${t_h10}%</td>
                                <td>${t_h11}%</td>
                                <td>${t_h12}%</td>
                                <td>${t_h13}%</td>
                                <td>${t_h14}%</td>
                                <td>${t_h15}%</td>
                                <td>${t_h16}%</td>
                                <td>${t_h17}%</td>
                                <td>${t_h18}%</td>
                                <td>${t_h19}%</td>
                                <td>${t_h20}%</td>
                                <td>${t_h21}%</td>
                                <td>${t_h22}%</td>
                                <td>${t_h23}%</td>                            
                                <td>${t_avg}%</td>
                            </tr>
                        </tfoot>
                    </table>               
                </div>
            </div>
            
  	<form id="frm"></form>
	
	<%@ include file="/WEB-INF/include/body.jsp" %>
	<%@ include file="/WEB-INF/include/footer.jsp" %>
	<script type="text/javascript">

		$(document).ready(function(){
			$("#search").on("click", function(e){ //글쓰기 버튼
				e.preventDefault();
				fn_search();
			});	
			
			$("#t_rate").text("${t_avg}%");
			$("#t_grap").val("${t_avg}");			
		});
	
		function fn_search()
		{
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='/windLidarDList.do' />"); 
			if ($("#s_code").val() != "")
			{
				comSubmit.addParam("s_code", $("#s_code").val());
			}
			comSubmit.addParam("s_year", $("#s_year").val());
			comSubmit.addParam("s_mon", $("#s_mon").val());
			comSubmit.addParam("s_mode", "search");
			comSubmit.submit();
		}
		
	</script>	          
           