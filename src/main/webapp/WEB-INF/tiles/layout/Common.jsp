<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- import 부분 - css, js -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

<script src="<c:url value="/resources/jquery-validation/jquery.validate.js"/>"></script>
<script src="<c:url value="/resources/jquery-validation/additional-methods.min.js"/>"></script>
<script src="<c:url value="/resources/jquery-validation/messages_ko.min.js"/>"></script>

<script src="<c:url value="/resources/js/common/CommonUtil.js"/>"></script>
<script src="<c:url value="/resources/js/common/FileUtil.js"/>"></script>


<!-- 공통모듈 -->


<%
	String contextPath = request.getContextPath();
	request.setAttribute("contextPath", contextPath);

	String currentPath = (String)request.getAttribute( "javax.servlet.forward.request_uri" );
	request.setAttribute("currentPath", currentPath);
%>


<script type="text/javascript">
	
	var contextPath = '${contextPath}';//Server URL path
	
	$(document).ready(function(){
		//뒤로가기 시 로그인 세션 확인
		window.onpageshow = function(event) {
		    if ( event.persisted || (window.performance && window.performance.navigation.type == 2)) {
		    	/* if(commonUtil.isEmpty("${sessionScope.authInfo}")) {
		    		window.location.href = contextPath + "/"	
				} else {
					window.location.reload();
				} */
				
				/* if(!commonUtil.isEmpty("${sessionScope.authInfo}")) {
					window.location.reload();	
				} */
		    }
		}
	});	

</script>