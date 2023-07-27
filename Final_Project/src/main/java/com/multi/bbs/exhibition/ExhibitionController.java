package com.multi.bbs.exhibition;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ExhibitionController {
	@GetMapping("/exhibition")
	public String exhibitionPage(Model model) {
		return "/exhibition/exhibition";
	}
	
	@GetMapping("/exhibitionDetail")
	public String exhibitionDetailPage(Model model) {
		return "/exhibition/exhibitionDetail";
	}
}