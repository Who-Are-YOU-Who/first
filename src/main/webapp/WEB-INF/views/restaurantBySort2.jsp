<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<c:set var="contextPath" value="<%= request.getContextPath()%>"></c:set>


<c:forEach items="${rList}" var="rList" varStatus="status">

<div class="card border-primary mb-3" style="max-width: 20rem;">
  <div class="card-header">${rList.res_name}</div>
  <div class="card-body">
	<ul class="pagination">
	<li>
		<c:forEach  var="iList" items="${iList}" varStatus="status"> <!-- 이미지 for each -->

		<c:if test="${rList.res_num==iList.res_num}">  <!-- res_num이 일치할 때 -->
	
	<div id="imgChange${rList.res_num}">
	
	<c:if test="${iList.img_rnk==0}"> <!-- 이미지 순번이 0번일 때 -->
	<div id="resImageDiv">
	<input type="hidden" id="imgRank" value="0">
	<img id="${rList.res_num}nowImage" src="${contextPath}/resources/image/${iList.img_route}" style=" width: 220px; height: 200px; margin-left: 16px">
	</div>
	</c:if>
	
	</div>

		</c:if>
		</c:forEach>
	</li>
    <li style="margin-top: 60%" >
      <a href="javascript:nextImage(${rList.res_num});" style="text-decoration-line : none; font-size:x-large;" >▶️</a>
    </li>
	</ul>    
    
  <br>
    <p class="card-text">한식/고기</p>
    <p class="card-text">👍100/👎18</p>
  </div>
   <div class="card-footer text-muted">
    00 days ago
  </div>
</div>


</c:forEach>