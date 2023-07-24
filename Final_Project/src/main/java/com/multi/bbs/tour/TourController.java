package com.multi.bbs.tour;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TourController {
	@GetMapping("/tour")
	public String tourPage(Model model) {
		return "/tour/tour";
	}
	
	@GetMapping("/test")
	public String test() {
		return null;
	}
}
