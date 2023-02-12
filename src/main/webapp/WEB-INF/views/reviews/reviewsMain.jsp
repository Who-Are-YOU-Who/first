<%@page import="org.apache.taglibs.standard.tag.common.xml.ForEachTag"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>  
<c:set var="contextPath" value="<%= request.getContextPath()%>"></c:set>

<div id="AllsortDiv" class="col-md-6" style="margin: auto;">
<div id="sort1Div">  <!-- 분류1 -->
<c:forEach var="s1" items="${s1List}" varStatus = "status">
<button id="sort1_${s1.sort1_num}" type="button" class="btn btn-primary btn-sm" onclick="selectSort1(${s1.sort1_num})">${s1.sort1_name}</button>
</c:forEach>
</div>
<br>
<div id="sort2Div"> <!-- 분류2 -->

</div>
</div>

<div id="resContainer">
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
	var imgRnk = $("#imgRank").val();
	console.log("현재 사진 : "+ imgRnk);
	imgRnk++;
	console.log("다음 사진 : "+ imgRnk);
	
	/*	$.ajax({
			type : "get",
			url : "${contextPath}/nextImage",
			data :{
				res_num : res_num,
				imgRnk : imgRnk
			},
			dataType : "JSON",
			success : function(data,status,xhr) {
				console.log(data);
				console.log(data.img_route);
				console.log(data.rnk);
				
				var img_route = data.img_route;
				var rkn = data.rnk;
				
				if(img_route !=""){
					console.log("이미지 바꾸기=====");
					$("#imgChange"+res_num).empty();
					$("#"+res_num+"nowImage").attr("src",img_route);
					$("#imgRank").val(rkn)//순위 넣기
				}else{
					console.log("다음이미지 없음=====")
					imgRnk--;
					$("#imgRank").val(imgRnk);
				}
				
			},
			error : function(xhr, status, error) {
				console.log(error);
			}
			
		})//end ajax*/
		
//	console.log($("#"+res_num+"nowImage").val());
	
	
	}
	
	
	
</script>
	

