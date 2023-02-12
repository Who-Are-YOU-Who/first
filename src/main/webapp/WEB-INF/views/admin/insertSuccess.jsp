<%@page import="org.apache.taglibs.standard.tag.common.xml.ForEachTag"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>  
<c:set var="contextPath" value="<%= request.getContextPath()%>"></c:set>


<h3>${rdto.res_name} 등록이 완료 되었습니다.</h3>
${iList}

<div class="card border-primary mb-3" style="max-width: 20rem;">
  <div class="card-header">${rdto.res_name}</div>
  <div class="card-body">

<c:forEach  var="images" items="${iList}" varStatus="status">

<img src="${contextPath}/resources/image/${images.img_route}" style=" width: 200px; height: 200px; margin-left: 0px">
</c:forEach>
<ul class="pagination">
 <li class="page-item">
      <a class="page-link" href="#">&raquo;</a>
    </li>
</ul>    
    
  <br>
    <p class="card-text">한식/고기</p>
    <p class="card-text">👍100/👎18</p>
  </div>
   <div class="card-footer text-muted">
    2 days ago
  </div>
</div>

<button type="button" class="btn btn-secondary"  onclick="location.href='${contextPath}/modifyRestaurant'">업체 정보 수정하기</button>
<button type="button" class="btn btn-secondary">메인으로</button>
