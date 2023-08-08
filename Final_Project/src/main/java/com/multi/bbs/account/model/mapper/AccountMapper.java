package com.multi.bbs.account.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.multi.bbs.account.model.vo.Member;
import com.multi.bbs.shop.OrderedList;

@Mapper
public interface AccountMapper {
	int selectCount();
	List<Member> selectAll();
	Member selectMember(String email);
	int insertMember(Member member);
	int updateMember(Member member);
	List<OrderedList> getOrderedList(int mno);
}

