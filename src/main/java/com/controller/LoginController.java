package com.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dto.MemberDTO;
import com.service.MemberService;


@Controller
public class LoginController {
	
	@Autowired
	MemberService service;

	@RequestMapping(value="/login",  method = RequestMethod.GET)
	public String login() {
		
		return "loginForm";
	}
	
	@RequestMapping(value="/login",  method = RequestMethod.POST)
	public String login(@RequestParam HashMap<String,String> map, RedirectAttributes m, HttpSession session) {
		System.out.println("로그인 userId :"+ map.get("userId"));
		System.out.println("로그인 userPw :"+ map.get("userPw"));
		System.out.println("아이디저장 체크 :"+ map.get("saveId")); //아이디저장 체크시 : do, 미체크시 :dont
		String userId = map.get("userId");
		String userPw = map.get("userPw");
		String saveId = map.get("saveId");
		MemberDTO memberCheck = new MemberDTO();
		MemberDTO mdto =null;
		
		memberCheck = service.loginIdCheck(userId);
		if(memberCheck != null) { //가입된 아이디 일 경우
			if(memberCheck.getUserPw().equals(userPw)) {//비밀번호가 일치하는 경우
				System.out.println("아이디, 비밀번호 일치*********************");
				
				if(saveId.equals("do")) {//아이디저장 체크시
					System.out.println("아이디저장 체크==============");
					//아이디저장 로직 추가
					//session.setAttribute(name, value);  	
				}
				
				session.setAttribute("mdto", memberCheck);
				return  "redirect:/home";
			
			}else {//비밀번호가 일치하지 않는 경우
				System.out.println("아이디, 비밀번호 불일치********************");
				//로그인 실패
				m.addFlashAttribute("mesg", "비밀번호가 틀렸습니다.");
				return "redirect:/login";
			}
			
		}else { //등록되지 않은 아이디일 경우
			System.out.println("미가입 아이디********************");
			//로그인 실패
			m.addFlashAttribute("mesg", "해당아이디는 등록되지 않았습니다.");
			return "redirect:/login";
		}
		

	}

	
}
