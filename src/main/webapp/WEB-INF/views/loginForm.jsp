<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/header.jsp" %>
            <div id="section">  
                <div class="login_box">
                    <img src="<c:url value='/image/login_img.png' />" alt="Wind Lidar" title="Wind Lidar"/>
                    <form id="frm"  style="margin-top:50px">
                        <fieldset>
                            <legend>로그인 정보입력</legend>
                            <div class="uid">
                                <label for="uid">아이디</label>
                                <input type="text" id="id" name="id" class="_uid" placeholder="아이디">
                            </div>
                            <div class="pwd">
                                <label for="pwd">비밀번호</label>
                                <input type="password" id="pass" name="pass" class="_upass" placeholder="비밀번호">
                            </div>                            
                        </fieldset>
                        <button type="button" class="btn_login" id="login">로그인</button>
                    </form>
                </div>
                <div class="login_text">
                    <p>
                        이 시스템은 권한 있는 사용자만 접속이 가능합니다. <br/>
                        사용자 등록은 관리자에게 문의하시기 바랍니다.
                    </p>
                </div>
            </div>

<%@ include file="/WEB-INF/include/body.jsp" %>
	<script type="text/javascript">
		$(document).ready(function(){
			
			if ("${commandMap.msg}" != "")
			{
				alert("${commandMap.msg}");
			}
			
			$("#login").on("click", function(e){ //로그인 버튼
				e.preventDefault();
				fn_loginProcess();
			});	
		});
		
		$('input[type=text]').on('keydown', function(e) {
		    if (e.which == 13) {
		        e.preventDefault();
		        fn_loginProcess();
		    }
		});
		$('input[type=password]').on('keydown', function(e) {
		    if (e.which == 13) {
		        e.preventDefault();
		        fn_loginProcess();
		    }
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
<%@ include file="/WEB-INF/include/footer.jsp" %>
