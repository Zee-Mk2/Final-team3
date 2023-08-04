package com.multi.bbs.tour;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import com.multi.bbs.account.model.vo.Member;
import com.multi.bbs.common.util.CalcTime;

import jakarta.servlet.http.HttpSession;

@Controller
public class TourController {
	@Autowired
	TourService service;
	
	@GetMapping("/tour")
	public String tourPage(Model model, HttpSession session, @RequestParam Map<String, String> param) {
		Member loginMember = (Member) session.getAttribute("loginMember");
		model.addAttribute("loginMember", loginMember);
		model.addAttribute("param", param);
		System.out.println("ReqParam>> " + param);
		List<Tour> tours = service.getTourList();
		for (Tour tour : tours) {
			tour.setStartDate(tour.getStartDate().split(" ")[0]);
			tour.setEndDate(tour.getEndDate().split(" ")[0]);
			String category = tour.getCategory();
			if (category.equals("museum")) {
				tour.setCategory("박물관");
			} else {
				tour.setCategory("문화재");
			}
			CalcTime calcTime = new CalcTime();
			tour.setTimeDiff(calcTime.getTimeDiff(tour.getWriteTime()));
		}
		model.addAttribute("tours", tours);
		return "tour/tour";
	}
	
	@GetMapping("/tour/detail")
	public String tourDetailPage() {
		return "tour/tour-detail";
	}
	
	@GetMapping("/tour/post")
	public String tourPostPage(HttpSession session, Model model) {
		Member loginMember = (Member) session.getAttribute("loginMember");
		if (loginMember == null) {
			model.addAttribute("msg", "투어플랜을 만들기 위해선 로그인이 필요합니다.");
			model.addAttribute("location", "/sign-in");
			return "common/msg";
		}
		model.addAttribute("loginMember", loginMember);
		return "tour/tour-post";
	}
	
	@PostMapping("/tour/post")
	public String tourPost(HttpSession session, Model model, String jsonData, Tour tour) {
		Member loginMember = (Member) session.getAttribute("loginMember");
		model.addAttribute("loginMember", loginMember);
		String[] arr = jsonData.split("/");
		ObjectMapper objectMapper = new ObjectMapper();
	    objectMapper.registerModule(new JavaTimeModule());
	    objectMapper.configure(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS, false);
	    objectMapper.configure(DeserializationFeature.ADJUST_DATES_TO_CONTEXT_TIME_ZONE, false);
	    objectMapper.setTimeZone(TimeZone.getTimeZone("Asia/Seoul"));
		List<TourSchedule> TourSchedules = new ArrayList<>();
		for (String str : arr) {
			try {
				TourSchedules.add(objectMapper.readValue(str, TourSchedule.class));
			} catch (JsonMappingException e) {
				e.printStackTrace();
			} catch (JsonProcessingException e) {
				e.printStackTrace();
			}
		}
		tour.setStartDate(tour.getStartDate().split(" ")[0]);
		tour.setMno(loginMember.getMno());
		tour.setName(loginMember.getName());
		int result = service.insertTour(tour);
		if (result < 1) {
			model.addAttribute("msg", "투어플랜 작성에 실패했습니다.");
			model.addAttribute("location", "/tour");
		}
		for (TourSchedule tourSchedule : TourSchedules) {
			System.out.println(tourSchedule.getStartTime() + "\t" + tourSchedule.getEndTime());
			tourSchedule.setTno(tour.getTno());
			service.insertTourSchedule(tourSchedule);
		}
		
		return "tour/tour";
	}
	
	@GetMapping("/tour/reqList")
	@ResponseBody
	public List<TourList> reqList(String category, Model model) {
		if (category.equals("museum")) {
			List<TourList> list = service.getMuseumList(category);
			return list;
		} else if (category.equals("heritage")) {
			List<TourList> list = service.getHeritageList(category);
			for (TourList obj : list) {
				obj.setAddress(obj.getAddress().strip());
			}
			return list;
		}
		return null;
	}
}
