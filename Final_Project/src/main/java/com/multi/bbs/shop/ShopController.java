package com.multi.bbs.shop;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ShopController {
	@GetMapping("/shop/catalog")
	public String tourPage(Model model) {
		return "shop/shopCatalog";
	}
	
	@GetMapping("/shop/detail")
	public String tourDetailPage() {
		return "shop/shopDetail";
	}
	
	@GetMapping("/shop/checkout")
	public String tourPostPage() {
		return "shop/shopCheckout";
	}
}
