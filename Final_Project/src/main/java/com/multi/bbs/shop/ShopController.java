package com.multi.bbs.shop;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.multi.bbs.account.model.vo.Member;
import com.multi.bbs.common.util.CalcTime;
import com.multi.bbs.common.util.PageInfo;
import com.multi.bbs.tour.TourList;

import jakarta.servlet.http.HttpSession;

@Controller
public class ShopController {
	@Autowired
	ShopService service;
	
	CalcTime calcTime = new CalcTime();
	
	@GetMapping("/shop")
	public String shopPage(Model model, HttpSession session, @RequestParam Map<String, String> param) {
		Member loginMember = (Member) session.getAttribute("loginMember");
		model.addAttribute("loginMember", loginMember);
		if (param.get("minPrice") == null) {
			param.put("minPrice", "0");
			param.put("maxPrice", "1000000");
		}
		int page = 1;
		if (param.get("page") != null) {
			page = Integer.parseInt(param.get("page"));
		}
		model.addAttribute("param", param);
		model.addAttribute("min", Integer.valueOf(param.get("minPrice")));
		model.addAttribute("max", Integer.valueOf(param.get("maxPrice")));
		
		int count = service.getCount(param);
		PageInfo pageInfo = new PageInfo(page, 5, count, 12);
		List<Product> products = service.searchProducts(param, pageInfo);
		model.addAttribute("products", products);
		model.addAttribute("pageInfo", pageInfo);
		
		return "shop/shopCatalog";
	}
	
	@GetMapping("/shop/detail")
	public String shopDetailPage(Model model, HttpSession session, long productId) {
		Member loginMember = (Member) session.getAttribute("loginMember");
		model.addAttribute("loginMember", loginMember);
		Product product = service.getProductById(productId);
		model.addAttribute("product", product);
		List<ProductReview> reviews = service.getReviews(productId);
		for (ProductReview review : reviews) {
			review.setTimeDiff(calcTime.getTimeDiff(review.getCreateTime()));
		}
		model.addAttribute("reviews", reviews);
		List<Product> anotherProducts = service.getAnotherProducts(productId);
		model.addAttribute("anotherProducts", anotherProducts);
		
		return "shop/shopDetail";
	}
	
	@PostMapping("/shop/postReview")
	public String postReview(Model model, HttpSession session, ProductReview review) {
		Member loginMember = (Member) session.getAttribute("loginMember");
		String url = "/shop/detail?productId=" + review.getProductId();
		if (loginMember == null) {
			model.addAttribute("msg", "잘못된 접근입니다.");
			model.addAttribute("location", url);
			return "common/msg";
		}
		int result = service.insertReview(review);
		if (result < 1) {
			model.addAttribute("msg", "리뷰 작성에 실패했습니다.");
			model.addAttribute("location", url);
		} else {
			model.addAttribute("msg", "리뷰가 작성되었습니다.");
			model.addAttribute("location", url);
		}
		
		return "common/msg";
	}
	
	@PostMapping("/shop/addCart")
	@ResponseBody
	public void reqList(Model model, HttpSession session, Product product) {
		System.out.println(product.toString());
	}
	
	@GetMapping("/shop/checkout")
	public String shopCheckoutPage(Model model, HttpSession session) {
		Member loginMember = (Member) session.getAttribute("loginMember");
		model.addAttribute("loginMember", loginMember);
		return "shop/shopCheckout";
	}
	
	@PostMapping("/shop/checkout")
	public String shopCheckout() {
		return "shop/shopCheckout";
	}
}
