<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/include/header.jsp" %>

            <div id="section"> 
                <div class="container">
                    <h3><img src="<c:url value='/image/icon_wind.png'/>" style="margin-bottom:6px">Scanning Parameter -
                      <c:if test="${commandMap.s_code == 13211}">일산(13211)</c:if>
	                  <c:if test="${commandMap.s_code == 13210}">송도(13210)</c:if>
	                  <c:if test="${commandMap.s_code == 13206}">구로(13206)</c:if>
                    </h3>
                    <div class="search_box">
                            <fieldset>
                                <legend>검색</legend>
                                                                관측소별
                                <select id="s_code" class="sel" style="margin-right:25px;margin-left:10px">
                                 <option value="13211" <c:if test="${commandMap.s_code == 13211}">selected</c:if>>일산(13211)</option>
                                 <option value="13210" <c:if test="${commandMap.s_code == 13210}">selected</c:if>>송도(13210)</option>
                                 <option value="13206" <c:if test="${commandMap.s_code == 13206}">selected</c:if>>구로(13206)</option>
                                </select>
                                날짜
                                <input type="text" id="s_date"  readonly value="${commandMap.s_date}" style="height:24px;">
                                <button type="button" id="search" class="btn_search">검색</button>
                            </fieldset>                             
                    </div>
                    <table class="table_list" style="margin-top:15px">
                        <thead>
                            <tr>
                                <th>NO</th>
                                <th>RCV Time</th>
                                <th>Measurement Type</th>
                                <th>PARAM 1</th>
                                <th>PARAM 2</th>
                                <th>PARAM 3</th>
                                <th>PARAM 4</th>
                                <th>ACCUM.TIME</th>
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
                    <form id="frm">	
                    <div class="pageNate">
	    
	    <c:if test="${commandMap.prev}">                    
             <a class="start" href="javascript:ScanList(${commandMap.start-1});"></a>
        </c:if> 
        <c:forEach begin="${commandMap.start}" end = "${commandMap.end}" var="idx">
             <a href='javascript:ScanList(${idx});' <c:if test="${idx == commandMap.page}">class="selected"</c:if> >${idx}</a>
        </c:forEach> 
        <c:if test="${commandMap.next}">
             <a class="next" href="javascript:ScanList(${commandMap.end+1});"></a>
        </c:if>              

                    </div>
                    <button type="button" id="list" class="btn_blue fl_right">리스트</button>      
                    </form>          
                </div>
            </div>
            
<%@ include file="/WEB-INF/include/body.jsp" %>
<%@ include file="/WEB-INF/include/footer.jsp" %>	

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