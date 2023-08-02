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
import com.multi.bbs.event.model.vo.EventImg;
import com.multi.bbs.event.model.vo.EventProgramDTO;


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
        
		model.addAttribute("eventProgramList", eventProgramDTOList);
		System.out.println(eventProgramDTOList);
		
		return "event/eventDetail";
	}
}










