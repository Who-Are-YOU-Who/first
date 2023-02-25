<%@page import="org.apache.taglibs.standard.tag.common.xml.ForEachTag"%>
<%@page import="java.util.*" %>
<%@page import="com.dto.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>  
<c:set var="contextPath" value="<%= request.getContextPath()%>"></c:set>

 
<div style="width: 100%;">
<div id="AllsortDiv" class="col-md-6" style="margin: auto;">
<div id="sort1Div">  <!-- 분류1 -->

</div>
<br>
<div id="sort2Div"> <!-- 분류2 -->

</div>
</div>
<br><br>
<div id="resContainer"  class="col-md-10" style="margin: auto;">

<%
List <DisplayRestaurantDTO> rList =(List <DisplayRestaurantDTO>)request.getAttribute("rList");

System.out.println("jsp에서=="+rList);
 %>
 
 
 <% for(int i =0 ; i< rList.size() ; i++) {  %>

<div class="card border-primary mb-3" style="max-width: 20rem; float: left; margin-left: 10px; margin-right: 10px;">
  <div class="card-header"><a href="${contextPath}/eachReview?res_num="><%=rList.get(i).getRes_name() %></a></div>
  <div class="card-body">
	<ul class="pagination">
	<li>
	
		
<% 	for (int j = 0 ; j < rList.get(i).getImageList().size()  ; j++) { %>		

<% if (j == 0 ){ %>
	<a id="<%=i%>img<%=j %>" href="${contextPath}/eachReview?res_num=<%=rList.get(i).getRes_num()%>" class="imgAtag" >
	<img src="${contextPath}/resources/image/<%= rList.get(i).getImageList().get(j).getImg_route() %>" style=" width: 220px; height: 200px; margin-left: 16px">
	</a>
<% } else { %>
	<a id="<%=i%>img<%=j %>" href="${contextPath}/eachReview?res_num=<%=rList.get(i).getRes_num()%>" style="display: none;" class="imgAtag">
	<img src="${contextPath}/resources/image/<%= rList.get(i).getImageList().get(j).getImg_route() %>" style=" width: 220px; height: 200px; margin-left: 16px">
	</a>
<%} %>
	
<% } %>	
	
	</li>
    <li style="margin-top: 60%" >
      <a href="javascript:nextImage(<%=i %>);" style="text-decoration-line : none; font-size:x-large;" >▶️</a>
    </li>
	</ul>    
    
  <br>
     <p class="card-text">
      <%=rList.get(i).getSORT1_NAME() %> / <%=rList.get(i).getSORT2_NAME() %>
     </p> 
     <%int up =0;
 	int down =0;
 	String recent ="등록된 후기 없음";
 	for(int k=0; k < rList.get(i).getRateList().size();k++){
 		if(rList.get(i).getRateList().get(0)!=null){
 			recent = rList.get(i).getRateList().get(0).getUpdate_date();
 		}
 		
    	 if(rList.get(i).getRateList().get(k).getRating()==0){
    		 up++;
    	 }else{
    		 down++;
    	 }
     }%>
    
    <p class="card-text">👍<%=up %> / 👎<%=down %></p>
  </div>
   <div class="card-footer text-muted">
 		<%=recent %>
  </div>
</div>
<input type="hidden" id="<%=i%>img_rnk" value="0" >
<input type="hidden" id="<%=i%>img_rnk_max" value="<%=rList.get(i).getImageList().size()%>">
<%} %>

</div>

</div>

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">

function selectSort1(sort1_num) {
	$.ajax({
		type : "get",
		url : "${contextPath}/selectSort1",
		data : {
			sort1_num : sort1_num
		},
		dataType : "text",
		success : function(data,status,xhr) {
			console.log("sort1선택됨=======sort2보이기====");
			$("#sort2Div").empty();
			$("#sort2Div").append(data);
		},
		error : function(xhr, status, error) {
			console.log(error);
		}
	})//end ajax
	
} //end selectSort1

function selectSort2(sort2_num) {

	//선택과 해제 설정
	if($("#sort2_"+sort2_num).val()=="unchecked"){
		console.log("체크함========");
		$("#sort2_"+sort2_num).val("checked");
		
	}else if($("#sort2_"+sort2_num).val()=="checked"){
		console.log("체크해제========");
		$("#sort2_"+sort2_num).val("unchecked");
	}
			
	
	var sort2List = [];
	var sendingList = [];
	
	sort2List = $("#sort2Div").children();
	//console.log(sort2List);
	
	//요소들의 value가 checked일 때 sendingList에 저장
	for(var i = 0; i<sort2List.length;i++ ){
		console.log("요소==="+sort2List.get(i).value);
		
		if(sort2List.get(i).value=="checked"){	
			console.log("선택한 부류2===="+sort2List.get(i).id);
			var s2name = sort2List.get(i).id;
			var splitName = [];
			splitName = s2name.split('_');
			console.log("List에 들어가는 sort2번호 : ");
			sendingList[i] = splitName[1];
			
		}
		
	}//end for
	console.log(sendingList);
	
	$.ajax({
		type : "get",
		url : "${contextPath}/selectRestaurant",
		data : {
			sendingList : sendingList
		},
		dataType : "text",
		traditional: true,  //list요소 전달 시 추가
		success : function(data,status,xhr) {
			console.log("sort2선택됨=======분류에 맞는 업체 보이기====");
			$("#resContainer").empty();
			$("#resContainer").append(data);
		},
		error : function(xhr, status, error) {
			console.log(error);
		}
	})//end ajax
}



function nextImage(res_num) {
	
	var now = $("#"+res_num+"img_rnk").val(); 
	var next = parseInt(now)+1;
	var max = parseInt($("#"+res_num+"img_rnk_max").val());
	
	console.log("now="+now);
	console.log("next="+next);
	console.log("res_num="+res_num);
	
	if(next >= max){ //다음이미지 없을 경우
		$("#"+res_num+"img_rnk").val(0);
		$("#"+res_num+"img"+now).hide();
		$("#"+res_num+"img"+0).show();
		
	}else{
		$("#"+res_num+"img_rnk").val(next);
		$("#"+res_num+"img"+now).hide();
		$("#"+res_num+"img"+next).show();
		
	}
	
	
	}
	
	
	
</script>
	

