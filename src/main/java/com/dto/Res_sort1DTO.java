package com.dto;

import org.apache.ibatis.type.Alias;

@Alias("Res_sort1DTO")
public class Res_sort1DTO {
	
	private int sort1_num;
	private String sort1_name;
	
	public Res_sort1DTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Res_sort1DTO(int sort1_num, String sort1_name) {
		super();
		this.sort1_num = sort1_num;
		this.sort1_name = sort1_name;
	}
	public int getSort1_num() {
		return sort1_num;
	}
	public void setSort1_num(int sort1_num) {
		this.sort1_num = sort1_num;
	}
	public String getSort1_name() {
		return sort1_name;
	}
	public void setSort1_name(String sort1_name) {
		this.sort1_name = sort1_name;
	}
	
	@Override
	public String toString() {
		return "Res_sort1DTO [sort1_num=" + sort1_num + ", sort1_name=" + sort1_name + "]";
	}
	
	

}
