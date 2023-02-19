<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %> 
<c:set var="contextPath" value="<%= request.getContextPath()%>"></c:set>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootswatch@5.2.3/dist/quartz/bootstrap.min.css" rel="stylesheet"></link>

<!DOCTYPE html>
<html>
<head>
<title>success!</title>
<meta charset="UTF-8" />
</head>
<body>
<jsp:include page="common/header.jsp" flush="true"></jsp:include><br>

<div class="col-md-4" style="margin: auto;">
<h1 style="margin: auto;">업체 삭제 완료</h1>
<br>
<button type="button" class="btn btn-primary" onclick = "location.href = '${contextPath}/home' ">홈으로</button>
<button type="button" class="btn btn-secondary" onclick = "location.href = '${contextPath}/modifyRestaurant' ">다른 업체 수정</button>
</div>

<jsp:include page="common/footer.jsp" flush="true" ></jsp:include><br>
</body>
</html>