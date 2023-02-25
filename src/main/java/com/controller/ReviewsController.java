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

import com.dto.DisplayRestaurantDTO;
import com.dto.ImagesDTO;
import com.dto.MemberDTO;
import com.dto.RateDTO;
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
		List <DisplayRestaurantDTO> rList = new ArrayList<>();
		
		rList=	service.selectAllRestaurant();
		
		for(int i = 0 ; i < rList.size() ; i++) {
			
			List<ImagesDTO> imageList =  service.selectImages(rList.get(i).getRes_num());
			List<RateDTO> rateList = service.selectRate(rList.get(i).getRes_num());
			
			System.out.println("이미지" +imageList);
			System.out.println("후기" +rateList);
			rList.get(i).setImageList(imageList);
			rList.get(i).setRateList(rateList);
			
		}
		
		System.out.println(rList);
		
		mav.addObject("rList", rList);
		mav.setViewName("reviewsMain");
		
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
	
	@RequestMapping("/eachReview")
	public ModelAndView eachReview(HttpSession session, @RequestParam int res_num) {
		System.out.println("res_num : "+ res_num);
		MemberDTO mdto = (MemberDTO) session.getAttribute("mdto");
		
		ModelAndView mav = new ModelAndView();
		
		DisplayRestaurantDTO rdto = new DisplayRestaurantDTO();
		rdto = service.resByNum(res_num);
		
		
		List<RateDTO> rateList = new ArrayList<>();
		List<ImagesDTO> iList = new ArrayList<>();
		
		iList = service.selectImages(res_num);
		rdto.setImageList(iList);
		
		rateList = service.selectRate(res_num);
		rdto.setRateList(rateList);
		
		mav.addObject("rdto", rdto);
		mav.addObject("mdto", mdto);
		mav.setViewName("rate");
		
		return mav;
		
	}
	
	@RequestMapping("/rateRestaurant")
	public String rateRestaurant(HttpSession session, @RequestParam int res_num, int rating, String comments) {
		//ModelAndView mav = new ModelAndView();
		MemberDTO mdto = (MemberDTO) session.getAttribute("mdto");
		RateDTO rateDTO = new RateDTO();
		
		rateDTO.setUserId(mdto.getUserId());
		rateDTO.setRes_num(res_num);
		rateDTO.setRating(rating);
		rateDTO.setComments(comments);
		
		int n = service.insertRate(rateDTO);
		System.out.println("후기등록 ==="+n+"번========");
		
		return "redirect:/eachReview?res_num="+res_num;
		
	}
	
	@RequestMapping("/scrab")
	public @ResponseBody String scrab (@RequestParam int scrab, int res_num, HttpSession session) {
		MemberDTO mdto = (MemberDTO) session.getAttribute("mdto");
		String userId = mdto.getUserId();
		
		HashMap<String, String> map = new HashMap<>();
		map.put("userId", userId);
		map.put("res_num", Integer.toString(res_num));
		
		if(scrab==1) { //스크랩 했을 때
			int n = service.scrabAdd(map);
			System.out.println("스크랩 추가 =="+n+"번 실행===");
			return "스크랩 추가";
		}else { //스크랩 해제
			int n = service.scrabCancle(map);
			System.out.println("스크랩 해제 =="+n+"번 실행===");
			return "스크랩 해제";
		}
		
		
	}

}
