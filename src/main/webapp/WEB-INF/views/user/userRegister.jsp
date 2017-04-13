<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/header.jsp" %>
            <div id="section"> 
                <div class="container">
                    <h3><img src="image/icon_wind.png" style="margin-bottom:6px"><c:if test="${empty info.ID}">사용자 등록</c:if><c:if test="${not empty info}">사용자 정보 수정</c:if></h3>           

                    <table class="table_view" style="margin-top:15px">
                        <colgroup>
                            <col width="30%" />
                            <col width="70%" />
                        </colgroup>
 <form id="frm">
        <input type="hidden" name="IDX" id="IDX" value="${info.ID }">                        
                        <tr>
                            <th>사용자 아이디</th>
                            <td>
                                <label for="admin_uid">사용자 아이디</label>
		                        <input type="text" id="id" name="id" class="input_box" value="${info.ID}" <c:if test="${not empty info.ID}">disabled</c:if>>
                            </td>
                        </tr>
                        <tr>
                            <th>패스워드</th>
                            <td>
                                <label for="admin_pwd">패스워드</label>
		                        <input type="password" id="pass" name="pass" class="input_box" value="${info.PASS}">
                            </td>
                        </tr>
                        <tr>
                            <th>사용자명</th>
                            <td>
                                <label for="admin_name">사용자명</label>
		                        <input type="text" id="name" name="name" class="input_box" value="${info.NAME}">
                            </td>
                        </tr>
                        <tr>
                            <th>메일주소</th>                            
                            <td>
                                <label for="admin_mail">메일주소</label>
		                        <input type="text" id="email" name="email" class="input_box" value="${info.EMAIL}">
                            </td>
                        </tr>
                        <tr>
                            <th>권한여부</th>                            
                            <td>
                             <input type="radio" id="auth_chk" name="auth_chk" value="1" class="wdp_10" <c:if test="${info.AUTH_CHK == '1'}">checked</c:if> <c:if test="${empty info.AUTH_CHK}">checked</c:if>>
                             <label for="admin_auth2">일반사용자</label> 일반사용자
                             <input type="radio" id="auth_chk" name="auth_chk" value="2" class="wdp_10" <c:if test="${info.AUTH_CHK == '2'}">checked</c:if>>
                             <label for="admin_auth1">관리자</label> 관리자
                             <input type="radio" id="auth_chk" name="auth_chk" value="0" class="wdp_10" <c:if test="${info.AUTH_CHK == '0'}">checked</c:if>>
                             <label for="admin_auth2">접속차단</label> 접속차단
                            </td>
                        </tr>
                    </table> 
<c:if test="${not empty commandMap.Auth}">
   <c:if test="${commandMap.Auth == '2' }">
        <c:if test="${empty info.ID}"><button type="button" class="btn_blue fl_right" id="write" style="margin-top:15px;margin-right:10px">등록하기</button></c:if> 
        <c:if test="${not empty info}"><button type="button" class="btn_blue fl_right" id="update" style="margin-top:15px;margin-right:10px">수정하기</button></c:if>
        <c:if test="${not empty info}"><button type="button" class="btn_blue fl_right" id="delete" style="margin-top:15px;margin-right:10px">삭제하기</button></c:if>
        <button type="button" class="btn_blue fl_right" id="list" style="margin-top:15px;margin-right:10px">목록으로</button>
   </c:if>
   <c:if test="${commandMap.Auth != '2' }">
        <c:if test="${empty info.ID}"><button type="button" class="btn_blue fl_right" id="write" style="margin-top:15px;margin-right:10px">등록하기</button></c:if> 
        <c:if test="${not empty info}"><button type="button" class="btn_blue fl_right" id="update" style="margin-top:15px;margin-right:10px">수정하기</button></c:if>
   </c:if>
</c:if>
                </div>
            </div>
            
    </form>
    <%@ include file="/WEB-INF/include/body.jsp" %>
    <%@ include file="/WEB-INF/include/footer.jsp" %>
    <script type="text/javascript">
        $(document).ready(function(){

			if ("${commandMap.msg}" != "")
			{
				alert("${commandMap.msg}");
			} 

			
        	$("#list").on("click", function(e){
        		e.preventDefault();
        		fn_openMemberList();
        	});
        	$("#write").on("click", function(e){
        		e.preventDefault();
        		fn_memberSave();
        	});
        	$("#update").on("click", function(e){
        		e.preventDefault();
        		fn_memberUpdate();
        	});
        	$("#delete").on("click", function(e){
        		e.preventDefault();
        		fn_memberDelete();
        	});
        });
        
        function fn_openMemberList()
        {
        	var comSubmit = new ComSubmit();
        	comSubmit.setUrl("<c:url value='/memberList.do' />");
        	comSubmit.submit();
        }
        
        function fn_memberSave()
        {
        	var comSubmit = new ComSubmit("frm");
        	comSubmit.setUrl("<c:url value='/memberInsert.do' />");
        	
        	if (frm.id.value == "")
        	{
        	    alert("아이디를 입력하세요!!!");
        	    return;
        	}
        	if (frm.pass.value == "")
        	{
        		alert("패스워드를 입력하세요!!!"); 
        		return;
        	}	
        	if (frm.name.value == "")
        	{
        		alert("성명을 입력하세요!!!");
        		return;
        	}
               	
        	comSubmit.submit();
        }
        
        function fn_memberUpdate()
        {
        	var comSubmit = new ComSubmit("frm");
        	comSubmit.setUrl("<c:url value='/memberUpdate.do' />");
        	comSubmit.submit();
        }
        
        function fn_memberDelete()
        {
        	if (confirm("삭제를 하시겠습니까?"))
        	{
            	var comSubmit = new ComSubmit("frm");
            	comSubmit.setUrl("<c:url value='/memberDelete.do' />");
            	comSubmit.submit();
        	}
        }
    </script>
</body>
</html>