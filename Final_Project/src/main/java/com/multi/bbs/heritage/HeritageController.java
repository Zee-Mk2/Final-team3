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
import com.multi.bbs.common.util.CalcTime;
import com.multi.bbs.common.util.PageInfo;
import com.multi.bbs.heritage.model.service.HeritageService;
import com.multi.bbs.heritage.model.vo.Heritage;
import com.multi.bbs.heritage.model.vo.Reply;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@RequestMapping
@Slf4j
@Controller
public class HeritageController {
	@Autowired
	private HeritageService service;
	
	@GetMapping("/heritage/list")
	public String heritageListPage(Model model, HttpSession session, @RequestParam Map<String, Object> paramMap) {
		if (paramMap.size() == 0) {
			paramMap.put("order", "name");
		}
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
		if (loginMember != null) {
			paramMap.put("mno", loginMember.getMno());
		}

		int page = 1;
		log.info("page : " + page);
		log.info("@@@@@@@@@@@@" + paramMap);

		if (paramMap.get("page") != null) {
			try {
				page = Integer.parseInt((String) paramMap.get("page"));
			} catch (Exception e) {
			}
		}

		int count = service.getHeritageCount(paramMap);
		PageInfo pageInfo = new PageInfo(page, 5, count, 5);
		List<Heritage> list = service.getHeritageList(pageInfo, paramMap);

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
		Map<String, String> param = new HashMap<>();
		param.put("no", String.valueOf(no));
		if (loginMember != null) {
			param.put("mno", String.valueOf(loginMember.getMno()));
		}
		Heritage heritage = service.findByNo(param);
		if (heritage == null) {
			return "common/error";
		}
		System.err.println(heritage.toString());
		model.addAttribute("item", heritage);

		List<Reply> replies = service.getRepliesList(heritage.getHNo());
		CalcTime calcTime = new CalcTime();
		for (Reply reply : replies) {
			reply.setTimeDiff(calcTime.getTimeDiff(reply.getEnrollDate()));
		}
		
		model.addAttribute("replies", replies);
		return "/heritage/heritage-detail";
	}

	@PostMapping("/heritage/reply")
	public String heritageReply(Model model,
			@SessionAttribute(name = "loginMember", required = false) Member loginMember, @ModelAttribute Reply reply) {
		reply.setMNo(loginMember.getMno());
		reply.setName(loginMember.getName());
		log.info("댓글 작성 요청 Reply : " + reply);
		System.out.println("sadfasdfsadfsdfsdafasfd" + loginMember.toString());
		int result = service.saveReply(reply);

		if (result > 0) {
			model.addAttribute("msg", "댓글이 등록되었습니다.");
		} else {
			model.addAttribute("msg", "댓글 등록에 실패하였습니다.");
		}
		model.addAttribute("location", "/heritage/detail?no=" + reply.getHNo());

		return "common/msg";
	}

	@PostMapping("/heritage/replyDel")
	public String heritageDeleteReply(Model model,
			@SessionAttribute(name = "loginMember", required = false) Member loginMember, int rNo, int hNo) {
		log.info("리플 삭제 요청");
		int result = service.deleteReply(rNo);

		if (result > 0) {
			model.addAttribute("msg", "댓글 삭제가 정상적으로 완료되었습니다.");
		} else {
			model.addAttribute("msg", "댓글 삭제에 실패하였습니다.");
		}
		model.addAttribute("location", "/heritage/detail?no=" + hNo);
		return "/common/msg";
	}

	@ResponseBody
	@PostMapping(value = "/heritage/addHeriBookmark", produces = "application/json;charset=UTF-8")
	public ResponseEntity<Map<String, String>> addHeriBookmark(HttpSession session,
			@RequestBody Map<String, Object> request) {
		System.err.println("request>> " + request);
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

		if (service.getHeriBookmarkCount(map) > 0) {
			service.removeHeriBookmark(map);
			Map<String, String> response = new HashMap<>();
			response.put("message", "이미 즐겨찾기에 추가되어 있습니다. 삭제합니다.");

			response.put("bookmarked", "true");

			return ResponseEntity.ok(response);
		} else {
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
	
	@GetMapping("/heritage/star")
	public String heritageStar(Model model, HttpSession session, @RequestParam Map<String, String> param) {
		int result = service.submitHeriStar(param);
		if (result < 1) {
			model.addAttribute("msg", "별점 제출에 실패했습니다.");
			model.addAttribute("location", "/heritage/detail?no=" + param.get("no"));
			return "common/msg";
		}
		return "redirect:/heritage/detail?no=" + param.get("no");
	}

}
