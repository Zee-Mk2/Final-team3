package com.multi.bbs.account;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;


//@Mapper : DAO 없이 자동으로 Mapper 객체를 생성해주는 어노테이션. 별도의 DAO 작성이 필요 없어진다.
//※ 주의 :  mapper의 id와 동일한 메소드 네이밍을 맞춰야한다. 

@Mapper
public interface AccountMapper {
	int selectCount();
	List<Member> selectAll();
	Member selectMember(@Param("id") String id); // @Param : 파라메터임을 알리는 어노테이션. 없어 된다.
	int insertMember(Member member);
	int updateMember(Member member);
}

