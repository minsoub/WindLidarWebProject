<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://hist.co.kr/functions" prefix="f" %>
<%@ include file="/WEB-INF/include/header.jsp" %>


            <div id="section"> 
                <div class="container">
                    <h3><img src="image/icon_wind.png" style="margin-bottom:6px">시간대별 관측자료 수신 통계 - 
                    	<c:if test="${commandMap.s_code == 13211}">일산(13211)</c:if>
	                    <c:if test="${commandMap.s_code == 13210}">송도(13210)</c:if>
	                    <c:if test="${commandMap.s_code == 13206}">구로(13206)</c:if>     
                    </h3>
                    <div class="search_box">
                        <form action="" method="" name="search">
                            <fieldset>
                                <legend>검색</legend>
                                                                관측소별
                                <select id="s_code" name="select_location" class="sel" style="margin-right:25px;margin-left:10px">
                                  <option value="13211" <c:if test="${commandMap.s_code == 13211}">selected</c:if>>일산(13211)</option>
                                  <option value="13210" <c:if test="${commandMap.s_code == 13210}">selected</c:if>>송도(13210)</option>
                                  <option value="13206" <c:if test="${commandMap.s_code == 13206}">selected</c:if>>구로(13206)</option>
                                </select>
                                                                 날짜 <input type="text" id="s_date"  readonly value="${commandMap.s_date}" style="height:24px;">
 
                                <button type="button" id="search" class="btn_search">검색</button>
                            </fieldset>                             
                        </form>
                    </div>
                    <div class="box1" style="margin:7px">
                        <time pubdate><strong>${commandMap.s_date}</strong></time> 
                    </div>
                    <div class="box s_04_1"  style="margin:7px; padding-right:230px;">
                        <progress id="t_grap"  min="0" max="100" value="90"></progress>
                        <span class="red" id="t_rate" style="margin:150px; padding-right:0px;">90%</span> 
                    </div>
                   

                    <table class="table_list" style="margin-top:15px">
                        <thead>
                            <tr>
                                <th>시간대별</th>
                                <th>0~10분</th>
                                <th>10~20분</th>
                                <th>20~30분</th>
                                <th>30~40분</th>
                                <th>40~50분</th>
                                <th>50~60분</th>
                                <th>수신율</th>
                            </tr>
                        </thead>
                        <tbody>
            <c:set var="t_data" value="0"/>	            
			<c:choose>
				<c:when test="${fn:length(list) > 0}">
					<c:forEach items="${list}" var="row" varStatus="status">
						<tr>
							<td class="bold">${row.ST_TIME}시 ~ </td>						
							<td>
							    <c:set var="sDay" value="${commandMap.s_date} ${row.ST_TIME}:10:00"/>
							    <c:choose>
							       <c:when test="${f:daysUntilToday(sDay) == false}">
							          &nbsp;
							       </c:when>
							       <c:otherwise>
							          <img src="<c:if test="${row.DIS1 == 1}"><c:url value='/image/sts_green.png'/></c:if><c:if test="${row.DIS1 == 0}"><c:url value='/image/sts_red.png'/></c:if>">
							       </c:otherwise>
							    </c:choose>
							</td>
							<td>
							    <c:set var="sDay" value="${commandMap.s_date} ${row.ST_TIME}:20:00"/>
							    <c:choose>
							       <c:when test="${f:daysUntilToday(sDay) == false}">
							          &nbsp;
							       </c:when>
							       <c:otherwise>
							          <img src="<c:if test="${row.DIS2 == 1}"><c:url value='/image/sts_green.png'/></c:if><c:if test="${row.DIS2 == 0}"><c:url value='/image/sts_red.png'/></c:if>">
							       </c:otherwise>
							    </c:choose>
							</td>
							<td>
							    <c:set var="sDay" value="${commandMap.s_date} ${row.ST_TIME}:30:00"/>
							    <c:choose>
							       <c:when test="${f:daysUntilToday(sDay) == false}">
							          &nbsp;
							       </c:when>
							       <c:otherwise>
							          <img src="<c:if test="${row.DIS3 == 1}"><c:url value='/image/sts_green.png'/></c:if><c:if test="${row.DIS3 == 0}"><c:url value='/image/sts_red.png'/></c:if>">
							       </c:otherwise>
							    </c:choose>
							</td>
							<td>
							    <c:set var="sDay" value="${commandMap.s_date} ${row.ST_TIME}:40:00"/>
							    <c:choose>
							       <c:when test="${f:daysUntilToday(sDay) == false}">
							          &nbsp;
							       </c:when>
							       <c:otherwise>
							          <img src="<c:if test="${row.DIS4 == 1}"><c:url value='/image/sts_green.png'/></c:if><c:if test="${row.DIS4 == 0}"><c:url value='/image/sts_red.png'/></c:if>">
							       </c:otherwise>
							    </c:choose>
							</td>
							<td>
							    <c:set var="sDay" value="${commandMap.s_date} ${row.ST_TIME}:50:00"/>
							    <c:choose>
							       <c:when test="${f:daysUntilToday(sDay) == false}">
							          &nbsp;
							       </c:when>
							       <c:otherwise>
							          <img src="<c:if test="${row.DIS5 == 1}"><c:url value='/image/sts_green.png'/></c:if><c:if test="${row.DIS5 == 0}"><c:url value='/image/sts_red.png'/></c:if>">
							       </c:otherwise>
							    </c:choose>
							</td>
							<td>
							    <c:set var="sDay" value="${commandMap.s_date} ${row.ST_TIME}:59:00"/>
							    <c:choose>
							       <c:when test="${f:daysUntilToday(sDay) == false}">
							          &nbsp;
							       </c:when>
							       <c:otherwise>
							          <img src="<c:if test="${row.DIS6 == 1}"><c:url value='/image/sts_green.png'/></c:if><c:if test="${row.DIS6 == 0}"><c:url value='/image/sts_red.png'/></c:if>">
							       </c:otherwise>
							    </c:choose>
							</td>
							<td>${row.RATE}%</td>
						</tr>
						<c:set var="t_data" value="${t_data + row.RATE}"/>	
					</c:forEach>
					<c:set var="t_data" value="${t_data/24}"/>	
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="8">조회된 결과가 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>

                        </tbody>
                    </table>               
                </div>
            </div>

	<form id="frm"></form>
	
	<%@ include file="/WEB-INF/include/body.jsp" %>
