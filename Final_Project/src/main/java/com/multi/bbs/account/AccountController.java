package com.multi.bbs.account;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class AccountController {

	@Autowired
	private AccountService accountService;
	
	@GetMapping("/sign-in")
	public String signInPage() {
		return "account/account-signin";
	}
	
	@GetMapping("/sign-up")
	public String signUpPage() {
		return "account/account-signup";
	}
	
	@PostMapping("/sign-up")
	public String signUp(@ModelAttribute Member member) {
		System.out.println("member : " + member);
		accountService.signUp(member);
		return "account/account-signin";
	}
	
	@PostMapping("/sign-in")
	String login(Model model, String email, String password) {
		System.out.println("email : " + email + ", password : " + password);
		Member loginMember = accountService.login(email, password);
		if(loginMember != null) { // 성공
			model.addAttribute("loginMember", loginMember);
			System.out.println("email : " + email + ", 로그인 성공!!");
			return "index";
		}else { // 실패
			model.addAttribute("msg", "아이디 패스워드가 잘못되었습니다.");
			model.addAttribute("location", "/");
			System.out.println("email : " + email + ", 로그인 실패@@");
			return "common/msg";
		}
	}
	
	@RequestMapping("/logout")
	public String logout(SessionStatus status) { 
		log.info("status : " + status.isComplete());
		status.setComplete();
		log.info("status : " + status.isComplete());
		return "redirect:/";
	}
}



















