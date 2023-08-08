package com.multi.bbs.museum.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.multi.bbs.account.model.vo.Member;
import com.multi.bbs.common.util.CalcTime;
import com.multi.bbs.common.util.PageInfo;
import com.multi.bbs.heritage.model.vo.Reply;
import com.multi.bbs.museum.model.service.MuseumService;
import com.multi.bbs.museum.model.vo.MuseComment;
import com.multi.bbs.museum.model.vo.MuseReplyComment;
import com.multi.bbs.museum.model.vo.Museum;
import com.multi.bbs.tour.TourComment;
import com.multi.bbs.tour.TourReplyComment;

import jakarta.servlet.http.HttpSession;

@Controller
public class MuseumController {
	
	@Autowired
	private MuseumService museumService;
	
	@GetMapping("/museum")
	public String museumPage(Model model, @RequestParam Map<String, String> param) {
		int page = 1;
		try {
			page = Integer.parseInt((String) param.get("page"));
		} catch (Exception e) {}
		
		int resultCount = museumService.getResultCount(param);
		PageInfo pageInfo = new PageInfo(page, 5, resultCount, 6);
		List<Museum> list = museumService.getMuseumList(param, pageInfo);
		
		model.addAttribute("list", list);
		model.addAttribute("param", param);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("numOfResult", resultCount);
		
		return "/museum/museum";
	}
	
	@GetMapping("/museumDetail")
	public String museumDetail(Model model, @RequestParam("no") int no, HttpSession session) {
		Member loginMember = (Member) session.getAttribute("loginMember");
		model.addAttribute("loginMember", loginMember);
		Map<String, String> param = new HashMap<>();
		param.put("no", String.valueOf(no));
		if (loginMember != null) {
			param.put("mno", String.valueOf(loginMember.getMno()));
		}
		Museum museum = museumService.findByNo(param);
		if(museum == null) {
			return "common/error";
		}
		model.addAttribute("museum", museum);
		System.out.println("museumDetail>> " + museum);
		
		CalcTime calcTime = new CalcTime();
		List<MuseComment> comments = museumService.getComments(no);
		for (MuseComment comment : comments) {
			comment.setTimeDiff(calcTime.getTimeDiff(comment.getWriteTime()));
		}
		List<MuseReplyComment> replies = museumService.getReply(no);
		for (MuseReplyComment reply : replies) {
			reply.setTimeDiff(calcTime.getTimeDiff(reply.getWriteTime()));
		}
		model.addAttribute("replies", replies);
		model.addAttribute("comments", comments);
		
		return "/museum/museumDetail";
	}
	
//	@GetMapping("/museumBooking1")
//	public String museumBooking1(Model model) {
//		return "/museum/museumBooking1";
//	}
	
//	@GetMapping("/museumBooking2")
//	public String museumBooking2(Model model, @RequestParam("no") int no, HttpSession session) {
//		Member loginMember = (Member) session.getAttribute("loginMember");
//		model.addAttribute("loginMember", loginMember);
//		Museum museum = museumService.findByNo(no);
//		if(museum == null) {
//			return "common/error";
//		}
//		model.addAttribute("museum", museum);
//		
//		
//		return "/museum/museumBooking2";
//	}
	
	@GetMapping("/museumBooking3")
	public String museumBooking3(Model model) {
		return "/museum/museumBooking3";
	}
	
	@PostMapping("/museum/comment")
	public String postComment(String content, String musNo, HttpSession session, Model model, String update) {
		System.out.println("Museum Comment 작성 요청");
		Member loginMember = (Member) session.getAttribute("loginMember");
		if (loginMember == null) {
			model.addAttribute("msg", "잘못된 접근입니다.");
			model.addAttribute("location", "/museumDetail?no=" + musNo);
			return "common/msg";
		}
		MuseComment comment = new MuseComment();
		comment.setContent(content);
		comment.setMusNo(Integer.valueOf(musNo));
		comment.setMno(loginMember.getMno());
		comment.setName(loginMember.getName());
		int result = museumService.writeComment(comment, update);
		if (result < 1) {
			model.addAttribute("msg", "댓글 작성에 실패했습니다.");
			model.addAttribute("location", "/museumDetail?no=" + musNo);
			return "common/msg";
		}
		
		return "redirect:/museumDetail?no=" + musNo;
	}
	
	@GetMapping("/museum/comment/delete")
	public String deleteComment(Model model, int cno, int musNo) {
		int result = museumService.deleteComment(cno);
		String url = "/museumDetail?no=" + musNo;
		if (result < 1) {
			model.addAttribute("msg", "댓글 삭제에 실패했습니다.");
			model.addAttribute("location", url);
		} else {
			model.addAttribute("msg", "댓글이 삭제되었습니다.");
			model.addAttribute("location", url);
		}
		return "common/msg";
	}
	
	@GetMapping("/museum/comment/deleteReply")
	public String deleteReply(Model model, int rcno, int musNo) {
		String url = "/museumDetail?no=" + musNo;
		int result = museumService.deleteReply(rcno);
		if (result < 1) {
			model.addAttribute("msg", "댓글 삭제에 실패했습니다.");
			model.addAttribute("location", url);
		} else {
			model.addAttribute("msg", "댓글이 삭제되었습니다.");
			model.addAttribute("location", url);
		}
		return "common/msg";
	}
	
	@ResponseBody
	@PostMapping(value = "/museum/addMuseBookmark", produces = "application/json;charset=UTF-8")
	public ResponseEntity<Map<String, String>> addMuseBookmark(HttpSession session,
			@RequestBody Map<String, Object> request) {
		System.err.println("request>> " + request);
		Member loginMember = (Member) session.getAttribute("loginMember");
		if (loginMember == null) {
			Map<String, String> response = new HashMap<>();
			response.put("message", "로그인이 필요합니다.");
			return ResponseEntity.badRequest().body(response);
		}

		int mno = loginMember.getMno();
		int musNo = Integer.parseInt(request.get("musNo").toString());

		Map<String, Object> map = new HashMap<>();
		map.put("mno", mno);
		map.put("musNo", musNo);

		if (museumService.getMuseBookmarkCount(map) > 0) {
			museumService.removeMuseBookmark(map);
			Map<String, String> response = new HashMap<>();
			response.put("message", "이미 즐겨찾기에 추가되어 있습니다. 삭제합니다.");

			response.put("bookmarked", "true");

			return ResponseEntity.ok(response);
		} else {
			if (museumService.addMuseBookmark(map) > 0) {
				Map<String, String> response = new HashMap<>();
				response.put("message", "즐겨찾기에 추가되었습니다.");

				response.put("bookmarked", "false");

				return ResponseEntity.ok(response);
			} else {
				Map<String, String> response = new HashMap<>();
				response.put("message", "추가하지 못했습니다. 다시 확인해 주세요.");
				return ResponseEntity.ok(response);
			}
		}
	}
	
	@GetMapping("/museum/star")
	public String museumStar(Model model, HttpSession session, @RequestParam Map<String, String> param) {
		int result = museumService.submitMuseStar(param);
		if (result < 1) {
			model.addAttribute("msg", "별점 제출에 실패했습니다.");
			model.addAttribute("location", "/museumDetail?no=" + param.get("no"));
			return "common/msg";
		}
		return "redirect:/museumDetail?no=" + param.get("no");
	}
	
}


















