<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/include/header.jsp" %>
<div class="centered-wrapper">
	<h2>로그인하기</h2>
	<table class="board_list">
	<form id="frm">
		<colgroup>
			<col width="5%"/>
			<col width="120"/>
			<col width="250"/>
		</colgroup>
		<tbody>
		  <tr>
		     <td>&nbsp;</td>
		     <td>사용자 아이디</td>
		     <td><input type="text" id="id" name="id"></td>
		  </tr>
		  <tr>
		     <td>&nbsp;</td>
		     <td>패스워드</td>
		     <td><input type="password" id="pass" name="pass"></td>
		  </tr>
		</tbody>
		</tbody>
	</form>
	</table>
	<br/>
	<a href="#this" class="btn" id="login">로그인하기 </a>
</div>
	
	<%@ include file="/WEB-INF/include/body.jsp" %>
	<script type="text/javascript">
		$(document).ready(function(){
			
			if ("${commandMap.msg}" != "")
			{
				alert("${commandMap.msg}");
			} 
			
			$("#login").on("click", function(e){ //로그인 하기  버튼
				e.preventDefault();
				fn_loginProcess();
			});	
		});
		
		
		function fn_loginProcess(){
			if (frm.id.value == "")
			{
			   alert("아이디를 입력하세요!!!");
			   frm.id.focus();
			   return;
			}
			if (frm.pass.value == "")
			{
			   alert("패스워드를 입력하세요!!!");
			   frm.pass.focus();
			   return;
			}
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='/userLogin.do' />");
			comSubmit.submit();
		}
	</script>	
</body>
</html>