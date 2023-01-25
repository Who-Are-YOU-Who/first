package com.dto;

import org.apache.ibatis.type.Alias;

@Alias("MemberDTO")
public class MemberDTO {

	private String user_id;
	private String user_pw;
	private String user_name;
	private String user_emal1;
	private String user_emal2;
	private String user_phone;
	private int role;
	
	public MemberDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MemberDTO(String user_id, String user_pw, String user_name, String user_emal1, String user_emal2,
			String user_phone, int role) {
		super();
		this.user_id = user_id;
		this.user_pw = user_pw;
		this.user_name = user_name;
		this.user_emal1 = user_emal1;
		this.user_emal2 = user_emal2;
		this.user_phone = user_phone;
		this.role = role;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_pw() {
		return user_pw;
	}

	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_emal1() {
		return user_emal1;
	}

	public void setUser_emal1(String user_emal1) {
		this.user_emal1 = user_emal1;
	}

	public String getUser_emal2() {
		return user_emal2;
	}

	public void setUser_emal2(String user_emal2) {
		this.user_emal2 = user_emal2;
	}

	public String getUser_phone() {
		return user_phone;
	}

	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}

	public int getRole() {
		return role;
	}

	public void setRole(int role) {
		this.role = role;
	}

	@Override
	public String toString() {
		return "MemberDTO [user_id=" + user_id + ", user_pw=" + user_pw + ", user_name=" + user_name + ", user_emal1="
				+ user_emal1 + ", user_emal2=" + user_emal2 + ", user_phone=" + user_phone + ", role=" + role + "]";
	}
	
	
}
