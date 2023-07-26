package com.multi.bbs.heritage;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HeritageController {
	@GetMapping("/heritage/detail")
	public String heritageDetailPage(Model model) {
		return "/heritage/heritage-detail";
	}
	
	@GetMapping("/heritage/list")
	public String heritageListPage(Model model) {
		return "/heritage/heritage-list";
	}
	
}
