package com.dto;

import org.apache.ibatis.type.Alias;

@Alias("Res_sort2DTO")
public class Res_sort2DTO {
	
	private int sort2_num;
	private String sort2_name;
	
	public Res_sort2DTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Res_sort2DTO(int sort2_num, String sort2_name) {
		super();
		this.sort2_num = sort2_num;
		this.sort2_name = sort2_name;
	}

	public int getSort2_num() {
		return sort2_num;
	}

	public void setSort2_num(int sort2_num) {
		this.sort2_num = sort2_num;
	}

	public String getSort2_name() {
		return sort2_name;
	}

	public void setSort2_name(String sort2_name) {
		this.sort2_name = sort2_name;
	}

	@Override
	public String toString() {
		return "Res_sort2DTO [sort2_num=" + sort2_num + ", sort2_name=" + sort2_name + "]";
	}
	
	

}
