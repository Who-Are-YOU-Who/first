package com.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.RestaurantDAO;
import com.dto.ImagesDTO;
import com.dto.Res_sort1DTO;
import com.dto.Res_sort2DTO;
import com.dto.RestaurantDTO;

@Service
public class RestaurantService {
	
	@Autowired
	RestaurantDAO dao;

	public List <Res_sort1DTO> allsort1() {
		List <Res_sort1DTO> s1dtoList = dao.allsort1();
		return s1dtoList;
	}

	public List<Res_sort2DTO> selectSort2(String sort1_num) {
		List<Res_sort2DTO> s2dtoList = dao.selectSort2(sort1_num);
		return s2dtoList;
	}

	public RestaurantDTO searchRestaurant(HashMap<String, String> map) {
		RestaurantDTO rdto = dao.searchRestaurant(map);
		return rdto;
		
	}

	public int insertRestaurant(RestaurantDTO rdto) {
		int n = dao.insertRestaurant(rdto);
		return n;
	}

	public int insertImage(ImagesDTO idto) {
		int n = dao.insertImage(idto);
		return n;
	}

	public int getResNum(HashMap<String, String> map) {
		int n = dao.getResNum(map);
		return n;
	}

	public List<ImagesDTO> selectImages(int res_num) {
		List<ImagesDTO> iList = dao.selectImages(res_num);
		return iList;
	}
	
	

}
