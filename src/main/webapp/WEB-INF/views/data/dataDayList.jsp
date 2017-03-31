<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/include/header.jsp" %>

	<table class="headList">
	<thead>
	<th>
	<h2>일자별 관측자료 수신 통계 - 일산(13211)</h2>
   </th>
   </thead>
   </table>
   
   <table class="searchList">
   <thead>
     <th width="100">관측소별</th>
     <th><select id="s_code">
         <option value="13211">일산(13211)</option>
         <option value="13210">송도(13210)</option>
         <option value="13206">구로(13206)</option>
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
			<col width="3.84%"/>
			<col width="3.84%"/>
			<col width="3.84%"/>
			<col width="3.84%"/>
			<col width="3.84%"/>
			<col width="3.84%"/>
			<col width="3.84%"/>
			<col width="3.84%"/>
			<col width="3.84%"/>
			<col width="3.84%"/>
			<col width="3.84%"/>
			<col width="3.84%"/>
			<col width="3.84%"/>
			<col width="3.84%"/>
			<col width="3.84%"/>
			<col width="3.84%"/>
			<col width="3.84%"/>
			<col width="3.84%"/>
			<col width="3.84%"/>
			<col width="3.84%"/>
			<col width="3.84%"/>
			<col width="3.84%"/>
			<col width="3.84%"/>
			<col width="3.84%"/>
			<col width="3.84%"/>
			<col width="3.84%"/>
		</colgroup>
		<thead>
			<tr>
				<th scope="col">일자</th>
				<th scope="col">00시</th>
				<th scope="col">01시</th>
				<th scope="col">02시</th>
				<th scope="col">03시</th>
				<th scope="col">04시</th>
				<th scope="col">05시</th>
				<th scope="col">06시</th>
				<th scope="col">07시</th>
				<th scope="col">08시</th>
				<th scope="col">09시</th>
				<th scope="col">10시</th>
				<th scope="col">11시</th>
				<th scope="col">12시</th>
				<th scope="col">13시</th>
				<th scope="col">14시</th>
				<th scope="col">15시</th>
				<th scope="col">16시</th>
				<th scope="col">17시</th>
				<th scope="col">18시</th>
				<th scope="col">19시</th>
				<th scope="col">20시</th>
				<th scope="col">21시</th>
				<th scope="col">22시</th>
				<th scope="col">23시</th>
				<th scope="col">수신율</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${fn:length(list) > 0}">
					<c:forEach items="${list}" var="row" varStatus="status">
						<tr>
							<td>${row.ST_DAY}일</td>	
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
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="26">조회된 결과가 없습니다.</td>
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