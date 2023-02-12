<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<c:set var="contextPath" value="<%= request.getContextPath()%>"></c:set>

<c:forEach var="s2" items="${s2List}" varStatus = "status">
<button id="sort2_${s2.sort2_num}" value="unchecked" type="button" class="btn btn-primary btn-sm" onclick="selectSort2(${s2.sort2_num})">${s2.sort2_name}</button>
</c:forEach>