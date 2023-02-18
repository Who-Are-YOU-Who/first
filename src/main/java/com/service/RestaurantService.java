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

	public List<RestaurantDTO> selectAllRestaurant() {
		List<RestaurantDTO> rList = dao.selectAllRestaurant();
		return rList;
	}

	public List<ImagesDTO> selectAllImages() {
		List<ImagesDTO> iList = dao.selectAllImages();
		return iList;
	}

	public ImagesDTO selectNextImage(HashMap<String, String> map) {
		ImagesDTO idto = dao.selectNextImage(map);
		return idto;
	}

	public int countImage(String res_num) {
		int imgCount = dao.countImage(res_num);
		return imgCount;
	}

	public List<ImagesDTO> selectAllSort1() {
		List<ImagesDTO> sort1List = dao.selectAllSort1();
		return sort1List;
	}

	public List<ImagesDTO> selectAllSort2() {
		List<ImagesDTO> sort2List = dao.selectAllSort2();
		return sort2List;
	}

	public List<RestaurantDTO> selectResBySort2(List<String> chks2List) {
		List<RestaurantDTO> rList = dao.selectResBySort2(chks2List);
		return rList;
	}

	public List<ImagesDTO> selectImgBySort2(List<String> chks2List) {
		List<ImagesDTO> iList = dao.selectImgBySort2(chks2List);
		return iList;
	}

	public List<RestaurantDTO> selectResByName(String res_name) {
		List<RestaurantDTO> rList = dao.selectResByName(res_name);
		return rList;
	}

	public RestaurantDTO selectResByNum(String res_num) {
		RestaurantDTO rdto = dao.selectResByNum(res_num);
		return rdto;
	}

	public int deleteImg(HashMap<String, Integer> map) {
		int n = dao.deleteImg(map);
		return n;
	}
	
	

}
