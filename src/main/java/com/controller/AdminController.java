package com.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.dto.ImagesDTO;
import com.dto.MemberDTO;
import com.dto.Res_sort1DTO;
import com.dto.Res_sort2DTO;
import com.dto.RestaurantDTO;
import com.service.RestaurantService;

@Controller
public class AdminController {
	
	@Autowired
	RestaurantService service;
	
	//메인에서 관리자로그인 후 업체등록
	@RequestMapping("/uploadRestaurant")
	public ModelAndView insertRestaurant(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		System.out.println("insertRestaurant====================");
		MemberDTO mdto = (MemberDTO) session.getAttribute("mdto");
		if(!mdto.getUserRole().equals("1")) {
			System.out.println("관리자 아이디 아님=========");
		}else {
			System.out.println("관리자 아이디 확인됨==========");
			List <Res_sort1DTO> s1dtoList = new ArrayList<>();
			s1dtoList = service.allsort1();
			for (int i = 0; i < s1dtoList.size(); i++) {
				System.out.println(s1dtoList.get(i).getSort1_name());
			}
			mav.addObject("s1dtoList", s1dtoList);
			mav.setViewName("insertRestaurant");
		}
		return mav;
	}
	
	
	//업체등록폼에서 분류1클릭 시 불러오는 부류2
	@RequestMapping("/selectSort2")
	public ModelAndView selectSort2(String sort1_num) {
		ModelAndView mav = new ModelAndView();
		System.out.println("sort2 찾기 Controller======== sort1_num : "+ sort1_num);
		List<Res_sort2DTO> s2dtoList = new ArrayList<>();
		s2dtoList = service.selectSort2(sort1_num);
		mav.addObject("s2dtoList", s2dtoList);
		mav.setViewName("selectSort2");
		return mav;
	}
	
	
	//업체등록폼에서 폼제출시 업체명과 주소로 중복업체 검사
	@RequestMapping(value =  "/searchRestaurant",method = RequestMethod.POST )
	public @ResponseBody String searchRestaurant(@RequestParam String res_name, String res_loc) {
		System.out.println("업체 중복검사=======================");
		RestaurantDTO rdto = new RestaurantDTO();
		HashMap<String, String> map = new HashMap<>();
		map.put("res_name", res_name);
		map.put("res_loc", res_loc);
      /* 업체명과 주소로 중복되는 업체 확인*/	
		rdto = service.searchRestaurant(map);
		
		if(rdto!=null) {  //중복일경우
			System.out.println("중복된 업체=======");
			return "1";
		}else {           //중복아닐경우
			System.out.println("중복아님=======");
			return "0";
		}
		
	}
	
	
	//업체 등록 폼 제출 후 저장
	@RequestMapping(value="/insertRestaurant", method=RequestMethod.POST)
	public ModelAndView insertRestaurant(HttpSession session, @RequestParam String res_name, String res_loc, String sort1, String sort2, String res_introduction,  @RequestParam(value = "imageFiles", required = false) List<MultipartFile> imageList,  HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		System.out.println("insert Controller 실행==========");
		System.out.println("res_name : "+ res_name);
		System.out.println("res_loc : "+ res_loc);
		System.out.println("sort1 : "+ sort1);
		System.out.println("sort2 : "+ sort2);
		System.out.println("res_introduction : "+ res_introduction);
		System.out.println(imageList);
		int sort1_num = Integer.parseInt(sort1);
		int sort2_num = Integer.parseInt(sort2);
		
		RestaurantDTO rdto = new RestaurantDTO();
		
		rdto.setRes_name(res_name);
		rdto.setRes_loc(res_loc);
		rdto.setSort1_num(sort1_num);
		rdto.setSort2_num(sort2_num);
		rdto.setIntroduction(res_introduction);
		int res_num = 0;
		int n = service.insertRestaurant(rdto);
		if(n!=0) {
			System.out.println("insert 성공!!=======================");
			
			//res_num 시퀀스 가져오기 (image삽입시 필요)
			HashMap<String, String> map = new HashMap<>();
			map.put("res_name", res_name);
			map.put("res_loc", res_loc);
			res_num = service.getResNum(map);
		}
		
		MemberDTO mdto = (MemberDTO) session.getAttribute("mdto");

		   //업로드 파일 저장 location
	      String location = "C://eclipse//first_spring//workspace//myFirstProject//src//main//webapp//resources//image";
	      int result = 0;
	      try {
	         File folder = new File(location);
	         if (!folder.exists()) folder.mkdirs();
	         
	         
	         ImagesDTO idto = new ImagesDTO();
	         
	         
			 for(int i = 0; i <imageList.size(); i++) {
				 System.out.println("image 저장 for문 실행========");
				 File destination = new File(location + File.separator + imageList.get(i).getOriginalFilename());
				 imageList.get(i).transferTo(destination);
				 
				 //파일 이름 변경 (식당이름+이미지번호)
				 File newFile = new File(location + File.separator + res_name + i+".jpg");
				 destination.renameTo(newFile);
				 
				 System.out.println("변경 된 파일명 : "+ destination.getName());
				 
		         result++;
		         idto.setRes_num(res_num);
				 idto.setImg_rnk(i);
				 idto.setImg_route(res_name+i+".jpg");
				 idto.setUserId(mdto.getUserId());
				 
				 int s = service.insertImage(idto);
				 System.out.println("image insert "+ s+"번 실행 성공 ======");
			 }
	        System.out.println("result ==== "+ result);
	        } catch (Exception e){
	           e.getMessage();
	        }
		List<ImagesDTO> iList = new ArrayList<>();  
		iList = service.selectImages(res_num);
		
		mav.addObject("rdto", rdto);
		mav.addObject("iList", iList);
		mav.setViewName("insertSuccess");
		return mav;
	}
	
