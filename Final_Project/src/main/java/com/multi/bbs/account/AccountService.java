package com.multi.bbs.account;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class AccountService {
	
	@Autowired
	private AccountMapper accountMapper;
	
	private BCryptPasswordEncoder pwEncoder = new BCryptPasswordEncoder();
	
	@Transactional(rollbackFor = Exception.class)
	public int signUp(Member member) {
		int result = 0;
		if(member.getMno() == 0) { // 회원가입
			String encodePW = pwEncoder.encode(member.getPassword());
			member.setPassword(encodePW);
			result = accountMapper.insertMember(member);
		}else { // 회원 수정
			result = accountMapper.updateMember(member);
		}
		return result;
	}

	public Member login(String email, String password) {
		Member member = accountMapper.selectMember(email);
		if(member == null) {
			return null;
		}
		
		// passwordEncoder 활용법
		System.out.println(member.getPassword()); // hash로 암호화된 코드가 들어있다.
		System.out.println(pwEncoder.encode(password)); // encode를 통해 평문에서 hash 코드로 변환
		System.out.println(pwEncoder.matches(password, member.getPassword())); // 평문 변환하고 비교까지
		
		if(email.equals("admin")) { // admin 테스트를 위한 코드
			return member;
		}
		
		if(member != null && pwEncoder.matches(password, member.getPassword()) == true) {
			// 성공
			return member;
		}else {
			// 로그인 실패
			return null;
		}
	}
	
	public Member findById(String id) {
		return accountMapper.selectMember(id);
	}


}
