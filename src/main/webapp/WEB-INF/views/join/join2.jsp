
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<c:set var="contextPath" value="<%= request.getContextPath()%>"></c:set>

<h1 style="text-align: center;">Create Account</h1>

<div class="alert alert-dismissible alert-primary" 
style="display: none;  width: 30%; height: 100px; margin: auto; font-size: large; text-align: center;" id="alertDiv">
  <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
</div>

<form action="${contextPath}/joinSuccess" id="joinForm" >

<!-- 회원가입 폼  -->
 <div class="col-md-4" style="margin: auto;">
 
 <!-- 이름  -->
 <div class="form-group">
  <label class="col-form-label mt-4" for="inputDefault" >Name</label>
  <input type="text" class="form-control" placeholder="이름을 입력하세요 " id="userName" name ="userName">
 </div>

<!-- 이메일  -->
<div class="form-group">
  <label class="col-form-label mt-4" for="inputDefault">Email</label>
  <input type="email" class="form-control" placeholder="이메일을 입력하세요 " id="userEmail" name ="userEmail">
    <div class="invalid-feedback" style="display: none" id="usedEmail">이미 등록된 이메일 입니다.</div>
 </div>

 <!-- 아이디 -->
<div class="form-group has-danger" >
  <label class="form-label mt-4" for="inputInvalid">ID</label>
  <input type="text" class="form-control" id="userId" name="userId" placeholder="아이디 영문 5자 이상 12자 이하">
  <div class="invalid-feedback" style="display: none" id="usedId">이미 사용중인 아이디 입니다.</div>
</div>


<!-- 비밀번호 -->
<div class="form-group">
  <label class="col-form-label mt-4" for="inputDefault">Password</label>
  <input type="password" class="form-control" placeholder="비밀번호는 영문 ,숫자 포함 8자 이상으로 입력 " id="userPw" name="userPw">
  <div class="valid-feedback" style="display: none" id="wrongPw"></div>
</div>

<!-- 비밀번호 확인 -->
<div class="form-group has-success">
  <label class="form-label mt-4" for="inputValid">Password Check</label>
  <input type="password" class="form-control" placeholder="비밀번호 재입력" id="pwcheck" name="pwcheck">
  <div class="valid-feedback" style="display: none" id="pwDone"></div>
</div>
<br><br>
<div class="col-md-5" style="margin: auto;">
<button type="submit" class="btn btn-primary btn-lg" style="width: 300px;" >회원가입 하기</button>
</div>


</div>
</form>



<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">



//이메일 중복검사
$("#userEmail").on("keyup", function() {
	$("#userEmail").attr("class","form-control");
	$("#usedEmail").hide();
	var userEmail = $("#userEmail").val();
	$.ajax({
		type : "post",
		url : "${contextPath}/memberCheck",
		data : {
			userEmail : userEmail
		},
		dataType : "text",
		success : function(data,status,xhr) {
			console.log(data);
			if(data == "이메일중복"){
				console.log(data);
				$("#userEmail").attr("class","form-control is-invalid");
				$("#usedEmail").show();
			}

		},
		error : function(xhr, status, error) {
			console.log(error);
		}
		
		
	});//end ajax
	
}) //이메일 중복검사 끝


//아이디 중복검사
$("#userId").on("keyup", function() {
	$("#userId").attr("class","form-control");
	$("#usedId").hide();
	var userId = $("#userId").val();
	console.log("아이디 중복검사==== " );
	$.ajax({
		type : "post",
		url : "${contextPath}/memberCheck",
		data : {
			userId : userId
		},
		dataType : "text",
		success : function(data,status,xhr) {
			console.log(data);
			if (data == "아이디중복"){
				console.log(data);
				$("#userId").attr("class","form-control is-invalid");
				$("#usedId").show();
			}
		},
		error : function(xhr, status, error) {
			console.log(error);
		}
		
		
	})//end ajax
	
	
	
})//아이디중복검사 끝


$("#userPw").on("keyup", function() {
	
	var password1RegExp = /^[a-zA-z0-9]{4,12}$/; //비밀번호 유효성 검사
	if (!password1RegExp.test($("#userPw").val())) {
		$("#wrongPw").text("비밀번호는 영문 대소문자와 숫자 4~12자리로 입력해야합니다.");
		$("#wrongPw").show();
	}else{
		$("#wrongPw").hide();
	}
	
	if($("#pwcheck").val() != $("#userPw").val()){
		console.log("비밀번호 불일치");
		$("#pwcheck").attr("class","form-control is-invalid");
		$("#pwDone").attr("class", "invalid-feedback");
		$("#pwDone").text("비밀번호가 일치하지 않습니다.");
		$("#pwDone").show();
	}else if($("#pwcheck").val() == $("#userPw").val()){
		console.log("비밀번호 일치");
		$("#pwcheck").attr("class","form-control is-valid");
		$("#pwDone").attr("class", "valid-feedback");
		$("#pwDone").text("비밀번호가 일치합니다.");
		$("#pwDone").show();
	}
	
})

 //비번 일치 검사
