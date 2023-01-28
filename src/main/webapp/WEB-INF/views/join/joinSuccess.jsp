
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<c:set var="contextPath" value="<%= request.getContextPath()%>"></c:set>

<div class="col-md-4" style="margin: auto;">
<h1>회원가입을 축하드립니다!</h1>
<h3>로그인 하여 접속 해주세요</h3>
<button type="button" class="btn btn-primary" onclick="location.href='${contextPath}/login';">로그인</button>
</div>



<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
</script>