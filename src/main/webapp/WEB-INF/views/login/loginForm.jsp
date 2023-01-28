<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>  
<c:set var="contextPath" value="<%= request.getContextPath()%>"></c:set>
<br>

<div class="col-md-4" style="margin: auto;">
<form id="loginForm" action="${contextPath}/login" method="post">
		<h1 style="text-align: center;">LOGIN</h1>
	<br>
  		<div class="form-floating mb-3">
    		<input type="text" class="form-control" id="userId" name="userId" placeholder="Id">
    		<label for="floatingInput">ID</label>
  		</div>
  	<br>
  		<div class="form-floating">
    		<input type="password" class="form-control" id="userPw" name="userPw" placeholder="Password">
    		<label for="floatingPassword">Password</label>
 		</div>
 	<br>
 	 <button type="submit" class="btn btn-primary" style="float: right; width: 250px;">LOGIN</button>
 	   <div class="form-check">
        	<input class="form-check-input" type="checkbox" value="" id="loginchecking" name="loginchecking">
        	<input type="hidden" name="saveId" id="saveId">
        	<label class="form-check-label" for="flexCheckDefault">
          	아이디 저장
        	</label>
      </div>
    </form>	 
</div><br><br>

	<div class="col-md-5" style="margin-left: 33%">
 	아이디를 잊으셨습니까? <button type="button" class="btn btn-link" onclick="location.href='${contextPath}/findId';">아이디 찾기</button>/
 	비밀번호를 잊으셨습니까? <button type="button" class="btn btn-link" onclick="location.href='${contextPath}/findPw';">비밀번호 찾기</button>
 	</div>
 	<div class="col-md-3" style="margin-left: 40%">
 	 아직 회원이 아니십니까? <button type="button" class="btn btn-link" onclick="location.href='${contextPath}/join';">회원가입 하기</button>
 	</div>
 	
 	
 	
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">

$("#loginchecking").on("click", function() {
	if($("#loginchecking").is(":checked")){
		$("#saveId").val("do");
	}else{
		$("#saveId").val("dont");
	}
})
</script>

