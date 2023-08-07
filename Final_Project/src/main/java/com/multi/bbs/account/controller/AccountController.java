package com.multi.bbs.account.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import com.multi.bbs.account.model.service.AccountService;
import com.multi.bbs.account.model.vo.Member;
import com.multi.bbs.heritage.model.service.HeritageService;
import com.multi.bbs.heritage.model.vo.HeriBookmark;
import com.multi.bbs.heritage.model.vo.Heritage;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class AccountController {

	@Autowired
	private AccountService accountService;
	
	@Autowired
	private HeritageService heriService;
	
	final static private String savePath = "C:\\upfiles\\";
	
	@GetMapping("/sign-in")
	public String signInPage() {
		return "account/account-signin";
	}
	
	@GetMapping("/sign-up")
	public String signUpPage() {
		return "account/account-signup";
	}
	
	@PostMapping("/sign-up")
	public String signUp(@ModelAttribute Member member, MultipartFile upfile) {
		System.out.println("member : " + member);
		
		// 파일 저장 로직
		if(upfile != null && upfile.isEmpty() == false) {
			String renameFileName = accountService.saveFile(upfile, savePath);
			
			if(renameFileName != null) {
				member.setReFileName(renameFileName);
			}
		}
		
		accountService.signUp(member);
		
		return "account/account-signin";
	}
	
	@PostMapping("/sign-in")
	String login(Model model, String email, String password, HttpSession session) {
		System.out.println("email : " + email + ", password : " + password);
		Member loginMember = accountService.login(email, password);
		if(loginMember != null) { // 성공
			model.addAttribute("loginMember", loginMember);
			System.out.println("email : " + email + ", 로그인 성공!!");
			session.setAttribute("loginMember", loginMember);
			return "redirect:/";
		}else { // 실패
			model.addAttribute("msg", "아이디 또는 패스워드가 잘못되었습니다.");
			model.addAttribute("location", "/sign-in");
			System.out.println("email : " + email + ", 로그인 실패@@");
			return "common/msg";
		}
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		if (session != null) {
			session.invalidate();
		}
		return "redirect:/";
	}
	
	@GetMapping("mypage/bookmark")
	public String heriBookmarkPage(Model model, HttpSession session) {
		Member loginMember =(Member) session.getAttribute("loginMember");
		model.addAttribute("loginMember", loginMember);
		if(loginMember == null) {
			model.addAttribute("msg","로그인이 필요합니다.");
			model.addAttribute("location", "/sign-in");
			return "common/msg";
		}
		int mno = loginMember.getMno();
		
		List<Heritage> list = heriService.getHeritageByHeriBookmarkList(mno);
		
		for (Heritage item : list) {
			item.setBookmark("Y");
		}
		model.addAttribute("list", list);

		return "account/account-bookMark";
	}
}



















