<%@page import="org.apache.taglibs.standard.tag.common.xml.ForEachTag"%>
<%@page import="java.util.*" %>
<%@page import="com.dto.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>  
<c:set var="contextPath" value="<%= request.getContextPath()%>"></c:set>
<br>
<div class="container" id="resInfo" >
<%
MemberDTO mdto = (MemberDTO)request.getAttribute("mdto"); 
if(mdto!=null){
%>
<input type="hidden" id="userId" value="<%=mdto.getUserId()%>">
<%}else{ %>
<input type="hidden" id="userId" value="">
<%} %>
<br>
<div class="row">

  <div id="imgDiv" class="col-md-6" >
	<!-- 메인사진 -->
	<%DisplayRestaurantDTO rdto = (DisplayRestaurantDTO)request.getAttribute("rdto");
	for(int i=0; i<rdto.getImageList().size();i++){
		if(rdto.getImageList().get(i).getImg_rnk()==0){%>
		 <img id="bigImage" src="${contextPath}/resources/image/<%=rdto.getImageList().get(i).getImg_route()%>" style=" width: 700px; height:400px;  ">
	<%} }%>
		
	<%for(int i=0; i<rdto.getImageList().size();i++){
	if(rdto.getImageList().get(i).getImg_rnk()!=0){%>
		<a onclick="imgChange(<%=rdto.getImageList().get(i).getImg_rnk()%>)">
		 <img id="smallImage<%=rdto.getImageList().get(i).getImg_rnk()%>" src="${contextPath}/resources/image/<%=rdto.getImageList().get(i).getImg_route()%>" style=" width: 100px; height:100px; margin-right:16px; margin-left: 16px; margin-top: 15px;">
	    </a>
	<% }
		} %>
	
  </div>
 
 
  <!-- 소개 -->
	<div id="introductionDiv" class="col-md-5" style="margin-left: 7%;">
	<input type="hidden" id="scrabChk" name="scrabChk">
	<a style="float: right;" onclick="scrab()" ><img id="homeIcon" src="${contextPath}/resources/image/homeEmpty.png" style="width: 40px; height: 40px;"></a>
		<h2 style="text-align: center;"><%=rdto.getRes_name() %></h2><br>
	<p style="float: right;">
	 <%=rdto.getSORT1_NAME() %>/<%=rdto.getSORT2_NAME() %>
	</p>
	<h5>😋소개</h5>
	<p><%=rdto.getIntroduction() %></p><br>
	<h5>🗺위치</h5>
	<p id="location"><%=rdto.getRes_loc() %></p>
	<a onclick="openMap()">지도에서 확인하기</a><br><br>
	<%int up =0;
	int down =0;
	for(int i=0; i<rdto.getRateList().size();i++){
		if(rdto.getRateList().get(i).getRating()==0)
		{up++;
		}else{
			down++;
		}	
	}
	
	%>
	<a style="font-size: x-large;" >👍<%=up %> / 👎<%=down %></a>
	</div>
	
	<div class="alert alert-dismissible alert-primary" style="display: none; width: 600px; height: 450px; position:absolute; left:50%; top:50%; margin-left:-100px; margin-top:-150px;" id="mapDiv">
 		<button type="button" class="btn-close" onclick="closeMap()"></button>
 		<div id="google-map" style="width: 100%;height: 350px; margin: auto;"></div>
	</div>

</div>
    
</div>

