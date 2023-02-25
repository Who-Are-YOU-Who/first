package com.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dto.DisplayRestaurantDTO;
import com.dto.ImagesDTO;
import com.dto.RateDTO;
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

	public List<DisplayRestaurantDTO> selectAllRestaurant() {
		List<DisplayRestaurantDTO> rList = template.selectList("RestaurantMapper.selectAllRestaurant");
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

	public List<RestaurantDTO> selectResByName(String res_name) {
		List<RestaurantDTO> rList = template.selectList("RestaurantMapper.selectResByName",res_name);
		return rList;
	}

	public RestaurantDTO selectResByNum(String res_num) {
		RestaurantDTO rdto = template.selectOne("RestaurantMapper.selectResByNum", res_num);
		return rdto;
	}

	public int deleteImg(HashMap<String, Integer> map) {
		int n = template.delete("RestaurantMapper.deleteImg", map);
		return n;
	}

	public int deleteRestaurant(int res_num) {
		int n1 = template.delete("RestaurantMapper.deleteAllImages", res_num);
		int n2 = template.delete("RestaurantMapper.deleteRestaurant", res_num);
		int n = n1+n2;
		return n;
	}

	public int updateRes(RestaurantDTO rdto) {
		int n = template.update("RestaurantMapper.updateRes", rdto);
		return n;
	}

	public int lastImgRnk(int res_num) {
		int n = template.selectOne("RestaurantMapper.lastImgRnk", res_num);
		return n;
	}

	public List<Res_sort2DTO> allsort2() {
		List<Res_sort2DTO> s2list = template.selectList("RestaurantMapper.allsort2");
		return s2list;
	}

	public int insertRate(RateDTO rateDTO) {
		int n = template.insert("RestaurantMapper.insertRate", rateDTO);
		return n;
	}

	public List<RateDTO> selectRate(int res_num) {
		List<RateDTO> rateList = template.selectList("RestaurantMapper.selectRate", res_num);
		return rateList;
	}

	public int scrabAdd(HashMap<String, String> map) {
		int n = template.insert("RestaurantMapper.scrabAdd", map);
		return n;
	}

	public int scrabCancle(HashMap<String, String> map) {
		int n = template.delete("RestaurantMapper.scrabCancle", map);
		return n;
	}

	public DisplayRestaurantDTO resByNum(int res_num) {
		DisplayRestaurantDTO rdto = template.selectOne("RestaurantMapper.resByNum", res_num);
		return rdto;
	}

	
}