$("#pwcheck").on("keyup", function() {
	console.log("비밀번호 : " + $("#userPw").val());
	if ($("#userPw").val()== null || $("#userPw").val()==""){//비밀번호가 공백일 때
		$("#pwcheck").attr("class","form-control is-invalid");
		$("#pwDone").attr("class", "invalid-feedback");
		$("#pwDone").text("비밀번호를 먼저 입력 해 주세요.");
		$("#pwDone").show();
		
	}else if($("#userPw").val()!= null || $("#userPw").val()!=""){ //비밀번호가 공백이 아닐 떄
		
		$("#pwcheck").attr("class","form-control is-invalid");
		if($("#pwcheck").val() != $("#userPw").val()){
			console.log("비밀번호 불일치");
			$("#pwcheck").attr("class","form-control is-invalid");
			$("#pwDone").attr("class", "invalid-feedback");
			$("#pwDone").text("비밀번호가 일치하지 않습니다.");
			$("#pwDone").show();
		}else if($("#pwcheck").val() == $("#userPw").val()){
			console.log("비밀번호 일치");
			$("#pwcheck").attr("class","form-control is-valid");
			$("#pwDone").attr("class", "valid-feedback");
			$("#pwDone").text("비밀번호가 일치합니다.");
			$("#pwDone").show();
		}
		
	}
	
	
}); 


//공백확인 함수
function checkExistData(value, dataName) {
	console.log(dataName + "공백 확인 함수");
  if (value == "") {
		alert(dataName+" 이(가)공백입니다. 입력하세요.");
	//  $("#alertDiv").text(dataName+" 이(가)공백입니다. 입력하세요.");
	//  $("#alertDiv").show();
		console.log(dataName + "공백 return false");
      return false;
  }else{
		console.log(dataName +"공백아님 return true");
	  return true;
  }

}


//아이디 유효성 검사
function checkUserId(id) {
    //Id가 입력되었는지 확인하기
    console.log("checkUserId함수 매개변수 : "+ id);
    if (!checkExistData(id, "아이디"))
        return false;

    var idRegExp = /^[a-zA-z0-9]{4,12}$/; //아이디 유효성 검사
    if (!idRegExp.test(id)) {
    	console.log("아이디 유효성 검사");

		alert("아이디는 영문 대소문자와 숫자 5~12자리로 입력해야합니다.");
       // $("#alertDiv").text("아이디는 영문 대소문자와 숫자 5~12자리로 입력해야합니다.");
  	   // $("#alertDiv").show();
        $("#userId").val("") ;
        $("#userId").focus();
        return false;
    }else{
        return true; //확인이 완료되었을 때
    }

}//아이디 유효성검사 끝

function checkUserPw(pw) {//비밀번호 유효성 검사
	
    console.log("checkUserPw함수 매개변수 : "+ pw);
    if (!checkExistData(pw, "비밀번호"))
        return false;
    
	var password1RegExp = /^[a-zA-z0-9]{4,12}$/; //비밀번호 유효성 검사
	if (!password1RegExp.test(pw)) {
		alert("비밀번호는 영문 대소문자와 숫자 4~12자리로 입력해야합니다.");
		//$("#alertDiv").text("비밀번호는 영문 대소문자와 숫자 4~12자리로 입력해야합니다.");
  	   // $("#alertDiv").show();
        $("#userPw").val("") ;
        $("#userPw").focus();
	    return false;
	}else{
		return true;
	}
}//비밀번호 유효성검사 끝


function checkPwDupliate(pwcheck) {//비밀번호 확인 유효성 검사  
    console.log("checkPwDupliate함수 매개변수 : "+ pwcheck);
    if(!checkExistData(pwcheck, "비밀번호 확인")) return false;
    
    if(pwcheck != $("#userPw").val()){
    	alert("비밀번호가 일치하지 않습니다. 다시 입력해주세요.");
    	//$("#alertDiv").text("비밀번호가 일치하지 않습니다. 다시 입력해주세요.");
  	    //$("#alertDiv").show();
        $("#pwcheck").val("") ;
        $("#pwcheck").focus();
        return false;
    }else{
    	return true;
    }

}//비밀번호 확인 유효성검사 끝


//폼제출시 유효성검사 함수
function checkAll() {
	console.log("checkAll함수 실행");
	console.log("checkAll : userId : "+  $("#userId").val() );
	console.log("checkAll : userId : "+  $("#userName").val() );
	console.log($("#userEmail").val());
	if (!checkExistData( $("#userName").val(),"이름 ")){  //이름 유효성 검사
    	console.log("이름 유효성 검사 return false");
    	 $("#userName").focus();
        return false;
        
    }else if(!checkExistData( $("#userEmail").val(),"이메일")){  //이메일 유효성 검사
    	console.log("이메일 유효성검사 return false");
    	 $("#userEmail").focus();
         return false;
         
    }else if (!checkUserId( $("#userId").val())) {  //아이디 유효성 검사
		console.log("아이디 유효성 검사 return false");
        return false;
        
    }else if(!checkUserPw( $("#userPw").val())){  //비밀번호 유효성 검사
    	console.log("비밀번호 유효성 검사 return false");
        return false;
    	
    }else if(!checkPwDupliate( $("#pwcheck").val())){  //비밀번호 확인 유효성 검사
    	console.log("비밀번호 확인 유효성 검사 return false");
        return false;
    	
    }else{
		console.log("return true");
    	return true;
    }
}

$("form").on("submit", function() {
	console.log("폼제출 스크립트");
	
	if(!checkAll()){
		console.log("제출 실패!!");
		event.preventDefault();
	}else{
		console.log("제출됨");
		
	}
});

</script>





