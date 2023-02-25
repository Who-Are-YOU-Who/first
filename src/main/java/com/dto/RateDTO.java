package com.dto;

public class RateDTO {
	private String userId;
	private int res_num;
	private int rating;
	private String comments;
	private String update_date;
	public RateDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public RateDTO(String userId, int res_num, int rating, String comments, String update_date) {
		super();
		this.userId = userId;
		this.res_num = res_num;
		this.rating = rating;
		this.comments = comments;
		this.update_date = update_date;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getRes_num() {
		return res_num;
	}
	public void setRes_num(int res_num) {
		this.res_num = res_num;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public String getUpdate_date() {
		return update_date;
	}
	public void setUpdate_date(String update_date) {
		this.update_date = update_date;
	}
	@Override
	public String toString() {
		return "RateDTO [userId=" + userId + ", res_num=" + res_num + ", rating=" + rating + ", comments=" + comments
				+ ", update_date=" + update_date + "]";
	}
	
	
}
