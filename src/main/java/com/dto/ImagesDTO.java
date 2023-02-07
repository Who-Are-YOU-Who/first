package com.dto;

import org.apache.ibatis.type.Alias;

@Alias("ImagesDTO")
public class ImagesDTO {
	
	private int res_num;
	private int img_rnk;
	private String img_route;
	private String userId;
	private String update_date;
	
	public ImagesDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ImagesDTO(int res_num, int img_rnk, String img_route, String userId, String update_date) {
		super();
		this.res_num = res_num;
		this.img_rnk = img_rnk;
		this.img_route = img_route;
		this.userId = userId;
		this.update_date = update_date;
	}

	public int getRes_num() {
		return res_num;
	}

	public void setRes_num(int res_num) {
		this.res_num = res_num;
	}

	public int getImg_rnk() {
		return img_rnk;
	}

	public void setImg_rnk(int img_rnk) {
		this.img_rnk = img_rnk;
	}

	public String getImg_route() {
		return img_route;
	}

	public void setImg_route(String img_route) {
		this.img_route = img_route;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUpdate_date() {
		return update_date;
	}

	public void setUpdate_date(String update_date) {
		this.update_date = update_date;
	}

	@Override
	public String toString() {
		return "ImagesDTO [res_num=" + res_num + ", img_rnk=" + img_rnk + ", img_route=" + img_route + ", userId="
				+ userId + ", update_date=" + update_date + "]";
	}
	
	
}
