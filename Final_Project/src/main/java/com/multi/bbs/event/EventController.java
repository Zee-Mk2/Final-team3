package com.multi.bbs.event;

import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.multi.bbs.event.model.service.EventService;
import com.multi.bbs.event.model.vo.Event;
import com.multi.bbs.event.model.vo.EventImg;
import com.multi.bbs.event.model.vo.EventProgramDTO;
import com.multi.bbs.event.model.vo.EventReview;

import lombok.extern.slf4j.Slf4j;

import com.multi.bbs.account.model.vo.Member;

@Slf4j
@Controller
public class EventController {
	
	@Autowired EventService service;
	
	@GetMapping("/event")
	public String list(Model model, @RequestParam Map<String, String> param) {
		if(param.containsKey("startDate") == false) {
			param.put("startDate", "8월");
		}
		List<Event> list = service.getEventList(param);
		
		model.addAttribute("startDate", param.get("startDate"));
		model.addAttribute("list", list);
		System.out.println(list);
		model.addAttribute("param", param);
		
		return "event/event";
	}
	
	@RequestMapping("/event/eventDetail")
	public String eventDetailPage(Model model, @RequestParam("no") int no) {
		List<EventProgramDTO> eventProgramDTOList = service.findByNo(no);
        if (eventProgramDTOList == null || eventProgramDTOList.isEmpty()) {
            return "common/error";
        }
        
        Event event = service.getEventByNo(no);
        model.addAttribute("event", event);
        System.out.println(event);
        
        List<EventImg> eventImages = service.getEventImagesByNo(no);
        model.addAttribute("eventImages", eventImages);
        System.out.println(eventImages);
        
        List<EventReview> eventReviewsWithMember = service.getEventReviewsWithMemberByNo(no);
        model.addAttribute("eventReviews", eventReviewsWithMember);
        System.out.println(eventReviewsWithMember);
        
		model.addAttribute("eventProgramList", eventProgramDTOList);
		System.out.println(eventProgramDTOList);
		
		return "event/eventDetail";
	}
	
	
	@PostMapping("/reply")
	public String writeReply(Model model, 
	        @SessionAttribute(name = "loginMember", required = false) Member loginMember,
	        @ModelAttribute EventReview eventReview
	) {
	    eventReview.setMno(loginMember.getMno());
	    eventReview.setWriteTime(ZonedDateTime.now(ZoneId.of("Asia/Seoul"))); // 현재 시간을 서울 시간대로 설정
        log.info("리플 작성 요청 Reply : " + eventReview);
	    
	    int result = service.saveReply(eventReview);
	    
	    if (result > 0) {
	        model.addAttribute("msg", "리플이 등록되었습니다.");
	        return "redirect:/event/eventDetail?no=" + eventReview.getEvntNo(); // 이벤트 번호를 파라미터로 전달
	    } else {
	        model.addAttribute("msg", "리플 등록에 실패하였습니다.");
	        model.addAttribute("location", "/event/eventDetail?no=" + eventReview.getEvntNo()); // 이벤트 번호를 파라미터로 전달
	        return "common/msg";
	    }
	}
	
	@RequestMapping("/replyDel")
	public String deleteReply(Model model, 
			@SessionAttribute(name = "loginMember", required = false) Member loginMember,
			int evntReviewNo, int evntNo
			){
		log.info("리플 삭제 요청");
		int result = service.deleteReply(evntReviewNo);
		
		if(result > 0) {
			model.addAttribute("msg", "리플 삭제가 정상적으로 완료되었습니다.");
		}else {
			model.addAttribute("msg", "리플 삭제에 실패하였습니다.");
		}
		model.addAttribute("location", "/event/eventDetail?no=" + evntNo);
		return "/common/msg";
	}
	
}










