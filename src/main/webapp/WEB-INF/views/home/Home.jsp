<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <script src="<c:url value="/resources/js/home/Home.js"/>"></script> --%>


<script>

$(function() {


	$.ajax({
        url : "https://limy1118.cafe24.com/adoptDuo/login_post",
        type : 'POST',
       	data : {userId : "admin!!!!", userPw : "1234"},
        success : function(result) {// return이 없을경우 success는
     	  console.log(result)
        },
    });

	
});

</script>

화면테스트