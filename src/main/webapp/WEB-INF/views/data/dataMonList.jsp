<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/header.jsp" %>

            <div id="section"> 
                <div class="container">
                    <h3><img src="image/icon_wind.png" style="margin-bottom:6px">월별 관측자료 수신 통계 - 
                    	<c:if test="${commandMap.s_code == 13211}">일산(13211)</c:if>
	                    <c:if test="${commandMap.s_code == 13210}">송도(13210)</c:if>
	                    <c:if test="${commandMap.s_code == 13206}">구로(13206)</c:if>
	                    <c:if test="${empty commandMap.s_code}">전체</c:if>
                    </h3>
                    <div class="search_box">
                        <form action="" method="" name="search">
                            <fieldset>
                                <legend>검색</legend>
                                                                관측소별
                                <select id="s_code" name="select_location" class="sel" style="margin-right:25px;margin-left:10px">
                                  <option value="">전체</option>
                                  <option value="13211" <c:if test="${commandMap.s_code == 13211}">selected</c:if>>일산(13211)</option>
                                  <option value="13210" <c:if test="${commandMap.s_code == 13210}">selected</c:if>>송도(13210)</option>
                                  <option value="13206" <c:if test="${commandMap.s_code == 13206}">selected</c:if>>구로(13206)</option>
                                </select>
                                                                날짜
                                <input type="text" id="s_date"  class="sel" value="${commandMap.s_date}" maxlength="4" numberOnly="true" size="4" style="height:24ptx;">
                                <button type="button" id="search" class="btn_search" onclick="">검색</button>
                            </fieldset>                             
                        </form>
                    </div>
                    <div class="box1" style="margin:7px">
                        <time pubdate><strong>2017년</strong></time> 
                    </div>
                    <div class="box s_04_1"  style="margin:7px; padding-right:230px;">
                        <progress id="t_grap"  min="0" max="100" value="90"></progress>
                        <span class="red" id="t_rate" style="margin:150px; padding-right:0px;">90%</span> 
                    </div>               

                    <table class="table_list" style="margin-top:15px">
                        <thead>
                            <tr>
                                <th>관측소명</th>
                                <th>1월</th>
                                <th>2월</th>
                                <th>3월</th>
                                <th>4월</th>
                                <th>5월</th>
                                <th>6월</th>
                                <th>7월</th>
                                <th>8월</th>
                                <th>9월</th>
                                <th>10월</th>
                                <th>11월</th>
                                <th>12월</th>
                                <th>수신율</th>
                            </tr>
                        </thead>
                        <tbody>
            <c:set var="t_total" value="0" />   
            <c:set var="g_rate" value="0" />         
			<c:choose>
				<c:when test="${fn:length(list) > 0}">
				   <c:set var="m1" value="0" />
				   <c:set var="m2" value="0" />
				   <c:set var="m3" value="0" />
				   <c:set var="m4" value="0" />
				   <c:set var="m5" value="0" />
				   <c:set var="m6" value="0" />
				   <c:set var="m7" value="0" />
				   <c:set var="m8" value="0" />
				   <c:set var="m9" value="0" />
				   <c:set var="m10" value="0" />
				   <c:set var="m11" value="0" />
				   <c:set var="m12" value="0" />
				   <c:set var="aIndex" value="0" />
				   <c:set var="avg" value="0" />
					<c:forEach items="${list}" var="row" varStatus="status"> 
					    <c:if test="${(status.index+1) % 12 == 1}">
						<tr>
							<td class="bold">${row.S_NAME}(${row.S_CODE})</td>	
				        </c:if>
							<td>${row.RATE}</td>	
							<c:set var="avg" value="${avg + row.RATE}"/>	
							<c:if test="${(status.index+1) % 12 == 1}"><c:set var="m1" value="${m1+row.RATE}"/></c:if>
							<c:if test="${(status.index+1) % 12 == 2}"><c:set var="m2" value="${m2+row.RATE}"/></c:if>
							<c:if test="${(status.index+1) % 12 == 3}"><c:set var="m3" value="${m3+row.RATE}"/></c:if>
							<c:if test="${(status.index+1) % 12 == 4}"><c:set var="m4" value="${m4+row.RATE}"/></c:if>
							<c:if test="${(status.index+1) % 12 == 5}"><c:set var="m5" value="${m5+row.RATE}"/></c:if>
							<c:if test="${(status.index+1) % 12 == 6}"><c:set var="m6" value="${m6+row.RATE}"/></c:if>
							<c:if test="${(status.index+1) % 12 == 7}"><c:set var="m7" value="${m7+row.RATE}"/></c:if>
							<c:if test="${(status.index+1) % 12 == 8}"><c:set var="m8" value="${m8+row.RATE}"/></c:if>
							<c:if test="${(status.index+1) % 12 == 9}"><c:set var="m9" value="${m9+row.RATE}"/></c:if>
							<c:if test="${(status.index+1) % 12 == 10}"><c:set var="m10" value="${m10+row.RATE}"/></c:if>
							<c:if test="${(status.index+1) % 12 == 11}"><c:set var="m11" value="${m11+row.RATE}"/></c:if>
							<c:if test="${(status.index+1) % 12 == 0}"><c:set var="m12" value="${m12+row.RATE}"/></c:if>
							
                       <c:if test="${(status.index+1) % 12 == 0}">	
							<td>${avg/12}%</td>
							<c:set var="t_total" value="${t_total + (avg/12)}" />       
						</tr>
						<c:set var="avg" value="0" />
					    </c:if>
					     <c:set var="aIndex" value="${aIndex+1}" />
					</c:forEach>
                        </tbody>
                        <tfoot>					
						<tr>
						  <td class="bold">합계</td>
						  <td>${m1/(aIndex/12)}%</td>
						  <td>${m2/(aIndex/12)}%</td>
						  <td>${m3/(aIndex/12)}%</td>
						  <td>${m4/(aIndex/12)}%</td>
						  <td>${m5/(aIndex/12)}%</td>
						  <td>${m6/(aIndex/12)}%</td>
						  <td>${m7/(aIndex/12)}%</td>
						  <td>${m8/(aIndex/12)}%</td>
						  <td>${m9/(aIndex/12)}%</td>
						  <td>${m10/(aIndex/12)}%</td>
						  <td>${m11/(aIndex/12)}%</td>
						  <td>${m12/(aIndex/12)}%</td>
						  <td>${t_total/(aIndex/12)}%</td>
						</tr>
						</tfoot>
						<c:set var="g_rate" value="${t_total/(aIndex/12)}"/>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="14">조회된 결과가 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>                        

                    </table>               
                </div>
            </div>
            
 	<form id="frm"></form>
	
	<%@ include file="/WEB-INF/include/body.jsp" %>
	<%@ include file="/WEB-INF/include/footer.jsp" %>
	<script type="text/javascript">

		$(document).ready(function(){
			
			$("#search").on("click", function(e){ //검색 버튼
				e.preventDefault();
				fn_search();
			});	
			
			$(document).on("keyup", "input:text[numberOnly]", function() {$(this).val( $(this).val().replace(/[^0-9]/gi,"") );});
			
			$("#t_rate").text("${g_rate}%");
			$("#t_grap").val("${g_rate}");	

		});

		
		function fn_search()
		{
			var comSubmit = new ComSubmit("frm");
			if ($("#s_date").val() == "")
			{
			    alert("년도를 입력하세요!");
			    return;
			}
			comSubmit.setUrl("<c:url value='/windLidarMList.do' />"); 
			if ($("#s_code").val() != "")
			{
				comSubmit.addParam("s_code", $("#s_code").val());
			}
			comSubmit.addParam("s_date", $("#s_date").val());
			comSubmit.addParam("s_mode", "search");
			comSubmit.submit();
		}
		
	</script>	           
            