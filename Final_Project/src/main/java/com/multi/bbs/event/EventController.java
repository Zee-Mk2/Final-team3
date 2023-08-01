package com.multi.bbs.event;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.multi.bbs.event.model.service.EventService;
import com.multi.bbs.event.model.vo.Event;
import com.multi.bbs.event.model.vo.EventProgram;


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
		EventProgram eventProgram = service.findByNo(no);
		if(eventProgram == null) {
			return "common/error";
		}
		
		model.addAttribute("eventProgram", eventProgram);
		System.out.println(eventProgram);
		
		return "event/eventDetail";
	}
}










