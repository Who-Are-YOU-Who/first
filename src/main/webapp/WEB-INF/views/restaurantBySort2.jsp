<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.util.*" %>
<%@page import="com.dto.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<c:set var="contextPath" value="<%= request.getContextPath()%>"></c:set>


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
