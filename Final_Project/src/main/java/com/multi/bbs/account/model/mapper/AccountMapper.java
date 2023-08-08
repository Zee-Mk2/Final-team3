package com.multi.bbs.account.model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.multi.bbs.account.model.vo.Member;

@Mapper
public interface AccountMapper {
	int selectCount();
	List<Member> selectAll();
	Member selectMember(String email);
	int insertMember(Member member);
	int updateMember(Member member);
	int updatePassword(Map<String, Object> paramMap);
	int deleteAccountInfo(int mno);
}

