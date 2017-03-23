<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/include/header.jsp" %>
</head>
<body>
    <form id="frm">
        <table class="board_view">
        <input type="hidden" name="IDX" id="IDX" value="${info.ID }">
            <colgroup>
                <col width="20%">
                <col width="*"/>
            </colgroup>
            <caption>사용자 등록</caption>
            <tbody>
                <tr>
                    <th scope="row">사용자 아이디</th>
                    <td><input type="text" id="id" name="id" class="wdp_80" value="${info.ID}" <c:if test="${not empty info.ID}">disabled</c:if> ></input></td>
                </tr>
                <tr>
                    <th scope="row">사용자 성명</th>
                    <td><input type="text" id="name" name="name" class="wdp_100" value="${info.NAME}"></input></td>
                </tr>
                <tr>
                    <th scope="row">사용자 패스워드</th>
                    <td><input type="password" id="pass" name="pass" class="wdp_80" value="${info.PASS}"></input></td>
                </tr>
                <tr>
                    <th scope="row">사용자 메일주소</th>
                    <td><input type="text" id="email" name="email" class="wdp_140" value="${info.EMAIL}"></input></td>
                </tr>
                <tr>
                    <th scope="row">권한 관리</th>
                    <td>
                         <input type="radio" id="auth_chk" name="auth_chk" value="1" class="wdp_10" <c:if test="${info.AUTH_CHK == '1'}">checked</c:if>>일반회원
                         <input type="radio" id="auth_chk" name="auth_chk" value="2" class="wdp_10" <c:if test="${info.AUTH_CHK == '2'}">checked</c:if>>관리자권한
                         <input type="radio" id="auth_chk" name="auth_chk" value="0" class="wdp_10" <c:if test="${info.AUTH_CHK == '0'}">checked</c:if>>접속차단
                    </td>
                </tr>                
            </tbody>
        </table>
        <c:if test="${empty info.ID}"><a href="#this" class="btn" id="write">사용자 등록</a></c:if> 
        <a href="#this" class="btn" id="update" >정보수정</a>
        <c:if test="${not empty info}"><a href="#this" class="btn" id="delete">삭제하기</a></c:if>
        <a href="#this" class="btn" id="list" >목록으로</a>
    </form>
    <%@ include file="/WEB-INF/include/body.jsp" %>
    <script type="text/javascript">
        $(document).ready(function(){
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