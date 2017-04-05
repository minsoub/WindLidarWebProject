<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/include/header.jsp" %>

	<table class="headList">
	<thead>
	<th>
	<h2>Scanning Parameter - 
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
			<col width="5%"/>
			<col width="22%"/>
			<col width="15%"/>
			<col width="10%"/>
			<col width="10%"/>
			<col width="10%"/>
			<col width="10%"/>
			<col width="10%"/>
		</colgroup>
		<thead>
			<tr>
				<th scope="col">순번</th>
				<th scope="col">RCV Time</th>
				<th scope="col">Measurement Type</th>
				<th scope="col">PARAM 1</th>
				<th scope="col">PARAM 2</th>
				<th scope="col">PARAM 3</th>
				<th scope="col">PARAM 4</th>
				<th scope="col">Accum.Time</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${fn:length(list) > 0}">
					<c:forEach items="${list}" var="row" varStatus="status">
						<tr>
							<td>${(commandMap.count - status.index) - ((commandMap.page - 1) * 10) }</td>						
							<td>${row.ST_TIME }</td>
							<td>${row.P_TYPE }</td>
							<td>${row.P_PAM1 }</td>
							<td>${row.P_PAM2 }</td>
							<td>${row.P_PAM3 }</td>
							<td>${row.P_PAM4 }</td>
							<td>${row.AVT_TM } ${row.index }</td>
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
	<br/>
	<table class="scan_list">
	<form id="frm">	
	<thead>
	<th>
	  <th>
	    <c:if test="${commandMap.prev}">
	      <a href="javascript:ScanList(${commandMap.start-1});">[ 이전 ]</a>
	    </c:if>
	    
	    <c:forEach begin="${commandMap.start}" end = "${commandMap.end}" var="idx">

	       &nbsp;<a href='javascript:ScanList(${idx});'>${idx}</a>&nbsp;

	    </c:forEach>
	  
	    <c:if test="${commandMap.next}">
	       <a href="javascript:ScanList(${commandMap.end+1});">[ 다음 ]</a>
	    </c:if>
	  
   </th>
   </thead>
   </table>
</form>	
	<table class="btnList">
	<thead>
	<th>
	  <th>
	<a href="#this" class="btn" id="list">리스트</a>
	   </th>
   </thead>
   </table>
   
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
			comSubmit.setUrl("<c:url value='/scanList.do' />"); 
			comSubmit.addParam("page", page);
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
			comSubmit.setUrl("<c:url value='/scanList.do' />"); 
			//comSubmit.addParam("page", page);
			comSubmit.addParam("s_code", $("#s_code").val());
			if ($("#s_date").val() != "")
			{
				comSubmit.addParam("s_date", $("#s_date").val());
			}
			comSubmit.addParam("s_mode", "search");
			comSubmit.submit();
		}
		
	</script>	
</body>
</html>