<%@ include file="/WEB-INF/include/footer.jsp" %>
	<script type="text/javascript">

	    $(function() {
	       $( "#s_date" ).datepicker({
	          dateFormat: 'yy-mm-dd'
	       });
	    });

		$(document).ready(function(){
			$("#list").on("click", function(e){ //글쓰기 버튼
				e.preventDefault();
				fn_list();
			});	
			
			$("#search").on("click", function(e){ //글쓰기 버튼
				e.preventDefault();
				fn_search();
			});	
			
			
			$("#t_rate").text("${t_data}%");
			$("#t_grap").val("${t_data}");
			
			//alert("${t_data}");
			
		});
	
		function ScanList(page){
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='/windLidarHList.do' />"); 
			comSubmit.addParam("s_code", $("#s_code").val());
			
			if ($("#s_date").val() != "")
			{
				comSubmit.addParam("s_date", $("#s_date").val());
				comSubmit.addParam("s_mode", "search");
			}
			comSubmit.submit();
		}
		
		function fn_list()
		{
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='/scanList.do' />"); 
			comSubmit.addParam("s_code", $("#s_code").val());
			comSubmit.submit();
		}
		
		function fn_search()
		{
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='/windLidarHList.do' />"); 
			comSubmit.addParam("s_code", $("#s_code").val());
			comSubmit.addParam("s_date", $("#s_date").val());
			comSubmit.addParam("s_mode", "search");
			comSubmit.submit();
		}
		
	</script>	