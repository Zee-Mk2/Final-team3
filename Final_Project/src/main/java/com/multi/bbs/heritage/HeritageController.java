package com.multi.bbs.heritage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.multi.bbs.account.model.vo.Member;
import com.multi.bbs.common.util.PageInfo;
import com.multi.bbs.heritage.model.service.HeritageService;
import com.multi.bbs.heritage.model.vo.HeriBookmark;
import com.multi.bbs.heritage.model.vo.Heritage;
import com.multi.bbs.heritage.model.vo.Reply;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@RequestMapping
@Slf4j
@Controller
public class HeritageController {
	
	@Autowired
	private HeritageService service;
	
	@GetMapping("/heritage/list")
	public String heritageListPage(Model model,
			HttpSession session,
			@RequestParam Map<String, Object> paramMap
			) {
		Member loginMember = (Member) session.getAttribute("loginMember");
		model.addAttribute("loginMember", loginMember);
		String name = (String) paramMap.get("name");
		if (name == null) {
			paramMap.put("name", "");
		}
		String address = (String) paramMap.get("address");
		if (address == null) {
			paramMap.put("address", "");
		}
		String era = (String) paramMap.get("era");
		if (era == null) {
			paramMap.put("era", "");
		}
		String type = (String) paramMap.get("type");
		if (type == null) {
			paramMap.put("type", "");
		}
		
		
		int page = 1;
		log.info("page : " + page);
		log.info("@@@@@@@@@@@@" + paramMap);
		
		if(paramMap.get("page") != null) {
			try {
				page = Integer.parseInt((String)paramMap.get("page"));
			} catch (Exception e) {}
		}
		
		
		int count = service.getHeritageCount(paramMap);
		PageInfo pageInfo = new PageInfo(page, 5, count, 5);
		List<Heritage> list = service.getHeritageList(pageInfo, paramMap);
		System.out.println(list);
		
		model.addAttribute("count", count);
		model.addAttribute("list", list);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("paramMap", paramMap);
		
		
		return "/heritage/heritage-list";
	}
	

	@GetMapping("/heritage/detail")
	public String heritageDetailPage(Model model, @RequestParam("no") int no, HttpSession session) {
		Member loginMember = (Member) session.getAttribute("loginMember");
		model.addAttribute("loginMember", loginMember);
		Heritage heritage = service.findByNo(no);
		if(heritage == null) {
			return "common/error";
					
		}
		
		model.addAttribute("item", heritage);
		System.out.println(heritage);
		
		List<Reply> replies = service.getRepliesList(heritage.getHNo());
		model.addAttribute("replies", replies);
		
		return "/heritage/heritage-detail";
	}
	
	@RequestMapping("/heritage/reply")
	public String heritageReply(Model model, 
			@SessionAttribute(name = "loginMember", required = false) 
			Member loginMember, @ModelAttribute Reply reply
			) {
		reply.setMNo(loginMember.getMno());
		reply.setName(loginMember.getName());
		log.info("리플 작성 요청 Reply : " + reply);
		System.out.println("sadfasdfsadfsdfsdafasfd" + loginMember.toString());
		int result = service.saveReply(reply);
		
		if(result > 0) {
			model.addAttribute("msg", "리플이 등록되었습니다.");
		}else {
			model.addAttribute("msg", "리플 등록에 실패하였습니다.");
		}
		model.addAttribute("location", "/heritage/detail?no="+reply.getHNo());		
				
		return "common/msg";
	}
	@ResponseBody
	@PostMapping(value = "/heritage/addHeriBookmark", produces = "application/json;charset=UTF-8")
	public  ResponseEntity<Map<String, String>> addHeriBookmark(HttpSession session,
			@RequestBody Map<String, Object> request){
		Member loginMember = (Member) session.getAttribute("loginMember");
		if (loginMember == null) {
			Map<String, String> response = new HashMap<>();
			 response.put("message", "로그인이 필요합니다.");
		     return ResponseEntity.badRequest().body(response);
		}
		
		int mno = loginMember.getMno();
		int hNo = Integer.parseInt(request.get("hNo").toString());
		
		Map<String, Object> map = new HashMap<>();
		map.put("mno", mno);
	    map.put("hNo", hNo);
	    
	    if(service.getHeriBookmarkCount(map) > 0) {
	    	service.removeHeriBookmark(map);
	    	Map<String, String> response = new HashMap<>();
	        response.put("message", "이미 즐겨찾기에 추가되어 있습니다. 삭제합니다.");

	        response.put("bookmarked", "true");

	        return ResponseEntity.ok(response);
	    }else {
	        if (service.addHeriBookmark(map) > 0) {
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
	
	@RequestMapping("account/account-bookMark")
	public String heriBookmarkPage(Model model, HttpSession session,
			HttpServletRequest request
			) {
		Member loginMember =(Member) session.getAttribute("loginMember");
		if(loginMember == null) {
			model.addAttribute("msg","로그인이 필요합니다.");
			model.addAttribute("location", "/sign-in");
			return "common/msg";
		}
		int mno = loginMember.getMno();
		
		List<HeriBookmark> heriBookmarkList = service.getHeriBookmarkList(mno);
		List<Heritage> list = service.getHeritageByHeriBookmarkList(heriBookmarkList);
		
		log.info("heriBookmarkList" + heriBookmarkList);
		log.info("Heritage" + list);
		model.addAttribute("list", list);

		return "account/account-bookMark";
	}
}
