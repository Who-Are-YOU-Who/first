package com.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.ImagesDTO;
import com.dto.Res_sort1DTO;
import com.dto.Res_sort2DTO;
import com.dto.RestaurantDTO;

@Repository
public class RestaurantDAO {

	@Autowired
	SqlSessionTemplate template;//자동주입

	public List <Res_sort1DTO> allsort1() {
		List <Res_sort1DTO> s1dtoList = template.selectList("RestaurantMapper.allsort1");
		return s1dtoList;
	}

	public List<Res_sort2DTO> selectSort2(String sort1_num) {
		List<Res_sort2DTO> s2dtoList = template.selectList("RestaurantMapper.selectSort2", sort1_num);		
		return s2dtoList;
	}

	public RestaurantDTO searchRestaurant(HashMap<String, String> map) {
		RestaurantDTO rdto = template.selectOne("RestaurantMapper.searchRestaurant",map);
		return rdto;
	}

	public int insertRestaurant(RestaurantDTO rdto) {
		int n = template.insert("RestaurantMapper.insertRestaurant", rdto);
		return n;
	}

	public int insertImage(ImagesDTO idto) {
		int n = template.insert("RestaurantMapper.insertImage", idto);
		return n;
	}

	public int getResNum(HashMap<String, String> map) {
		int n = template.selectOne("RestaurantMapper.getResNum",map);
		return n;
	}

	public List<ImagesDTO> selectImages(int res_num) {
		List<ImagesDTO> iList = template.selectList("RestaurantMapper.selectImages", res_num);
		return iList;
	}

	public List<RestaurantDTO> selectAllRestaurant() {
		List<RestaurantDTO> rList = template.selectList("RestaurantMapper.selectAllRestaurant");
		return rList;
	}

	public List<ImagesDTO> selectAllImages() {
		List<ImagesDTO> iList = template.selectList("RestaurantMapper.selectAllImages");
		return iList;
	}

	public ImagesDTO selectNextImage(HashMap<String, String> map) {
		ImagesDTO idto = template.selectOne("RestaurantMapper.selectNextImage", map);
		return idto;
	}

	public int countImage(String res_num) {
		int imgCount = template.selectOne("RestaurantMapper.countImage", res_num);
		return imgCount;
	}

	public List<ImagesDTO> selectAllSort1() {
		List<ImagesDTO> sort1List = template.selectList("RestaurantMapper.selectAllSort1");
		return sort1List;
	}

	public List<ImagesDTO> selectAllSort2() {
		List<ImagesDTO> sort2List = template.selectList("RestaurantMapper.selectAllSort2");
		return sort2List;
	}

	public List<RestaurantDTO> selectResBySort2(List<String> chks2List) {
		List<RestaurantDTO> rList = template.selectList("RestaurantMapper.selectResBySort2",chks2List);
		return rList;
	}

	public List<ImagesDTO> selectImgBySort2(List<String> chks2List) {
		List<ImagesDTO> iList = template.selectList("RestaurantMapper.selectImgBySort2",chks2List);
		return null;
	}
}
