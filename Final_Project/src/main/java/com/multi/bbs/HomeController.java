package com.multi.bbs;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.multi.bbs.account.model.vo.Member;
import com.multi.bbs.event.model.vo.Event;
import com.multi.bbs.heritage.model.vo.Heritage;
import com.multi.bbs.museum.model.vo.Museum;
import com.multi.bbs.shop.Product;
import com.multi.bbs.tour.Tour;

import jakarta.servlet.http.HttpSession;

@Controller
public class HomeController {
	
	private static final Logger log = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	HomeMapper mapper;
	
	@GetMapping("/")
	public String home(Model model, HttpSession session) {
		Member loginMember = (Member) session.getAttribute("loginMember");
		if (loginMember != null) {
			System.out.println("로그인 세선>> " + loginMember.toString());
			model.addAttribute("loginMember", loginMember);
		} else {
			System.out.println("로그아웃된 상태");
		}
		
		List<Tour> tours = mapper.getTour();
		for (Tour tour : tours) {
			tour.setStartDate(tour.getStartDate().split(" ")[0]);
			tour.setEndDate(tour.getEndDate().split(" ")[0]);
		}
		model.addAttribute("tours", tours);
		
		List<Product> products = mapper.getProduct();
		model.addAttribute("products", products);
		
		List<Heritage> heritages = mapper.getHeritage();
		model.addAttribute("heritages", heritages);
		
		Museum museum = mapper.getMuseum("국립한글박물관");
		model.addAttribute("museum", museum);
		
		List<Event> events = mapper.getEvent("8월");
		model.addAttribute("events", events);
		
		return "index";
	}

	@GetMapping("search")
	public String homeSearch(String searchType, String keyword) {
	    try {
	    	String encodedKeyword = URLEncoder.encode(keyword, "UTF-8");
	        if (searchType.equals("heritage")) {
	            return "redirect:/heritage/list?page=&order=&name=" + encodedKeyword + "&minasDate=1939&maxasDate=2023&address=&era=&type=";
	        } else {
	            return "redirect:/museum?address=&name=" + encodedKeyword;
	        }
	    } catch (UnsupportedEncodingException e) {
	    }
	    
	    return "redirect:/";
	}

	
}
