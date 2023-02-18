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
      <th scope="col">No.</th>
      <th scope="col">업체명</th>
      <th scope="col">위치</th>
      <th scope="col">분류</th>
    </tr>
  </thead>
  <tbody id="resList">

  </tbody>
    </table>
  	 
  	 <form id="restaurantUpdate" action="${contextPath}/updateRestaurant"  enctype="multipart/form-data" method="post">
  	 <div id="rdtoDiv">
  	 
  	 </div> 
  	 </form>
  		
</div>

  	

 
 
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">

$("#searchName").on("click", function() {
	var res_name = $("#res_name").val();
	console.log(res_name);
	$.ajax({
		type : "post",
		url : "${contextPath}/selectByName",
		data : {
			res_name :res_name
		},
		dataType : "text",
		success : function(data, status, xhr) {
			console.log("success============")
			$("#resList").empty();
			$("#resList").append(data);
		},
		error : function(xhr, status, error) {
			console.log(error);
		}
	})//end ajax
	
});//이름으로 업체 가져오기


/* 선택한 식당 정보 가져오기 */
function showRestaurant(res_num) {
	console.log(res_num);
	
	$.ajax({
		type : "post",
		url : "${contextPath}/showRestaurant",
		data : {
			res_num :  res_num
		},
		dataType : "text",
		success : function(data, status, xhr) {
			console.log("success==================");
			$("#rdtoDiv").empty();
			$("#rdtoDiv").append(data);
		},
		error : function(xhr, status, error) {
			console.log(error);
		}
	})
	
}//end 식당정보 가져오기

/* 폼 제출  */
$("form").on("submit", function() {
	if(!checkEmpty($("#res_name").val(), "업체 명")){/* 식당이름 공백 검사 */
		console.log("업체명 공백");
		$("#res_name").focus();
		
	}else if(!checkEmpty($("#res_loc").val(), "주소")){/* 주소 공백 검사 */
		console.log("주소 공백");
		$("#res_loc").focus();
		
	}else if(!checkEmpty($("#sort1").val(), "분류1")){ /* 분류1 공백검사 */
		console.log("분류1 공백");
		$("#sort1").focus();
		
	}else if(!checkEmpty($("#sort2").val(), "분류2")){ /* 분류1 공백검사 */
		console.log("분류2 공백");
		$("#sort2").focus();
		
	}else if(!checkEmpty($("#imageFiles").val(), "사진")){ /* 사진 공백 검사 */
		console.log("사진 공백");
		$("#imageFiles").focus();
	}
	else if(!checkEmpty($("#res_introduction").val(), "소개")){ /* 식당 소개 공백검사 */
		console.log("소개 공백");
		$("#res_introduction").focus();
	}else if(res_introduction.value.length > 200){/* 소개글 글자수검사 */
		console.log("글자수 제한");
		alert("최대 글자 수는 200자 입니다.");
		
	}
})//폼제출 스크립트

function checkEmpty(data, dataName) {
	if(data==""){
		alert(dataName + "를(을) 입력하세요.");
		event.preventDefault();
		return false;
	}else{
		return true;
	}
}



</script>