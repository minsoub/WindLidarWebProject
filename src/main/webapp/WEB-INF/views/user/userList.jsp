<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/include/header.jsp" %>

	<table class="headList">
	<thead>
	<th>
	<h2>사용자 관리</h2>
   </th>
   </thead>
   </table>
   

	<table class="board_list">
		<colgroup>
			<col width="5%"/>
			<col width="15%"/>
			<col width="15%"/>
			<col width="20%"/>
			<col width="25%"/>
			<col width="15%"/>
		</colgroup>
		<thead>
			<tr>
				<th scope="col">순번</th>
				<th scope="col">사용자 아이디</th>
				<th scope="col">사용자명</th>
				<th scope="col">메일주소</th>
				<th scope="col">최종접속시간</th>
				<th scope="col">권한여부</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${fn:length(list) > 0}">
					<c:forEach items="${list}" var="row"  varStatus="status">
						<tr>
							<td>${fn:length(list) - status.index }</td>							
							<td class="title">
								<a href="#this" name="title">${row.ID }</a>
								<input type="hidden" id="IDX" value="${row.ID }">
							</td>
							<td>${row.NAME }</td>
							<td>${row.EMAIL }</td>
							<td>${row.LAST_DT }</td>
							<td>${row.AUTH_CHK }</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="6">조회된 결과가 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
  	<table class="btnList">
	<thead>
	<th>
	  <th>
	<a href="#this" class="btn" id="write">사용자 등록</a>
 	   </th>
   </thead>
   </table>
   
   
	<%@ include file="/WEB-INF/include/body.jsp" %>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#write").on("click", function(e){ //글쓰기 버튼
				e.preventDefault();
				fn_openBoardWrite();
			});	
			
			$("a[name='title']").on("click", function(e){ //제목 
				e.preventDefault();
				fn_openBoardDetail($(this));
			});
		});
		
		
		function fn_openBoardWrite(){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/userRegister.do' />");
			comSubmit.submit();
		}
		
		function fn_openBoardDetail(obj){
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/userDetailInfo.do' />");
			comSubmit.addParam("IDX", obj.parent().find("#IDX").val());
			comSubmit.submit();
		}
	</script>	
</body>
</html>