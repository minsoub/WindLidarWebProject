<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/include/header.jsp" %>

	<table class="headList">
	<thead>
	<th>
	<h2>시간대별 관측자료 수신 통계 - 
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
         <option value="13211" <c:if test="${commandMap.s_code == 13211}">selected</c:if>>일산(13211)</option>
         <option value="13210" <c:if test="${commandMap.s_code == 13210}">selected</c:if>>송도(13210)</option>
         <option value="13206" <c:if test="${commandMap.s_code == 13206}">selected</c:if>>구로(13206)</option>
     </select>
     </th>
     <th width="80">날자</th>
     <th>
       <input type="text" id="s_date"  readonly value="${commandMap.s_date}">
     </th>
     <th>
     <a href="#this" class="btn" id="search">검색</a>
     </th>
     <th></th><th width="30%"></th>
   </thead>
   </table>
   	
	<table class="scan_list">
		<colgroup>
			<col width="20%"/>
			<col width="10%"/>
			<col width="10%"/>
			<col width="10%"/>
			<col width="10%"/>
			<col width="10%"/>
			<col width="10%"/>
			<col width="20%"/>
		</colgroup>
		<thead>
			<tr>
				<th scope="col">시간대별</th>
				<th scope="col">0 ~ 10분</th>
				<th scope="col">10 ~ 20분</th>
				<th scope="col">20 ~ 30분</th>
				<th scope="col">30 ~ 40분</th>
				<th scope="col">40 ~ 50분</th>
				<th scope="col">50 ~ 60분</th>
				<th scope="col">수신율</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${fn:length(list) > 0}">
					<c:forEach items="${list}" var="row" varStatus="status">
						<tr>
							<td>${row.ST_TIME}시 ~ </td>						
							<td><c:if test="${row.DIS1 == 1}">O</c:if><c:if test="${row.DIS1 == 0}">x</c:if></td>
							<td><c:if test="${row.DIS2 == 1}">O</c:if><c:if test="${row.DIS2 == 0}">x</c:if></td>
							<td><c:if test="${row.DIS3 == 1}">O</c:if><c:if test="${row.DIS3 == 0}">x</c:if></td>
							<td><c:if test="${row.DIS4 == 1}">O</c:if><c:if test="${row.DIS4 == 0}">x</c:if></td>
							<td><c:if test="${row.DIS5 == 1}">O</c:if><c:if test="${row.DIS5 == 0}">x</c:if></td>
							<td><c:if test="${row.DIS6 == 1}">O</c:if><c:if test="${row.DIS6 == 0}">x</c:if></td>
							<td>${row.RATE}%</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="8">조회된 결과가 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
	
	<form id="frm"></form>
	
	<%@ include file="/WEB-INF/include/body.jsp" %>
	
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
</body>
</html>