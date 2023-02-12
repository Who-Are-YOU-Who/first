package com.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dto.ImagesDTO;
import com.dto.Res_sort1DTO;
import com.dto.Res_sort2DTO;
import com.dto.RestaurantDTO;
import com.service.RestaurantService;

@Controller
public class ReviewsController {
	
	@Autowired
	RestaurantService service;
	
	//리뷰 메인
	@RequestMapping("/reviewsMain")
	public ModelAndView reviewsMain (HttpSession session) {
		ModelAndView mav = new ModelAndView();
		List <RestaurantDTO> rList = new ArrayList<>();
		List<ImagesDTO> iList = new ArrayList<>();
		List<Res_sort1DTO> s1List = new ArrayList<>();
		
		rList=	service.selectAllRestaurant();
		iList = service.selectAllImages();
		s1List = service.allsort1();
		
		mav.addObject("rList", rList);
		mav.addObject("iList", iList);
		mav.addObject("s1List", s1List);

		mav.setViewName("reviewsMain");
		
		return mav;
	}
	
	//리뷰 업체 다음사진 가져오기
	@RequestMapping("/nextImage")
	public @ResponseBody ModelAndView nextImage(@RequestParam String res_num, String imgRnk) {
		ModelAndView mav = new ModelAndView();
		System.out.println("다음이미지 가져오기!!=================");
		HashMap <String, String> map = new HashMap<>();
		
		int imgCount = service.countImage(res_num); //해당 업체 전체 이미지 개수 세기
		
		if(imgCount > Integer.parseInt(imgRnk) ) {//다음 이미지가 있을 때
			
			map.put("res_num", res_num);	
			map.put("img_Rnk", imgRnk);
			ImagesDTO idto = service.selectNextImage(map); //업체번호, 이미지 순번 으로 가져오기
			String img_route = "${contextPath}/resources/image/"+idto.getImg_route();
			
			mav.addObject("img_route", img_route);
			mav.addObject("rnk", idto.getImg_rnk());
			
			System.out.println("data : "+img_route+", 해당업체 이미지 수 : "+ imgCount + ", 해당이미지 순번 : "+ idto.getImg_rnk());
			
			
		}else { //다음이미지가 없을 때
			
			//mav.addObject("img_route", img_route);
		//	mav.addObject("rnk", idto.getImg_rnk());
			
		//System.out.println("data : 다음 이미지 없음, 해당업체 이미지 수 : "+ imgCount + ", 해당이미지 순번 : "+rnk);

		}
		
		return mav;
	}
	
	//리뷰페이지에서 sort1선택시 해당 sort2 select
	@RequestMapping("/selectSort1")
	public ModelAndView selectSort1(@RequestParam String sort1_num) {
		ModelAndView mav =  new ModelAndView();
		List<Res_sort2DTO> s2List = new ArrayList<>();
		s2List = service.selectSort2(sort1_num);
		
		mav.addObject("s2List", s2List);
		mav.setViewName("reviewSort2");
		return mav;
	}
	
	//sort2선택시 해당 업체
	@RequestMapping("/selectRestaurant")
	public ModelAndView selectRestaurant(@RequestParam List<String> sendingList) {
		System.out.println("분류2 선택!! 식당 찾기========");
		ModelAndView mav = new ModelAndView();
		List <String> chks2List = new ArrayList<>();
		for(int i =0; i<sendingList.size(); i++) {
			System.out.println("선택 된 sort2 ===="+sendingList.get(i) );
			
			if(sendingList.get(i)!=null) {//공백제거
				chks2List.add(sendingList.get(i));
			}
		}
		List<Integer> resNum = new ArrayList<>();
		List<RestaurantDTO> rList = new ArrayList<>();
		List<ImagesDTO> iList = new ArrayList<>();
		rList = service.selectResBySort2(chks2List);  //sort2List로 업체 가져오기  
		
		for(int i = 0; i < rList.size(); i++) {
			resNum.add(rList.get(i).getRes_num());
		}
		
		System.out.println(resNum);

		
		System.out.println("선택 된 restaurant ===="+rList);
		
		mav.addObject("rList", rList);
		mav.addObject("iList", iList);
		
		mav.setViewName("restaurantBySort2");
		
		return mav;
	}

}
