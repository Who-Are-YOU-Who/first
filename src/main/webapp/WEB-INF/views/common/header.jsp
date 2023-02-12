
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>  
<c:set var="contextPath" value="<%= request.getContextPath()%>"></c:set>

<!-- menu-1 -->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary" >
  <div class="container-fluid" style="margin-left: 60%">
      <ul class="navbar-nav me-auto">
      <c:if test="${mdto.userRole eq '1'}">
        <li class="nav-item">
        <a class="nav-link" href="${contextPath}/uploadRestaurant" style="font-size: 15px">업체 등록</a> 
        </li>&emsp;&emsp;
         <li class="nav-item">
        <a class="nav-link" href="${contextPath}/modifyRestaurant" style="font-size: 15px">업체 수정</a> 
        </li>&emsp;&emsp;
      </c:if>
        <li class="nav-item">
        <a class="nav-link" href="${contextPath}/join" style="font-size: 15px">JOIN</a> 
        </li>&emsp;&emsp;
        <li class="nav-item">
		<!-- 로그인 했을경우 : logout/ 로그인 안했을경우 : join -->
        <c:choose>
        <c:when test="${empty mdto}">   
        <a class="nav-link" href="${contextPath}/login" style="font-size: 15px">LOGIN</a>      
        </c:when>
        <c:otherwise>
		<a class="nav-link" href="${contextPath}/logout" style="font-size: 15px">LOGOUT</a>
        </c:otherwise>
        </c:choose> 
        </li>&emsp;&emsp;
        <li class="nav-item">
          <a class="nav-link" href="#" style="font-size: 15px">SCRAB</a>
        </li>&emsp;&emsp;
        <li class="nav-item">
          <a class="nav-link" href="${contextPath}/mypage" style="font-size: 15px">MY PAGE</a>
        </li>&emsp;&emsp;
      </ul>
  </div>
</nav>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <div class="container-fluid"  style="height: 30px; ">
    <a class="navbar-brand" href="${contextPath}/" style="font-size: 30px; margin-bottom: 70px; margin-left: 30px">Rate Us !</a>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarColor01" style="margin:0 auto; ">
      <ul class="navbar-nav me-auto">
        <li class="nav-item">
          <a class="nav-link active" href="${contextPath}/">Home
            <span class="visually-hidden">(current)</span>
          </a>
        </li>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
        <li class="nav-item">
          <a class="nav-link" href="#">RANK</a>
        </li>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
        <li class="nav-item">
          <a class="nav-link" href="${contextPath}/reviewsMain">REVIEWS</a>
        </li>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
        <li class="nav-item">
          <a class="nav-link" href="#">ABOUT</a>
        </li>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
       
      </ul>
    </div>
  </div>
</nav>

    