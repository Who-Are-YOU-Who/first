
<%@page import="org.apache.taglibs.standard.tag.common.xml.ForEachTag"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>  
<c:set var="contextPath" value="<%= request.getContextPath()%>"></c:set>

<style>
#sort1div*{
background-color:  rgba(255, 255, 255, 0.4);
}
</style>

<br>

<form id="restaurantForm" action="${contextPath}/insertRestaurant" enctype="multipart/form-data" method="post">
<div class="col-md-3" style="margin: auto; ">
<h2 style="text-align: center;">업체등록</h2>
 <label class="col-form-label mt-4" for="inputDefault" >업체명</label>
 <input type="text" class="form-control" placeholder="업체명을 입력하세요." id="res_name" name="res_name">
<br>
</div>

<!-- 위치입력 -->
<div class="col-md-3" style="margin: auto;">
 <label class="col-form-label mt-4" for="inputDefault" >주소 (지도검색 버튼으로 위치를 정확하게 확인해야 저장됩니다.)</label>
<div class="input-group mb-3">
   <input type="text" class="form-control" placeholder="주소를 입력하세요" aria-label="Recipient's username" aria-describedby="button-addon2" id="location">
    <input type="hidden" id="res_loc" name="res_loc">  <!-- 위도 경도 저장 -->
      <button class="btn btn-primary" type="button" id="searchLocation">지도 검색</button>
</div>
</div><br>

<!-- 위치 지도--> 
<div id="google-map" style="width: 30%;height: 350px; margin: auto;"></div>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
   function myMap(){
	   
	  var point = {lat: -34.397, lng: 150.644};
      var mapOptions = { 
    		  center: point, //지도중앙위치
            zoom:11//얼마나 가깝게 
      };
 
      var map = new google.maps.Map( 
             document.getElementById("google-map") 
            , mapOptions );
      //HTML 문서 상에서 id 속성이 map인 <div> 요소를 찾아서 반환합니다. 이 것을 google.maps.Map() 생성자의 인자로 넘겨서 호출하면 구글 지도 객체를 얻을 수 있습니다.
   		
      var geocoder = new google.maps.Geocoder();
      
      $("#searchLocation").on("click", function() {
          console.log('submit 버튼 클릭 이벤트 실행');
          
          // 여기서 실행
          geocodeAddress(geocoder, map);
        
          
      });
    //  var marker = new google.maps.Marker({position: cityHall, map: map});
   
    /* 입력한 주소로 맵의 좌표를 바꾼다. */
    function geocodeAddress(geocoder, resultMap) {
    	console.log('geocodeAddress 함수 실행');
    	
    	// 주소 설정
        var address = $("#location").val();
    	
        geocoder.geocode({'address': address}, function(result, status) {
            console.log(result);
            console.log(status);

            if (status === 'OK') {
                // 맵의 중심 좌표를 설정한다.
                resultMap.setCenter(result[0].geometry.location);
                // 맵의 확대 정도를 설정한다.
                resultMap.setZoom(18);
                // 맵 마커
                var marker = new google.maps.Marker({
                    map: resultMap,
                    position: result[0].geometry.location
                });

                // 위도
                console.log('위도(latitude) : ' + marker.position.lat());
                // 경도
                console.log('경도(longitude) : ' + marker.position.lng());
                
                $("#res_loc").val(marker.position.lat()+","+marker.position.lng());
               
                
                //중복검사
                checkDupliRestaurant($("#res_name").val(),$("#res_loc").val());
            } else {
                alert('지오코드가 다음의 이유로 성공하지 못했습니다 : ' + status);
            }
            
            
        });
	}
   
   }
</script> 
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBNYZG9ebC5wKMpzBTc0Uon-hxNHAFuf8o&callback=myMap"></script>

