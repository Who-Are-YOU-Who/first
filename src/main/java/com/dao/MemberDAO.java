package com.dao;

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


}
