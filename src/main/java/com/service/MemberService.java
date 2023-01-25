package com.service;

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
	

}
