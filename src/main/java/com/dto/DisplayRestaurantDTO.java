package com.dto;

import java.util.List;

import org.apache.ibatis.type.Alias;

@Alias("DisplayRestaurantDTO")
public class DisplayRestaurantDTO extends RestaurantDTO {
	private String SORT1_NAME;
	private String SORT2_NAME;
	
	private List<RateDTO> rateList;
	private List<ImagesDTO> ImageList;
	
	public List<RateDTO> getRateList() {
		return rateList;
	}
	public void setRateList(List<RateDTO> rateList) {
		this.rateList = rateList;
	}
	public List<ImagesDTO> getImageList() {
		return ImageList;
	}
	public void setImageList(List<ImagesDTO> imageList) {
		ImageList = imageList;
	}
	
	public String getSORT1_NAME() {
		return SORT1_NAME;
	}
	public void setSORT1_NAME(String sORT1_NAME) {
		SORT1_NAME = sORT1_NAME;
	}
	public String getSORT2_NAME() {
		return SORT2_NAME;
	}
	public void setSORT2_NAME(String sORT2_NAME) {
		SORT2_NAME = sORT2_NAME;
	}
	@Override
	public String toString() {
		return "DisplayRestaurantDTO [SORT1_NAME=" + SORT1_NAME + ", SORT2_NAME=" + SORT2_NAME + "]";
	}

	
	
}
