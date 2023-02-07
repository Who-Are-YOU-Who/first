<%@page import="org.apache.taglibs.standard.tag.common.xml.ForEachTag"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>  
<c:set var="contextPath" value="<%= request.getContextPath()%>"></c:set>


<div class="col-md-4" style="margin: auto;">
<h3 style="text-align: center;">업체 정보 수정</h3>
<br>
 <label class="form-label mt-4">수정 할 업체명</label>
 <div class="input-group mb-3">
 	<input type="text" id="res_name" name="res_name" class="form-control" placeholder="Restaurant Name" aria-label="Restaurant Name" aria-describedby="button-addon2">
 	<button class="btn btn-primary" type="button" id="searchName">search</button>
 </div>
 	
 	<table class="table table-hover">
  <thead>
    <tr>
      <th scope="col">No</th>
      <th scope="col">업체명</th>
      <th scope="col">위치</th>
      <th scope="col">분류</th>
    </tr>
  </thead>
  <tbody>
    <tr class="table-active">
      <th scope="row">Active</th>
      <td>Column content</td>
      <td>Column content</td>
      <td>Column content</td>
    </tr>
  </tbody>
</table>
  	 
  		<div class="btn-group" role="group">
    	 <button id="btnGroupDrop1" type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"></button>
    		
    		<div class="dropdown-menu" aria-labelledby="btnGroupDrop1" style="">
     		 <a class="dropdown-item" href="#">Dropdown link</a>
     		 <a class="dropdown-item" href="#">Dropdown link</a>
    		</div>
  		</div>
	</div>

  	
</div>
 
 
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">

$("#searchName").on("click", function() {
	var res_name = $("#res_name"),val();
	$.ajax({
		type : "post",
		url : "${contextPath}/selectByName",
		data : {
			res_name :res_name
		},
		dataType : "text",
		success : function(data, status, xhr) {
			console.log("success============")
			
		}
	})
	
});



</script>