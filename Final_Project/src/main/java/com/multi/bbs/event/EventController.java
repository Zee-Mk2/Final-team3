package com.multi.bbs.event;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class EventController {
	@GetMapping("/event")
	public String eventPage(Model model) {
		return "/event/event";
	}
}