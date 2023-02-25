package com.dto;

import org.apache.ibatis.type.Alias;

@Alias("RestaurantDTO")
public class RestaurantDTO extends ImagesDTO{
	
	private int res_num;
	private String res_name;
	private String res_loc;
	private int sort1_num;
	private String sort1_num_name;
	
	
	private int sort2_num;
	private String sort2_num_name;
	private String introduction;
	
	public RestaurantDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public RestaurantDTO(int res_num, int img_rnk, String img_rout, String userId, String update_date) {
		super(res_num, img_rnk, img_rout, userId, update_date);
		// TODO Auto-generated constructor stub
	}

	public RestaurantDTO(int res_num, String res_name, String res_loc, int sort1_num, int sort2_num,
			String introduction) {
		super();
		this.res_num = res_num;
		this.res_name = res_name;
		this.res_loc = res_loc;
		this.sort1_num = sort1_num;
		this.sort2_num = sort2_num;
		this.introduction = introduction;
	}
	public int getRes_num() {
		return res_num;
	}
	public void setRes_num(int res_num) {
		this.res_num = res_num;
	}
	public String getRes_name() {
		return res_name;
	}
	public void setRes_name(String res_name) {
		this.res_name = res_name;
	}
	public String getRes_loc() {
		return res_loc;
	}
	public void setRes_loc(String res_loc) {
		this.res_loc = res_loc;
	}
	public int getSort1_num() {
		return sort1_num;
	}
	public void setSort1_num(int sort1_num) {
		this.sort1_num = sort1_num;
	}
	public int getSort2_num() {
		return sort2_num;
	}
	public void setSort2_num(int sort2_num) {
		this.sort2_num = sort2_num;
	}
	public String getIntroduction() {
		return introduction;
	}
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	@Override
	public String toString() {
		return "RestaurantDTO [res_num=" + res_num + ", res_name=" + res_name + ", res_loc=" + res_loc + ", sort1_num="
				+ sort1_num + ", sort2_num=" + sort2_num + ", introduction=" + introduction + "]";
	}
	
	
	

}