<!-- 리뷰쓰기 -->
	<form id="rateForm" action="${contextPath}/rateRestaurant"  enctype="multipart/form-data" method="post" >
	<div class="col-md-8" style=" margin:auto;  margin-top: 50px;">
 	<input type="hidden" id="res_num" name="res_num" value="<%=rdto.getRes_num() %>">
	<ul>
	<li style="float: left; list-style: none;">
	<h1>📊&nbsp;</h1>
	</li>
	<li style="list-style: none; position: relative; top: 15px;">
	<div class="progress" >
	<%double sum = up+down;  
	double calUp = up/sum*100;
	double calDown = down/sum*100;
	%>
  <div class="progress-bar" role="progressbar" style="width: <%=calUp%>%;" aria-valuenow=" <%=calUp%>" aria-valuemin="0" aria-valuemax="100"></div>
  <div class="progress-bar bg-info" role="progressbar" style="width: <%=calDown%>%;" aria-valuenow="<%=calDown%>" aria-valuemin="0" aria-valuemax="100"></div>
   </div>
   </li>
	</ul>
	<br><br>
	
	<ul>
	<li style="float: left; list-style: none; position: relative; top: 50px; left:50px;">
	<p style="font-size: x-large;">🤔Rate Us!</p>
	<p>선택해 주세요!</p>
	<input id="rating" name="rating" type="hidden" value="">
	<div style="font-size: xx-large;  position: relative; right: 10px;" >
	
	<a onclick="chooseRate(0)">		 
	<img id="up" src="${contextPath}/resources/image/thumbs_up_empty.png" style=" width: 40px; height:40px;">
    </a> 
    
	<a>or</a> 
	
	<a onclick="chooseRate(1)">
	<img id="down" src="${contextPath}/resources/image/thumbs_down_empty.png" style=" width: 40px; height:40px;">
	</a>
	
	</div>
	<button type="submit" class="btn btn-primary" style="  position: relative; top: 30px; left:20px;">Rate</button>
	</li>
	
	<li style=" list-style: none; position: relative; bottom: 90px; left : 250px;">
	<div class="form-group"  style="width: 70%;" >
      <input class="form-control" type="file" id="formFile">
    </div>
    </li>
    
	<li style=" list-style: none; position: relative; bottom: 70px; left : 250px;">
	<div class="form-group" id="reviewForm"  style="width: 70%; height:50px; " >
      <textarea class="form-control" id="comments" name="comments" rows="3" ></textarea>
    </div>
	</li>	
	</ul>
	
	</div>
	</form>
	
    <br>
    <div id="reviewDiv" class="col-md-6" style="margin: auto; ">
		<%
		
		for(int i = 0; i< rdto.getRateList().size(); i++){
			
			if(rdto.getRateList().get(i).getRating()==0 ){
		%>
	
		<div style=" position: relative; top: 50px; right: 10%; float: left;">
		<img id="homeIcon" src="${contextPath}/resources/image/leftChat.png" style="width: 400px; height: 400px;">
			<div  style="position: relative; bottom: 320px; left: 60px;"  id="rateDiv">
			<p style="font-size:large; ">ID : <%=rdto.getRateList().get(i).getUserId() %></p>
			<img src="${contextPath}/resources/image/up.png" style="width: 50px; height: 50px; float: right; position: relative; right : 130px; bottom: 50px;">
			<p style="font-size: large;">comment : <br><%=rdto.getRateList().get(i).getComments() %></p>
			<p style="font-size: large;">등록일 : <%=rdto.getRateList().get(i).getUpdate_date() %></p>
			</div>
		</div>
	    <%}else{%>
		<div style=" position: relative; top: 50px; left:10%; float:right;">
		<img id="homeIcon" src="${contextPath}/resources/image/rightChat.png" style="width: 400px; height: 400px;">
			<div style="position: relative; bottom: 320px; left: 60px;"  id="rateDiv">
			<p style="font-size: large;">ID : <%=rdto.getRateList().get(i).getUserId() %></p>
			<img src="${contextPath}/resources/image/down.png" style="width: 50px; height: 50px; float: right; position: relative; right : 130px; bottom: 50px;">
			<p style="font-size: large;">comment : <br><%=rdto.getRateList().get(i).getComments() %></p>
			<p style="font-size: large;">등록일 : <%=rdto.getRateList().get(i).getUpdate_date() %></p>
			</div>
		</div>
    <% }
		 }
		%>
    </div>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">

	function chooseRate(rateNum) {
	  console.log(rateNum);
	  if(loginCheck()){ //로그인했을 때
		  
 		$("#rating").val(rateNum);
		  
		  if(rateNum==0){
			  console.log("up");
			  $("#down").attr("src", "${contextPath}/resources/image/thumbs_down_empty.png");
			  $("#up").attr("src", "${contextPath}/resources/image/thumbs_up.png");
		  }else if(rateNum == 1){
			  console.log("down");
			  $("#up").attr("src", "${contextPath}/resources/image/thumbs_up_empty.png");
			  $("#down").attr("src", "${contextPath}/resources/image/thumbs_down.png");
		  }
		  
		  
	  }else if(!loginCheck()){ //로그인 안했을 때
		//  event.preventDefault();	
	  }
	 
	}

	
	

	function imgChange(img_rnk) {
		console.log($("#smallImage"+img_rnk).attr("src"));
		var bigImg = $("#smallImage"+img_rnk).attr("src");
		var smallImg = $("#bigImage").attr("src") ;
		$("#bigImage").attr("src",bigImg );
		$("#smallImage"+img_rnk).attr("src",smallImg );
	}
	
	
	function scrab() {
		
		if(loginCheck()){ //로그인 했을 경우
			if ($("#homeIcon").attr("src")=="${contextPath}/resources/image/homeEmpty.png"){
				$("#homeIcon").attr("src","${contextPath}/resources/image/homeFulled.png");
				$("#scrabChk").val(1);
			}else if($("#homeIcon").attr("src")=="${contextPath}/resources/image/homeFulled.png"){
				$("#homeIcon").attr("src","${contextPath}/resources/image/homeEmpty.png");
				$("#scrabChk").val(0);
			}
		console.log("scrabChk : "+ $("#scrabChk").val());
			var scrab =  $("#scrabChk").val();
			var res_num = $("#res_num").val();
			
			$.ajax({
					type : "post",
					url : "${contextPath}/scrab",
					data :{
						scrab : scrab,
						res_num : res_num,
					},
					dataType : "text",
					success : function(data,status,xhr){
						console.log(data);
					},
					error : function(xhr,status, error){
						
					}
					
				})
			
		}else if(!loginCheck()){ //로그인 안된경우
			
		}
		
		
	}
	//지도열기
	function openMap() {
		 var location = $("#location").text();
		 console.log(location);
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
	      
	      $("#mapDiv").show();
	}
	
	//지도 닫기
	function closeMap() {
		 $("#mapDiv").hide();
	}
	
	//후기 등록
	$("form").on("submit", function() {
		console.log("폼제출 스크립트");
		
		if(loginCheck()){
			
			if(!checkEmpty($("#rating").val(), "👍?or👎? 선택해주세요.")){/* 식당이름 공백 검사 */
				console.log("not rated");
				$("#rating").focus();
				
			}else if(!checkEmpty($("#comments").val(), "후기를 남겨주세요.")){/* 주소 공백 검사 */
				console.log("후기 공백");
				$("#comments").focus();
				
			}
			
		}else{
			event.preventDefault();	
		}
		
		
	
	})//end submit
	
	function checkEmpty(data, message) {
		
		if(data==""){
			alert(message);
			event.preventDefault();
			return false;
		}else{
			return true;
		}
	}
	
	function loginCheck() {
		
		if($("#userId").val()==""){ //비로그인일 경우
			  alert("회원전용 입니다. 로그인 후 사용해 주세요.");
			  event.preventDefault();	
			  return false;
		  }else{
			  return true;
		  }
	}
		
	
</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBNYZG9ebC5wKMpzBTc0Uon-hxNHAFuf8o&callback=myMap"></script>