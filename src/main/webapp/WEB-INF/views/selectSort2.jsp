
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<c:set var="contextPath" value="<%= request.getContextPath()%>"></c:set>
<br>
<h5>분류2</h5>
<c:if test="${not empty s2dtoList}">
<c:forEach var="sort2List" items="${s2dtoList}" varStatus="status">
<input class="form-check-input" type="radio" onclick="selectSort2(${sort2List.sort2_num})" name="sort2radio" id="sort2_${sort2List.sort2_num}" value="${sort2List.sort2_name}">${sort2List.sort2_name} &nbsp;
<c:if test="${sort2List.sort2_num/5==1}"><br></c:if>
</c:forEach>
</c:if>

