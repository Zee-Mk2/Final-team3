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
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import com.multi.bbs.account.model.vo.Member;
import com.multi.bbs.common.util.CalcTime;
import com.multi.bbs.common.util.PageInfo;

import jakarta.servlet.http.HttpSession;

@Controller
public class TourController {
	@Autowired
	TourService service;
	
	CalcTime calcTime = new CalcTime();
	final static private String savePath = "C:\\upfiles\\";
	
	@GetMapping("/tour")
	public String tourPage(Model model, HttpSession session, @RequestParam Map<String, String> param) {
		Member loginMember = (Member) session.getAttribute("loginMember");
		model.addAttribute("loginMember", loginMember);
		model.addAttribute("param", param);
		String startDate = param.get("startDate");
		if (startDate != null && startDate != "") {
			String[] dateRange = startDate.split(" to ");
			param.put("endDate", dateRange[1]);
			param.put("startDate", dateRange[0]);
		}
		if (param.get("museum") == null && param.get("heritage") != null) {
			param.put("category", "heritage");
		} else if (param.get("museum") != null && param.get("heritage") == null) {
			param.put("category", "museum");
		}
		int page = 1;
		if (param.get("page") != null) {
			page = Integer.parseInt(param.get("page"));
		}
		int boardCount = service.getBoardCount(param);
		PageInfo pageInfo = new PageInfo(page, 5, boardCount, 8);
		List<Tour> tours = service.getTourList(param, pageInfo);
		for (Tour tour : tours) {
			tour.setStartDate(tour.getStartDate().split(" ")[0]);
			tour.setEndDate(tour.getEndDate().split(" ")[0]);
			String category = tour.getCategory();
			if (category.equals("museum")) {
				tour.setCategory("박물관");
			} else {
				tour.setCategory("문화재");
			}
			tour.setTimeDiff(calcTime.getTimeDiff(tour.getWriteTime()));
		}
		model.addAttribute("tours", tours);
		model.addAttribute("pageInfo", pageInfo);
		return "tour/tour";
	}
	
	@GetMapping("/tour/detail")
	public String tourDetailPage(Model model, HttpSession session, int tno) {
		Member loginMember = (Member) session.getAttribute("loginMember");
		model.addAttribute("loginMember", loginMember);
		Tour tour = service.getTourByTno(tno);
		if (tour.getState().equals("N")) {
			model.addAttribute("msg", "이미 삭제된 투어입니다.");
			model.addAttribute("location", "/tour");
			return "common/msg";
		}
		List<TourSchedule> schedules = service.getSchedulsByTno(tno);
		CalcTime calcTime = new CalcTime();
		tour.setTimeDiff(calcTime.getTimeDiff(tour.getWriteTime()));
		tour.setStartDate(tour.getStartDate().split(" ")[0]);
		tour.setEndDate(tour.getEndDate().split(" ")[0]);
		List<TourComment> comments = service.getComments(tno);
		for (TourComment comment : comments) {
			comment.setTimeDiff(calcTime.getTimeDiff(comment.getWriteTime()));
		}
		List<TourReplyComment> replies = service.getReply(tno);
		for (TourReplyComment reply : replies) {
			reply.setTimeDiff(calcTime.getTimeDiff(reply.getWriteTime()));
		}
		model.addAttribute("replies", replies);
		model.addAttribute("comments", comments);
		model.addAttribute("tour", tour);
		model.addAttribute("schedules", schedules);
		
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
	public String tourPost(HttpSession session, Model model, String jsonData, Tour tour, MultipartFile upfile) {
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
		
		// 파일 저장 로직
		if(upfile != null && upfile.isEmpty() == false) {
			String renameFileName = service.saveFile(upfile, savePath); 
			
			if(renameFileName != null) {
				tour.setFileName(upfile.getOriginalFilename());
				tour.setReFileName(renameFileName);
			}
		}
		
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
		
		return "redirect:/tour";
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
	
	@PostMapping("/tour/comment")
	public String postComment(String content, String tno, HttpSession session, Model model, String update) {
		System.out.println("Tour Comment 작성 요청");
		Member loginMember = (Member) session.getAttribute("loginMember");
		if (loginMember == null) {
			model.addAttribute("msg", "잘못된 접근입니다.");
			model.addAttribute("location", "/tour/detail?tno=" + tno);
			return "common/msg";
		}
		TourComment comment = new TourComment();
		comment.setContent(content);
		comment.setTno(Integer.valueOf(tno));
		comment.setMno(loginMember.getMno());
		comment.setName(loginMember.getName());
		int result = service.writeComment(comment, update);
		if (result < 1) {
			model.addAttribute("msg", "댓글 작성에 실패했습니다.");
			model.addAttribute("location", "/tour/detail?tno=" + tno);
			return "common/msg";
		}
		
		return "redirect:/tour/detail?tno=" + tno;
	}
	
	@GetMapping("/tour/comment/delete")
	public String deleteComment(Model model, int cno, int tno) {
		int result = service.deleteComment(cno);
		String url = "/tour/detail?tno=" + tno;
		if (result < 1) {
			model.addAttribute("msg", "댓글 삭제에 실패했습니다.");
			model.addAttribute("location", url);
		} else {
			model.addAttribute("msg", "댓글이 삭제되었습니다.");
			model.addAttribute("location", url);
		}
		return "common/msg";
	}
	
	@GetMapping("/tour/comment/deleteReply")
	public String deleteReply(Model model, int rcno, int tno) {
		String url = "/tour/detail?tno=" + tno;
		int result = service.deleteReply(rcno);
		if (result < 1) {
			model.addAttribute("msg", "댓글 삭제에 실패했습니다.");
			model.addAttribute("location", url);
		} else {
			model.addAttribute("msg", "댓글이 삭제되었습니다.");
			model.addAttribute("location", url);
		}
		return "common/msg";
	}
	
	@GetMapping("/tour/complete")
	public String completeTour(Model model, int tno, String complete) {
		String url = "/tour/detail?tno=" + tno;
		int result = service.completeTour(tno, complete);
		
		if (complete.equals("false")) {
			if (result < 1) {
				model.addAttribute("msg", "모집 마감 요청 처리에 실패했습니다.");
				model.addAttribute("location", url);
			} else {
				model.addAttribute("msg", "투어 모집이 마감되었습니다.");
				model.addAttribute("location", url);
			}
		} else {
			if (result < 1) {
				model.addAttribute("msg", "모집 요청 처리에 실패했습니다.");
				model.addAttribute("location", url);
			} else {
				model.addAttribute("msg", "투어 모집이 시작되었습니다.");
				model.addAttribute("location", url);
			}
		}
		return "common/msg";
	}
	
	@GetMapping("/tour/delete")
	public String deleteTour(Model model, int tno) {
		String url = "/tour";
		int result = service.deleteTour(tno);
		if (result < 1) {
			model.addAttribute("msg", "투어 삭제에 실패했습니다.");
			model.addAttribute("location", url);
		} else {
			model.addAttribute("msg", "투어 모집이 삭제되었습니다.");
			model.addAttribute("location", url);
		}
		return "common/msg";
	}
}
