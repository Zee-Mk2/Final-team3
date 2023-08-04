package com.multi.bbs.heritage.model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.multi.bbs.heritage.model.vo.HeriBookmark;
import com.multi.bbs.heritage.model.vo.Heritage;
import com.multi.bbs.heritage.model.vo.Reply;


@Mapper
public interface HeritageMapper {

	int selectHeritageCount(Map<String, Object> paramMap);

	List<Heritage> selectHeritageList(Map<String, Object> paramMap);

	Heritage selectHeritageByNo(int No);

	int insertReply(Reply reply);

	List<Reply> getRepliesList(int hNo);

	
	// 북마크
	List<HeriBookmark> selectHeriBookmarkList(int mno);

	List<Heritage> selectHeritageByHNo(List<Integer> hNoList);

	int selectHeriBookmarkCount(Map<String, Object> map);

	int deleteHeriBookmark(Map<String, Object> map);

	int insertHeriBookmark(Map<String, Object> map);



}