	//업체 수정
	@RequestMapping(value= "/modifyRestaurant")
	public ModelAndView modifyRestaurant(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("modifyRestaurant");
		return mav;
	}
	
	//업체수정페이지 식당이름 검색으로 같은이름인 식당 list뽑기
	@RequestMapping(value="/selectByName")
	public ModelAndView selectByName(@RequestParam String res_name) {
		ModelAndView mav = new ModelAndView();
		List<RestaurantDTO> list = new ArrayList<>();
		list = service.selectResByName(res_name);
		
		List <Res_sort1DTO> s1List = new ArrayList<>();  //sort1
		s1List = service.allsort1();
		
		mav.addObject("rList", list);
		mav.addObject("s1", s1List);
		mav.setViewName("modifyResList");
		
		return mav;
	}
	
	//선택한 업체 모든정보 가져오기
	@RequestMapping(value="/showRestaurant")
	public ModelAndView showRestaurant (@RequestParam String res_num) {
		System.out.println("수정할 업체 번호 : " +res_num);
		ModelAndView mav = new ModelAndView();
		
		RestaurantDTO rdto = new RestaurantDTO();  //restaurantDTO
		rdto = service.selectResByNum(res_num);
		
		List <Res_sort1DTO> s1List = new ArrayList<>();  //sort1
		s1List = service.allsort1();
		List<Res_sort2DTO> s2List = new ArrayList<>();  //sort2
		String sort1_num= Integer.toString(rdto.getSort1_num() ) ;
		s2List = service.selectSort2(sort1_num);
		
		int rnum = Integer.parseInt(res_num);
		List<ImagesDTO> iList = new ArrayList<>();  
		iList = service.selectImages(rnum);
		
		mav.addObject("rdto", rdto);
		mav.addObject("s1List", s1List);
		mav.addObject("s2List", s2List);
		mav.addObject("iList", iList);
		mav.setViewName("showResDTO");
		
		return mav;
	}
	
	
	
