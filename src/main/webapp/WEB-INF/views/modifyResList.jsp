<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<c:set var="contextPath" value="<%= request.getContextPath()%>"></c:set>

  <c:forEach  items="${rList}" var="rList" varStatus="status">

	<tr class="table-active" id="res${rList.res_num}" onclick="showRestaurant(${rList.res_num})">
	
      <th scope="row" >${status.count}</th>
      
      <td>${rList.res_name}</td>
      
      <td>${rList.res_loc}</td>
      
      <td>
      <c:forEach items="${s1}" var="s1" varStatus="status" >
      <c:if test="${rList.sort1_num == s1.sort1_num}" >
      ${s1.sort1_name}
      </c:if>
      </c:forEach>
      </td>
	</tr>
	
 </c:forEach>		