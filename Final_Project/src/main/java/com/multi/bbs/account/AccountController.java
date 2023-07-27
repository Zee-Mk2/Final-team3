package com.multi.bbs.account;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class AccountController {
	@GetMapping("/sign-in")
	public String signInPage() {
		return "account/account-signin";
	}
	
	@GetMapping("/sign-up")
	public String signUpPage() {
		return "account/account-signup";
	}
	
	@PostMapping("/sign-up")
	public String signUp(Member member) {
		System.out.println(member.toString());
		return "account/account-signup";
	}
}