<br>
<!-- 카테고리설정1 --> 
<div class="col-md-3" style="margin: auto;" id="sort1div">
<h5>분류1</h5>
  <c:forEach var="sort1List" items="${s1dtoList}" varStatus="status">
     <input name="sort1radio" class="form-check-input" type="radio" onclick="selectSort1(${sort1List.sort1_num})"  id="sort1_${sort1List.sort1_num}" value="${sort1List.sort1_name}">${sort1List.sort1_name} &nbsp;
  <c:if test="${sort1List.sort1_num/4==1||sort1List.sort1_num/8==1}"><br></c:if>
  </c:forEach>
</div>
<input type="hidden" id="sort1" name="sort1">
<input type="hidden" id="sort2" name="sort2">
<!-- 카테고리설정2 --> 
<div class="col-md-3" style="margin: auto; display: none" id="sort2div" >

</div>

<!-- 사진등록 -->
<div class="col-md-3" style="margin: auto;">
 	<div id="uploadImages" class="form-group">
      <label for="formFile" class="form-label mt-4">사진 불러오기</label>
      <input class="form-control" type="file" id="imageFiles" name="imageFiles" multiple="multiple">
    </div>
</div>


<!-- 식당소개  -->
<div id="introduction" class="col-md-3" style="margin: auto;">
    <div class="form-group">
      <label for="exampleTextarea" class="form-label mt-4">식당 소개(100자 이내)</label>
      <textarea class="form-control" id="res_introduction" name="res_introduction" rows="3"></textarea>
    </div>
</div>

<br><br>
<div class="d-grid gap-2" style="width: 400px; height: 50px; margin: auto;">
  <button class="btn btn-lg btn-primary" type="submit">등록하기</button>
  </div>

</form>  

<script type="text/javascript">

function selectSort1(sort1_num) {

	$("input[type=radio][name=sort1radio]").prop("checked",false);
	//$("input:checkbox[id='check1']").prop("checked",false);
    $("#sort1_"+sort1_num).prop("checked", true);
	console.log("sort1_num : "+ sort1_num);
	$.ajax({
		type : "get",
		url : "${contextPath}/selectSort2",
		data : {
			sort1_num : sort1_num
		},
		dataType : "text",
		success: function(data,status,xhr) {
			console.log("ajax success!==========");
			$("#sort2div").empty();
            $("#sort2div").append(data);
			$("#sort2div").show();
			$("#sort1").val(sort1_num);
		},
		error : function(xhr, status, error) {
			console.log(error);
		}
	}); //end ajax
	
	
}

function selectSort2(sort2_num) {
	$("input[type=radio][name=sort2radio]").prop("checked",false);
	$("#sort2_"+sort2_num).prop("checked",true);
	$("#sort2").val(sort2_num);
}


$("form").on("submit", function() {
	console.log("폼제출 스크립트");
	
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
	}
	else if(res_introduction.value.length > 200){/* 소개글 글자수검사 */
		console.log("글자수 제한");
		alert("최대 글자 수는 200자 입니다.");
		
	}
	
}); //폼제출스크립트



function checkEmpty(data, dataName) {
	if(data==""){
		alert(dataName + "를(을) 입력하세요.");
		event.preventDefault();
		return false;
	}else{
		return true;
	}
}

function checkDupliRestaurant(res_name, res_loc) {

	$.ajax({
		type : "post",
		url : "${contextPath}/searchRestaurant",
		data : {
			res_name : res_name,
			res_loc : res_loc
		},
		dataType : "text",
		success : function(data, status, xhr) {
			console.log(data); //중복일경우 1, 중복아닐경우 0 
			if(data==1){
				console.log("ajax data=1")
				alert("이미 등록 된 업체 입니다.");
				$("#res_name").val("");
				$("#location").val("");
				$("#res_loc").val("");
			}else if(data==0){
				console.log("ajax data=0")
			}
		},
		error : function(xhr, status, error) {
			console.log(error);
		}
	})//end ajax
	
}//end checkDupliRestaurant

</script>