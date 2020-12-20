<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="data:image/x-icon;," type="image/x-icon">
<title>테스트 제목</title>
</head>
<body>
		<!-- 전페이지 공통모듈 -->
		<tiles:insertAttribute name="common" />
		<!-- 메뉴구조 -->
		<tiles:insertAttribute name="header" />
		<!-- 실제내용 -->
		<tiles:insertAttribute name="contents" />
		<tiles:insertAttribute name="footer" />

</body>
</html>