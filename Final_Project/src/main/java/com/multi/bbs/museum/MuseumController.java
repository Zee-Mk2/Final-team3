package com.multi.bbs.museum;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MuseumController {
	@GetMapping("/museum")
	public String museumPage(Model model) {
		return "/museum/museum";
	}
}
