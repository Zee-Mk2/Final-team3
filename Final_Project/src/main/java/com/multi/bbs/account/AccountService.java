package com.multi.bbs.account;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class AccountService {
	
	@Autowired
	private AccountMapper accountMapper;
	
	@Transactional(rollbackFor = Exception.class)
	public int signUp(Member member) {
		int result = 0;
		if(member.getMno() == 0) { // 회원가입
			result = accountMapper.insertMember(member);
		}else { // 회원 수정
			result = accountMapper.updateMember(member);
		}
		return result;
	}

//	public Member login(String email, String password) {
//		Member member = accountMapper.selectMember(email);
//		if(member != null && member.getPassword().equals(password)) {
//			// 성공
//			return member;
//		} else {
//			// 로그인 실패
//			return null;
//		}
//	}
	
	public Member findById(String id) {
		return accountMapper.selectMember(id);
	}


}
