package com.multi.bbs.kakao;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.multi.bbs.account.model.vo.Member;
import com.multi.bbs.shop.OrderedList;
import com.multi.bbs.shop.Product;
import com.multi.bbs.shop.ShopService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
public class KaKaoController {
	@Autowired
    private KakaoPayService kakaopay;
	
	@Autowired
	private ShopService service;
	    
    @PostMapping("/kakaoPay")
    public String kakaoPay(@RequestParam Map<String, String> param, HttpSession session) {
        log.info("kakaoPay post............................................");
        session.setAttribute("param", param);
        return "redirect:" + kakaopay.kakaoPayReady(param);
 
    }
    
    @GetMapping("/kakaoPaySuccess")
    public String kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model, HttpSession session) {
        log.info("kakaoPaySuccess get............................................");
        log.info("kakaoPaySuccess pg_token : " + pg_token);
        @SuppressWarnings("unchecked")
		Map<String, String> param = (Map<String, String>) session.getAttribute("param");
        System.out.println("kakaoParam>> " + param);
        model.addAttribute("info", kakaopay.kakaoPayInfo(pg_token, param));
        model.addAttribute("msg", "결제에 성공했습니다.");
        model.addAttribute("location", "/shop/checkout");
        List<Product> items = (List<Product>) session.getAttribute("cart");
        Member loginMember = (Member) session.getAttribute("loginMember");
        for (Product item : items) {
        	OrderedList order = new OrderedList(0, item.getProductId(), loginMember.getMno(), item.getTitle(), item.getImage(), item.getLprice(), item.getQuantity(), null, param.get("address"));
        	service.insertOrder(order);
        }
        session.setAttribute("cart", null);
        return "common/msg";
    }
	
}
