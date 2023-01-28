package com.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dto.MemberDTO;
import com.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	MemberService service;
	
	@RequestMapping("/join")
	public String join() {
		return "join1";
	}
	
	@RequestMapping("/join2")
	public String join2() {
		return "join2";
	}
	
	//멤버 중복검사 (id, email)
	@RequestMapping(value="/memberCheck", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public @ResponseBody String memberCheck(String userEmail, String userId) {
	System.out.println("memberCheck 매서드=======");
	System.out.println("아이디    :" + userId);
	System.out.println("이메일    :" + userEmail);
	
	MemberDTO mdto = new MemberDTO();

	String result = "";
	
	if(userId != null) { //넘어온id 데이터가  null이 아닐 경우
		mdto = service.checkId(userId);
		
		if(mdto != null) {//중복일 경우
			result = "아이디중복";
		}else {
			result = "중복없음";
		}
		
	}else if(userEmail !=null) { //넘어온 email 데이터가 null이 아닐 경우
		mdto = service.checkEmail(userEmail);
		
		if(mdto != null) { //중복일 경우
			result ="이메일중복";
		}else {
			result = "중복없음";
		}
	}
	
		return result;
	}
	
	
	@RequestMapping("/joinSuccess")
	public String joinSuccess (String userId, String userEmail, String userPw, String userName) {
		HashMap<String, String> map = new HashMap<>();
		map.put("userId", userId);
		map.put("userEmail", userEmail);
		map.put("userPw", userPw);
		map.put("userName", userName);

		
		int n = 0;
		n = service.insertMember(map);
		System.out.println("회원 "+n+"명 가입 완료");
		
		String success = "joinSuccess";
		
		/*if(n!=0) {  //회원가입 성공했을 떄
		 success = "joinSuccess";
		}else {  //실패했을 때
			//에러페이지주소
			 success = "joinSuccess";
		}*/

		return success;
	}

}