	//업체 삭제
	@RequestMapping("/deleteRestaurant")
	public String deleteRestaurant(@RequestParam int res_num) {
		System.out.println("res_num : "+ res_num);
		int n = service.deleteRestaurant(res_num);
		
		
		if(n != 0) {
			System.out.println("업체 삭제 성공!");
			return "deleteResSuccess";
		}else {
			System.out.println("업체 삭제 실패!");
			//redirect:/home
			return "updateResFail";
		}
	}
	
	//업체 수정 폼 제출
	@RequestMapping("/updateRestaurant")
	public ModelAndView updateRestaurant(HttpSession session, @RequestParam int res_num,  String res_name, String res_loc, int sort1, int sort2, String res_introduction, String delImg,  @RequestParam(value = "imageFiles", required = false) List<MultipartFile> imageList,  HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		System.out.println("업데이트 Controller 실행======");
		MemberDTO mdto = (MemberDTO) session.getAttribute("mdto");
		
		if(delImg!=""||delImg!=null) {
			
			  if(deleteImg(delImg,res_num)) { 
				   System.out.println("이미지 삭제 성공====");
			   }else{
				   System.out.println("이미지 삭제 실패====");
			   };
			
		}

		RestaurantDTO rdto = new RestaurantDTO(); 
		rdto.setRes_num(res_num);
		rdto.setRes_name(res_name);
		rdto.setRes_loc(res_loc);
		rdto.setSort1_num(sort1);
		rdto.setSort2_num(sort2);
		rdto.setIntroduction(res_introduction);
		
		 //업로드 파일 저장 location
	      String location = "C://eclipse//first_spring//workspace//myFirstProject//src//main//webapp//resources//image";
	      int result = 0;
	      try {
	         File folder = new File(location);
	         if (!folder.exists()) folder.mkdirs();     
	         
	         ImagesDTO idto = new ImagesDTO();
	         
	         int nextImgNum = service.lastImgRnk(res_num)+1;  //이미지 rnk마지막 번호 이어서 사진 저장

			 for(int i = 0 ; i <imageList.size(); i++) {
				 System.out.println("image 저장 for문 실행========");
				 File destination = new File(location + File.separator + imageList.get(i).getOriginalFilename());
				 imageList.get(i).transferTo(destination);
				 
				 //파일 이름 변경 (식당이름+이미지번호)
				 File newFile = new File(location + File.separator + res_name + (nextImgNum+i)+".jpg");
				 destination.renameTo(newFile);
				 
				 System.out.println("변경 된 파일명 : "+ destination.getName());
				 
		         result++;
		         idto.setRes_num(res_num);
				 idto.setImg_rnk(nextImgNum+i);
				 idto.setImg_route(res_name+(nextImgNum+i)+".jpg");
				 idto.setUserId(mdto.getUserId());
				 
				 int s = service.insertImage(idto);
				 System.out.println("image insert "+ s+"번 실행 성공 ======");
			 }
	        System.out.println("result ==== "+ result);
	        } catch (Exception e){
	           e.getMessage();
	        }
		
		int n = service.updateRes(rdto);
		if(n != 0) {
			System.out.println("업데이트 성공!");
			mav.setViewName("updateResSuccess");
			return mav;
		}else {
			System.out.println("업데이트 실패!");
			mav.setViewName("updateResFail");
			return mav;
		}
	}

		public boolean deleteImg(String delImg, int res_num) {
			System.out.println("이미지 삭제 함수 실행 =========");
			String [] delImgs = delImg.split(",");
			int n=0;
			HashMap<String, String> map = new HashMap<>(); 
			for(int i = 0; i < delImgs.length; i++) {
				if(delImgs[i]!=""||delImgs[i]!=null) {
					System.out.println("이미지 삭제 함수 for문 =========");
					map.put("res_num", Integer.toString(res_num));
					map.put("img_rnk",delImgs[i]);
					n=n+service.deleteImg(map);
				}
				
			}
			if(n!=0) {
				return true;
			}else {
				return false;
			}
		}
}
