package com.multi.bbs.shop;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.multi.bbs.account.model.vo.Member;

import jakarta.servlet.http.HttpSession;

@Controller
public class ShopController {
	@Autowired
	ShopService service;
	
	@GetMapping("/shop")
	public String shopPage(Model model, HttpSession session, String keyword) {
		Member loginMember = (Member) session.getAttribute("loginMember");
		model.addAttribute("loginMember", loginMember);
		model.addAttribute("keyword", keyword);
		
		List<Product> products = service.searchProducts(keyword);
		model.addAttribute("products", products);
		
		return "shop/shopCatalog";
	}
	
	@GetMapping("/shop/detail")
	public String shopDetailPage() {
		return "shop/shopDetail";
	}
	
	@GetMapping("/shop/checkout")
	public String shopCheckoutPage() {
		System.err.println("shopCheckoutPage 메소드 호출됨");
		return "shop/shopCheckout";
	}
	
	@PostMapping("/shop/checkout")
	public String shopCheckout() {
		System.err.println("shopCheckout 메소드 호출됨");
		return "shop/shopCheckout";
	}
}
