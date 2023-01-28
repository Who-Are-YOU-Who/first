package com.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.MemberDAO;
import com.dto.MemberDTO;

@Service
public class MemberService {
	
	@Autowired
	MemberDAO dao;
	
	public List<MemberDTO> allMembers() {
		System.out.println("MemberService.allMembers()호출================");
		List<MemberDTO> list = dao.allMembers();
		return list;
	}

	public MemberDTO login() {
		// TODO Auto-generated method stub
		return null;
	}


	public MemberDTO checkId(String userId) {
		System.out.println(userId);
		MemberDTO mdto = dao.checkId(userId);
		return mdto;
	}
	
	public MemberDTO checkEmail(String userEmail) {
		System.out.println(userEmail);
		MemberDTO mdto = dao.checkEmail(userEmail);
		return mdto;
	}

	public int insertMember(HashMap<String, String> map) {
		int n = dao.insertMember(map);
		return n;
	}

	public MemberDTO loginIdCheck(String userId) {
		MemberDTO m = dao.loginIdCheck(userId);
		return m;
	}

}
