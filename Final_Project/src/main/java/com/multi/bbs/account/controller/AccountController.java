package com.multi.bbs.account.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import com.multi.bbs.account.model.service.AccountService;
import com.multi.bbs.account.model.vo.Member;
import com.multi.bbs.heritage.model.service.HeritageService;
import com.multi.bbs.heritage.model.vo.Heritage;
import com.multi.bbs.shop.OrderedList;

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
	
	@GetMapping("/logout")
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
	
	@GetMapping("/mypage/orders")
	public String ordersPage(Model model, HttpSession session) {
		Member loginMember = (Member) session.getAttribute("loginMember");
		model.addAttribute("loginMember", loginMember);
		if (loginMember == null) {
			model.addAttribute("msg", "잘못된 접근입니다.");
			model.addAttribute("location", "/sign-in");
			return "common/msg";
		}
		List<OrderedList> items = accountService.getOrderedList(loginMember.getMno());
		for (OrderedList item : items) {
			System.out.println(item.toString());
		}
		model.addAttribute("items", items);
		
		return "account/account-orders";
	}
	
	@GetMapping("/myinfo")
	public String MyInfoPage(Model model, HttpSession session) {
		Member loginMember = (Member) session.getAttribute("loginMember");
		if (loginMember == null) {
			model.addAttribute("msg", "잘못된 접근입니다.");
			model.addAttribute("location", "/sign-in");
			return "common/msg";
		}
		
		model.addAttribute("loginMember", loginMember);
		
		
		return "account/account-myinfo";
	}
	
	@PostMapping("/update-myinfo")
	public String updateMyInfo(@ModelAttribute Member updatedMember, HttpSession session, Model model,
	                           @SessionAttribute(name = "loginMember", required = false) Member loginMember,
	                           @RequestParam(name = "upfile", required = false) MultipartFile upfile) {
	    log.info("회원 정보 수정 요청");

		// 파일 저장 로직
		if(upfile != null && upfile.isEmpty() == false) {
			String renameFileName = accountService.saveFile(upfile, savePath); 
			
			if(renameFileName != null) {
				updatedMember.setReFileName(renameFileName);
			}
		}
		updatedMember.setMno(loginMember.getMno());
		System.out.println(updatedMember);
		int result = accountService.updateMember(updatedMember);
		if (result < 1) {
			model.addAttribute("msg", "업데이트 실패");
			model.addAttribute("location", "myinfo");
			return "common/msg";
		}

		loginMember = accountService.findById(updatedMember.getEmail());
	    session.setAttribute("loginMember", loginMember);

	    return "redirect:/myinfo";
	}
	
	@GetMapping("/myinfo/{fileName}")
	@ResponseBody
	public Resource downloadImage(@PathVariable("fileName") String fileName, Model model) throws IOException {
		return new UrlResource("file:" + savePath + fileName);
	}
	
	@PostMapping("/change-password")
	public String changePassword(Model model, HttpSession session,
	                             @RequestParam("oldPassword") String oldPassword,
	                             @RequestParam("newPassword") String newPassword,
	                             @RequestParam("confirmPassword") String confirmPassword) {

	    Member loginMember = (Member) session.getAttribute("loginMember");
	    if (loginMember == null) {
	        model.addAttribute("msg", "로그인이 필요합니다.");
	        model.addAttribute("location", "/sign-in");
	        return "common/msg";
	    }
	    
	    BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

	    if (!encoder.matches(oldPassword, loginMember.getPassword())) {
	        model.addAttribute("msg", "기존 비밀번호가 일치하지 않습니다.");
	        model.addAttribute("location", "myinfo");
	        return "common/msg";
	    }

	    if (!newPassword.equals(confirmPassword)) {
	        model.addAttribute("msg", "새로운 비밀번호와 확인 비밀번호가 일치하지 않습니다.");
	        model.addAttribute("location", "myinfo");
	        return "common/msg";
	    }

	    String hashedNewPassword = encoder.encode(newPassword); 
	    
	    Map<String, Object> paramMap = new HashMap<>();
	    paramMap.put("mno", loginMember.getMno());
	    paramMap.put("newPassword", hashedNewPassword);
	    
	    int result = accountService.updatePassword(paramMap);
	    if (result < 1) {
	        model.addAttribute("msg", "비밀번호 변경에 실패하였습니다.");
	        model.addAttribute("location", "myinfo");
	        return "common/msg";
	    }

	    model.addAttribute("msg", "비밀번호가 변경되었습니다.");
	    model.addAttribute("location", "/myinfo"); 
	    return "common/msg";
	}
	
	@PostMapping("/delete-account")
	public String deleteAccount(HttpSession session, Model model) {
	    Member loginMember = (Member) session.getAttribute("loginMember");
	    if (loginMember == null) {
	        model.addAttribute("msg", "로그인이 필요합니다.");
	        model.addAttribute("location", "/sign-in");
	        return "common/msg";
	    }

	    // 계정 삭제 로직 수행
	    int result = accountService.deleteAccount(loginMember.getMno());

	    if (result < 1) {
	        model.addAttribute("msg", "계정 삭제에 실패하였습니다.");
	        model.addAttribute("location", "/myinfo");
	        return "common/msg";
	    }

	    // 세션 무효화 및 로그아웃 처리
	    session.invalidate();

	    model.addAttribute("msg", "계정이 삭제되었습니다.");
	    model.addAttribute("location", "/");
	    return "common/msg";
	}
}



















