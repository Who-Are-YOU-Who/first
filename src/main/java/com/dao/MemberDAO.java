package com.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.MemberDTO;

@Repository
public class MemberDAO {
	
	@Autowired
	SqlSessionTemplate template;//자동주입

	public List<MemberDTO> allMembers() {
		System.out.println("MemberDAO.allMembers()호출=================");
		List<MemberDTO> list= template.selectList("MemberMapper.allMembers");
		return list;
	}

	public MemberDTO checkId(String userId) {
		System.out.println(userId);
		MemberDTO mdto = template.selectOne("MemberMapper.checkId", userId);
		return mdto;
	}

	public MemberDTO checkEmail(String userEmail) {
		System.out.println(userEmail);
		MemberDTO mdto = template.selectOne("MemberMapper.checkEmail", userEmail);
		return mdto;
	}

	public int insertMember(HashMap<String, String> map) {
		System.out.println("MemberDAO.insertMember(map)=======userId : "+map.get("userId"));
		int n = template.insert("MemberMapper.insertMember", map);
		return n;
	}

	public MemberDTO loginIdCheck(String userId) {
		System.out.println("로그인 (아이디) 확인 DAO====== ");
		MemberDTO m = template.selectOne("MemberMapper.loginIdCheck", userId);
		return m;
	}
	

}
