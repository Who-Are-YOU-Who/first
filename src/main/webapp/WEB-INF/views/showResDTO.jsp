<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<c:set var="contextPath" value="<%= request.getContextPath()%>"></c:set>

<label class="col-form-label mt-4" for="inputDefault" >업체명</label>
<input type="text" class="form-control" id="res_name" name="res_name" value="${rdto.res_name}">
<input type="hidden" id="res_num" name="res_num" value="${rdto.res_num}">
<input type="hidden" id="res_sort1" value="${rdto.sort1_num}">
<input type="hidden" id="res_sort2" value="${rdto.sort2_num}">
<!-- 위치입력 -->
 <label class="col-form-label mt-4" for="inputDefault" >주소 (지도검색 버튼으로 위치를 정확하게 확인해야 저장됩니다.)</label>
<div class="input-group mb-3">
   <input type="text" class="form-control" value="${rdto.res_loc}" aria-label="Recipient's username" aria-describedby="button-addon2" id="location">
    <input type="hidden" id="res_loc" name="res_loc">  <!-- 위도 경도 저장 -->
      <button class="btn btn-primary" type="button" id="searchLocation">지도 검색</button>
</div>
<br>

<!-- 위치 지도--> 
<div id="google-map" style="width: 100%;height: 350px; margin: auto;"></div>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
   function myMap(){
	  var location = $("#location").val();
	  var loc =  location .split(',');
	  console.log("경도 : "+loc[0]+", 위도 : "+loc[1]);
	  var point = {lat: Number(loc[0]), lng: Number(loc[1])};
      var mapOptions = { 
    		  center: point, //지도중앙위치
            zoom:18//얼마나 가깝게 
      };
      
      $("#res_loc").val(loc[0]+","+loc[1]);

      var map = new google.maps.Map( 
             document.getElementById("google-map") 
            , mapOptions );
      //HTML 문서 상에서 id 속성이 map인 <div> 요소를 찾아서 반환합니다. 이 것을 google.maps.Map() 생성자의 인자로 넘겨서 호출하면 구글 지도 객체를 얻을 수 있습니다.
   		
      var geocoder = new google.maps.Geocoder();
      
      var marker = new google.maps.Marker({position: point , map: map});
      
     
      
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

<!-- 카테고리설정1 --> 
<br>
<div style="margin: auto;" id="sort1div">
<h5>분류1</h5>
  <c:forEach var="s1List" items="${s1List}" varStatus="status">
     <input name="sort1radio" class="form-check-input" type="radio" onclick="selectSort1(${s1List.sort1_num})"  id="sort1_${s1List.sort1_num}" value="${s1List.sort1_name}">${s1List.sort1_name} &nbsp;
  	 <input type="hidden" id="s1_sort1_${s1List.sort1_num}"  value="${s1List.sort1_num}">
  <c:if test="${s1List.sort1_num/4==1||s1List.sort1_num/8==1}"><br></c:if>
  </c:forEach>
  
   <!-- 저장된 정보로 분류1 미리 체크 -->
  <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script>
  
  $(document).ready(function(){

	  console.log("res_sort1 == "+$("#res_sort1").val());
	  var num = $("#res_sort1").val();
	  console.log("s1_sort1 == "+$("#s1_sort1_"+num).val());
	
	  $("#sort1_"+num).prop("checked", true); //라디오 체크
	  $("#sort1").val(num);		
  });
 
	
  </script>
  
</div>

<!-- 카테고리설정2 --> 
<div style="margin: auto;" id="sort2div">
<h5>분류2</h5>
  <c:forEach var="s2List" items="${s2List}" varStatus="status">
     <input name="sort2radio" class="form-check-input" type="radio" onclick="selectSort2(${s2List.sort2_num})"  id="sort2_${s2List.sort2_num}" value="${s2List.sort2_name}">${s2List.sort2_name} &nbsp;
  <c:if test="${s2List.sort2_num/4==1||s2List.sort2_num/8==1}"><br></c:if>
  </c:forEach>
  
   <!-- 저장된 정보로 분류2 미리 체크 -->
  <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script>
  
  $(document).ready(function(){

	  console.log("res_sort2 == "+$("#res_sort2").val());
	  var num = $("#res_sort2").val();
	  console.log("s2_sort2 == "+$("#sort2_"+num).val());
	
	  $("#sort2_"+num).prop("checked", true); //라디오 체크
	  $("#sort2").val(num);	
  });
 
	
  </script>
  
</div>

<input type="hidden" id="sort1" name="sort1">
<input type="hidden" id="sort2" name="sort2">
<br>
	<!-- 등록된 이미지  -->
	<h5>등록된 이미지</h5>
	<table>
	<tr>
	<c:forEach var="iList" items="${iList}" varStatus="status">
	
	  <td id="imgtd${iList.img_rnk}">
		<button type="button" class="btn-close"  style="float: right;" onclick="deleteImg(${iList.img_rnk})"></button>
		<img id="img${iList.img_rnk}" src="${contextPath}/resources/image/${iList.img_route}" style=" width: 220px; height: 200px; margin-left: 16px"> 
	  </td>
	
	</c:forEach>
	</tr>
	</table>
	
<input type="hidden" id="delImg" name="delImg"> 
<!-- 사진등록 -->
<div style="margin: auto;">
 	<div id="uploadImages" class="form-group">
      <label for="formFile" class="form-label mt-4">사진 추가 등록</label>
      <input class="form-control" type="file" id="imageFiles" name="imageFiles" multiple="multiple">
    </div>
</div>


<!-- 식당소개  -->
<div id="introduction" style="margin: auto;">
    <div class="form-group">
      <label for="exampleTextarea" class="form-label mt-4">식당 소개(100자 이내)</label>
      <textarea class="form-control" id="res_introduction" name="res_introduction" rows="3" >${rdto.introduction}</textarea>
    </div>
</div>

<br><br>

  <button class="btn btn-primary" type="submit" style="float: left; width: 300px">수정 완료</button>
  <button type="button" class="btn btn-secondary" style="width:200px; float: right;" onclick="deleteRestaurant(${rdto.res_num})">업체 삭제</button>


<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script>
  
  function deleteRestaurant(res_num) {
	
	  location.href="${contextPath}/deleteRestaurant?res_num="+res_num;
}
  
  
  function selectSort1(sort1_num) {
	   
	    $("input[type=radio][name=sort1radio]").prop("checked",false);  //모든 radio 체크 해제
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
	} //end selectSort1

	function selectSort2(sort2_num) {
		$("#sort2").val(sort2_num);
	}
	
	function deleteImg(img_rnk) {
		console.log("이미지 삭제===="+img_rnk+"번째 사진 삭제");
		var res_num =$("#res_num").val()
		$("#imgtd"+img_rnk).remove();
		var deleteImg = $("#delImg").val();
		deleteImg = deleteImg + "," + img_rnk ; 
		$("#delImg").val(deleteImg);
		alert(deleteImg);

	/*	$.ajax({
			type : "get",
			url : "${contextPath}/deleteImg",
			data : {
				res_num : res_num,
				img_rnk : img_rnk
			},
			dataType : "text",
			success :function(data, status, xhr){
				console.log("이미지 삭제 성공!!");
				if(data == 1){
					$("#imgtd"+img_rnk).remove();
				}else{
					alert("이미지 삭제 실패. 다시 시도해 주세요.");
				}
				
			},
			error : function(xhr, status, error) {
				console.log(error);
			}
		})//end ajax*/
		
	}
  </script>
