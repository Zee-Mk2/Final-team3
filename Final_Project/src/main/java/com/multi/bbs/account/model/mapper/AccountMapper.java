package com.multi.bbs.account.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AccountMapper {
	int selectCount();
	List<Member> selectAll();
	Member selectMember(String email);
	int insertMember(Member member);
	int updateMember(Member member);
}

