<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/header.jsp" %>

            <div id="section"> 
                <div class="container">
                    <h3><img src="image/icon_wind.png" style="margin-bottom:6px">사용자 관리</h3>           

                    <table class="table_list" style="margin-top:15px">
                        <thead>
                            <tr>
                                <th>순번</th>
                                <th>사용자 아이디</th>
                                <th>사용자명</th>
                                <th>메일주소</th>
                                <th>최종접속시간</th>
                                <th>등록일자</th>
                                <th>권한여부</th>
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
							<td>${row.REG_DT }</td>
							<td>${row.AUTH_CHK }</td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="7">조회된 결과가 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>                       

                        </tbody>
                    </table>  
                    <button type="button" id="write" class="btn_blue fl_right"  style="margin-top:15px">사용자 등록</button>
                </div>
            </div>
            
 	<%@ include file="/WEB-INF/include/body.jsp" %>
 	<%@ include file="/WEB-INF/include/footer.jsp" %>
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
            