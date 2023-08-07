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

	Heritage selectHeritageByNo(Map<String, String> param);

	int insertReply(Reply reply);

	List<Reply> getRepliesList(int hNo);

	int deleteReply(int rNo);
	
	// 북마크
	List<HeriBookmark> selectHeriBookmarkList(int mno);

	List<Heritage> selectBookmarkHeritage(int mno);

	int selectHeriBookmarkCount(Map<String, Object> map);

	int deleteHeriBookmark(Map<String, Object> map);

	int insertHeriBookmark(Map<String, Object> map);

	
	Double selectHeritageStarsAverage(int no);
	  

	int selectReplyCountByHNo(int no);

	int submitHeriStar(Map<String, String> param);

	Map<String, Object> getHeriStar(Map<String, String> param);

	int updateHeriStar(Map<String, String> param);
	 




}