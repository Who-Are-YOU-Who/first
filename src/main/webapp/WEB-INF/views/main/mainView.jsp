<%@page import="org.apache.taglibs.standard.tag.common.xml.ForEachTag"%>
<%@page import="java.util.*" %>
<%@page import="com.dto.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>  
<c:set var="contextPath" value="<%= request.getContextPath()%>"></c:set>

   <!-- 검색 -->
      <form class="d-flex" style="margin:auto; width: 1000px">
        <input class="form-control me-sm-2" type="search" placeholder="Search" id="searchInput">
        <button class="btn btn-secondary my-2 my-sm-0" type="submit" onclick="search()">Search</button>
      </form>
<br>


<br>
<table style="margin: auto;">

<tr>
<td colspan="3">
<h4>KOREAN BEST 3 👍👍👍</h4>
</td>
</tr>

<tr>
 <div id="koresnResContainer"  class="col-md-10" style="margin: auto;">

<%
List <DisplayRestaurantDTO> koreanList =(List <DisplayRestaurantDTO>)request.getAttribute("koreanList");

System.out.println("jsp에서=="+koreanList);
 %>
 

 
 <% for(int i =0 ; i<3 ; i++) { //3개만
	 
	 if(koreanList.get(i).getSort1_num()==1){
	 %>
	 <td>
<div class="card border-primary mb-3" style="max-width: 20rem; float: left; margin-left: 10px; margin-right: 10px;">
  <div class="card-header"><a href="${contextPath}/eachReview?res_num=<%=koreanList.get(i).getRes_num()%>"><%=koreanList.get(i).getRes_name() %></a></div>
  <div class="card-body">
	<ul class="pagination">
	<li>
	
		
<% 	for (int j = 0 ; j < koreanList.get(i).getImageList().size()  ; j++) { %>		

<% if (j == 0 ){ %>
	<a id="<%=i%>img<%=j %>" href="${contextPath}/eachReview?res_num=<%=koreanList.get(i).getRes_num()%>" class="imgAtag" >
	<img src="${contextPath}/resources/image/<%= koreanList.get(i).getImageList().get(j).getImg_route() %>" style=" width: 220px; height: 200px; margin-left: 16px">
	</a>
<% } else { %>
	<a id="<%=i%>img<%=j %>" href="${contextPath}/eachReview?res_num=<%=koreanList.get(i).getRes_num()%>" style="display: none;" class="imgAtag">
	<img src="${contextPath}/resources/image/<%= koreanList.get(i).getImageList().get(j).getImg_route() %>" style=" width: 220px; height: 200px; margin-left: 16px">
	</a>
<%} %>
	
<%} %>	
	
	</li>
    <li style="margin-top: 60%" >
      <a href="javascript:nextImage(<%=i %>);" style="text-decoration-line : none; font-size:x-large;" >▶️</a>
    </li>
	</ul>    
    
  <br>
     <p class="card-text">
      <%=koreanList.get(i).getSORT1_NAME() %> / <%=koreanList.get(i).getSORT2_NAME() %>
     </p> 
     <%int up =0;
 	int down =0;
 	String recent ="등록된 후기 없음";
 	for(int k=0; k < koreanList.get(i).getRateList().size();k++){
 		if(koreanList.get(i).getRateList().get(0)!=null){
 			recent = koreanList.get(i).getRateList().get(0).getUpdate_date();
 		}
 		
    	 if(koreanList.get(i).getRateList().get(k).getRating()==0){
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
<input type="hidden" id="<%=i%>img_rnk_max" value="<%=koreanList.get(i).getImageList().size()%>">
</td>
<%
}
 }
%>

</div>
</tr>

<tr>
<td colspan="3">
<h4>AMERICAN BEST 3 👍👍👍</h4>
</td>
</tr>

<tr>

 <div id="AmericanResContainer"  class="col-md-10" style="margin: auto;">

<%
List <DisplayRestaurantDTO> americanList =(List <DisplayRestaurantDTO>)request.getAttribute("americanList");

System.out.println("jsp에서=="+americanList);
 %>
 

 
 <% for(int i =0 ; i< 3 ; i++) { //3개만
	 
	 if(americanList.get(i).getSort1_num()==2){%>
	 <td>
<div class="card border-primary mb-3" style="max-width: 20rem; float: left; margin-left: 10px; margin-right: 10px;">
  <div class="card-header"><a href="${contextPath}/eachReview?res_num=<%=koreanList.get(i).getRes_num()%>"><%=americanList.get(i).getRes_name() %></a></div>
  <div class="card-body">
	<ul class="pagination">
	<li>
	
		
<% 	for (int j = 0 ; j < americanList.get(i).getImageList().size()  ; j++) { %>		

<% if (j == 0 ){ %>
	<a id="<%=i%>img<%=j %>" href="${contextPath}/eachReview?res_num=<%=americanList.get(i).getRes_num()%>" class="imgAtag" >
	<img src="${contextPath}/resources/image/<%= americanList.get(i).getImageList().get(j).getImg_route() %>" style=" width: 220px; height: 200px; margin-left: 16px">
	</a>
<% } else { %>
	<a id="<%=i%>img<%=j %>" href="${contextPath}/eachReview?res_num=<%=americanList.get(i).getRes_num()%>" style="display: none;" class="imgAtag">
	<img src="${contextPath}/resources/image/<%= americanList.get(i).getImageList().get(j).getImg_route() %>" style=" width: 220px; height: 200px; margin-left: 16px">
	</a>
<%} %>
	
<%} %>	
	
	</li>
    <li style="margin-top: 60%" >
      <a href="javascript:nextImage(<%=i %>);" style="text-decoration-line : none; font-size:x-large;" >▶️</a>
    </li>
	</ul>    
    
  <br>
     <p class="card-text">
      <%=americanList.get(i).getSORT1_NAME() %> / <%=americanList.get(i).getSORT2_NAME() %>
     </p> 
     <%int up =0;
 	int down =0;
 	String recent ="등록된 후기 없음";
 	for(int k=0; k < americanList.get(i).getRateList().size();k++){
 		if(americanList.get(i).getRateList().get(0)!=null){
 			recent = americanList.get(i).getRateList().get(0).getUpdate_date();
 		}
 		
    	 if(americanList.get(i).getRateList().get(k).getRating()==0){
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
<input type="hidden" id="<%=i%>img_rnk_max" value="<%=americanList.get(i).getImageList().size()%>">
</td>
<%
}
 }
%>

</div>
</tr>

<tr>
<td colspan="3">
<h4>ITALIAN BEST 3 👍👍👍</h4>
</td>
</tr>

<tr>
 
<div id="italianResContainer"  class="col-md-10" style="margin: auto;">

<%
List <DisplayRestaurantDTO> italianList =(List <DisplayRestaurantDTO>)request.getAttribute("italianList");

System.out.println("jsp에서=="+italianList);
 %>
 

 
 <% for(int i =0 ; i< 3 ; i++) { //3개만
	 
	 if(italianList.get(i).getSort1_num()==3){%>
	 <td>
<div class="card border-primary mb-3" style="max-width: 20rem; float: left; margin-left: 10px; margin-right: 10px;">
  <div class="card-header"><a href="${contextPath}/eachReview?res_num=<%=koreanList.get(i).getRes_num()%>"><%=italianList.get(i).getRes_name() %></a></div>
  <div class="card-body">
	<ul class="pagination">
	<li>
	
		
<% 	for (int j = 0 ; j < italianList.get(i).getImageList().size()  ; j++) { %>		

<% if (j == 0 ){ %>
	<a id="<%=i%>img<%=j %>" href="${contextPath}/eachReview?res_num=<%=italianList.get(i).getRes_num()%>" class="imgAtag" >
	<img src="${contextPath}/resources/image/<%= italianList.get(i).getImageList().get(j).getImg_route() %>" style=" width: 220px; height: 200px; margin-left: 16px">
	</a>
<% } else { %>
	<a id="<%=i%>img<%=j %>" href="${contextPath}/eachReview?res_num=<%=italianList.get(i).getRes_num()%>" style="display: none;" class="imgAtag">
	<img src="${contextPath}/resources/image/<%= italianList.get(i).getImageList().get(j).getImg_route() %>" style=" width: 220px; height: 200px; margin-left: 16px">
	</a>
<%} %>
	
<%} %>	
	
	</li>
    <li style="margin-top: 60%" >
      <a href="javascript:nextImage(<%=i %>);" style="text-decoration-line : none; font-size:x-large;" >▶️</a>
    </li>
	</ul>    
    
  <br>
     <p class="card-text">
      <%=italianList.get(i).getSORT1_NAME() %> / <%=italianList.get(i).getSORT2_NAME() %>
     </p> 
     <%int up =0;
 	int down =0;
 	String recent ="등록된 후기 없음";
 	for(int k=0; k < italianList.get(i).getRateList().size();k++){
 		if(italianList.get(i).getRateList().get(0)!=null){
 			recent = italianList.get(i).getRateList().get(0).getUpdate_date();
 		}
 		
    	 if(italianList.get(i).getRateList().get(k).getRating()==0){
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
<input type="hidden" id="<%=i%>img_rnk_max" value="<%=italianList.get(i).getImageList().size()%>">
</td>
<%
}
 }
%>

</div>

</table>
 
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
function search() {
	var search = $("#searchInput").val();
	//이름,지역,음식
}

</script>


