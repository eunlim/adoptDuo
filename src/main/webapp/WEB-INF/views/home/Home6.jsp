<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<style type="text/css">
.errormsg {
	color: red;
}
</style>

<script>

$(document).ready(function(){
	
})

</script>

<div class="container">
	<form:form action="${contextPath}/insert.do" method="POST" modelAttribute="memberDto" id="form1">
		<div class="form-group">
			<label>ID :</label>
			<form:input path="id" size="30" cssClass="form-control" placeholder="Enter ID" />
			<small><form:errors path="id" cssClass="errormsg" /></small>
		</div>
		<div class="form-group">
			<label>Password:</label>
			<form:password path="pw" size="30" cssClass="form-control" placeholder="Enter password" />
			<small><form:errors path="pw" cssClass="errormsg" /></small>
		</div>
		<%-- <div class="form-group">
			<label>이름 :</label>
			<form:input path="name" size="30" cssClass="form-control" placeholder="이름" />
			<small><form:errors path="name" cssClass="errormsg" /></small>
		</div> --%>
		<div class="form-group">
			<button type="submit" class="btn btn-primary">검증</button>
		</div>
	</form:form>
</div>