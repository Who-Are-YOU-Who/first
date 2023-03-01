package com.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.dto.DisplayRestaurantDTO;
import com.dto.ImagesDTO;
import com.dto.MemberDTO;
import com.dto.RateDTO;
import com.service.MemberService;
import com.service.RestaurantService;

@Controller
public class MainController {
	
	@Autowired
	MemberService service;
	@Autowired
	RestaurantService Rservice;
	
	//시작페이지	
	@RequestMapping("/")
	public ModelAndView main() {
		ModelAndView mav = new ModelAndView();
		System.out.println("main매서드 호출===================");
		List <DisplayRestaurantDTO> rList = new ArrayList<>();
		List <DisplayRestaurantDTO> koreanList = new ArrayList<>();
		List <DisplayRestaurantDTO> americanList = new ArrayList<>();
		List <DisplayRestaurantDTO> italianList = new ArrayList<>();
		List <DisplayRestaurantDTO> frenchList = new ArrayList<>();
		List <DisplayRestaurantDTO> mexicanList = new ArrayList<>();
		List <DisplayRestaurantDTO> chineseList = new ArrayList<>();
		List <DisplayRestaurantDTO> asianList = new ArrayList<>();
		List <DisplayRestaurantDTO> japaneseList = new ArrayList<>();
		List <DisplayRestaurantDTO> dessertList = new ArrayList<>();
		
		rList =	Rservice.selectAllRestaurant();
		
		for(int i = 0 ; i < rList.size() ; i++) {
			
			List<ImagesDTO> imageList =  Rservice.selectImages(rList.get(i).getRes_num());
			List<RateDTO> rateList = Rservice.selectRate(rList.get(i).getRes_num());
			
			System.out.println("이미지" +imageList);
			System.out.println("후기" +rateList);
			rList.get(i).setImageList(imageList);
			rList.get(i).setRateList(rateList);
			
		}
		
		for (int i = 0; i < rList.size(); i++) {
			 if(rList.get(i).getSort1_num()==1) {
				koreanList.add(rList.get(i)) ;
				System.out.println(koreanList);
				
			}else if (rList.get(i).getSort1_num()==2) {
				americanList.add(rList.get(i)) ;
				System.out.println(americanList);
				
			}else if (rList.get(i).getSort1_num()==3) {
				italianList.add(rList.get(i)) ;
				System.out.println(italianList);
				
			}else if (rList.get(i).getSort1_num()==4) {
				frenchList.add(rList.get(i)) ;
				System.out.println(frenchList);
				
			}else if (rList.get(i).getSort1_num()==5) {
				mexicanList.add(rList.get(i)) ;
				System.out.println(mexicanList);
				
			}else if (rList.get(i).getSort1_num()==6) {
				chineseList.add(rList.get(i)) ;
				System.out.println(chineseList);
				
			}else if (rList.get(i).getSort1_num()==7) {
				asianList.add(rList.get(i)) ;
				System.out.println(asianList);
				
			}else if (rList.get(i).getSort1_num()==8) {
				japaneseList.add(rList.get(i)) ;
				System.out.println(japaneseList);
				
			}else if (rList.get(i).getSort1_num()==9) {
				dessertList.add(rList.get(i)) ;
				System.out.println(dessertList);
			}
		}
		
		mav.addObject("koreanList", koreanList);
		mav.addObject("americanList", americanList);
		mav.addObject("italianList", italianList);
		mav.addObject("frenchList", frenchList);
		mav.addObject("mexicanList", mexicanList);
		mav.addObject("chineseList", chineseList);
		mav.addObject("asianList", asianList);
		mav.addObject("japaneseList", japaneseList);
		mav.addObject("dessertList", dessertList);
		mav.setViewName("main");

		return mav;
	}
	
	
	//메인화면 redirect용
	@RequestMapping(value = "/home")
	public String mainRedirect() {
		return "redirect:/";
	}
}
