<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/include/header.jsp" %>

	<table class="headList">
	<thead>
	<th>
	<h2>월별 관측자료 수신 통계 - 
	<c:if test="${commandMap.s_code == 13211}">일산(13211)</c:if>
	<c:if test="${commandMap.s_code == 13210}">송도(13210)</c:if>
	<c:if test="${commandMap.s_code == 13206}">구로(13206)</c:if>	
	</h2>
   </th>
   </thead>
   </table>
   
   <table class="searchList">
   <thead>
     <th width="100">관측소별</th>
     <th><select id="s_code">
         <option value="">전체</option>
         <option value="13211" <c:if test="${commandMap.s_code == 13211}">selected</c:if>>일산(13211)</option>
         <option value="13210" <c:if test="${commandMap.s_code == 13210}">selected</c:if>>송도(13210)</option>
         <option value="13206" <c:if test="${commandMap.s_code == 13206}">selected</c:if>>구로(13206)</option>
     </select>
     </th>
     <th width="80">년도</th>
     <th>
       <input type="text" id="s_date"  value="${commandMap.s_date}" maxlength="4" numberOnly="true" size="4">
     </th>
     <th>
     <a href="#this" class="btn" id="search">검색</a>
     </th>
     <th></th><th width="30%"></th>
   </thead>
   </table>
   	
	<table class="scan_list">
		<colgroup>
			<col width="10%"/>
			<col width="6.66%"/>
			<col width="6.66%"/>
			<col width="6.66%"/>
			<col width="6.66%"/>
			<col width="6.66%"/>
			<col width="6.66%"/>
			<col width="6.66%"/>
			<col width="6.66%"/>
			<col width="6.66%"/>
			<col width="6.66%"/>
			<col width="6.66%"/>
			<col width="6.66%"/>
			<col width="10%"/>
		</colgroup>
		<thead>
			<tr>
				<th scope="col">관측소명</th>
				<th scope="col">1월</th>
				<th scope="col">2월</th>
				<th scope="col">3월</th>
				<th scope="col">4월</th>
				<th scope="col">5월</th>
				<th scope="col">6월</th>
				<th scope="col">7월</th>
				<th scope="col">8월</th>
				<th scope="col">9월</th>
				<th scope="col">10월</th>
				<th scope="col">11월</th>
				<th scope="col">12월</th>
				<th scope="col">수신율</th>
			</tr>
		</thead>
		<tbody>
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
					<c:forEach items="${list}" var="row" varStatus="status"> 
					<c:if test="${(status.index+1) % 12 == 1}">
						<tr>
							<td>${row.S_NAME}(${row.S_CODE})</td>	
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
						</tr>
					</c:if>
					     <c:set var="aIndex" value="${aIndex+1}" />
					</c:forEach>
					
						<tr bgcolor="#eee">
						  <td>&nbsp;</td>
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
						  <td>&nbsp;</td>
						</tr>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="14">조회된 결과가 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
	
	<form id="frm"></form>
	
	<%@ include file="/WEB-INF/include/body.jsp" %>
	
	<script type="text/javascript">

		$(document).ready(function(){
			
			$("#search").on("click", function(e){ //검색 버튼
				e.preventDefault();
				fn_search();
			});	
			
			$(document).on("keyup", "input:text[numberOnly]", function() {$(this).val( $(this).val().replace(/[^0-9]/gi,"") );});

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
</body>
</html>