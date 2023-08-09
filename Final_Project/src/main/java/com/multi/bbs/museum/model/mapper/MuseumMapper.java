package com.multi.bbs.museum.model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.multi.bbs.event.model.vo.Event;
import com.multi.bbs.heritage.model.vo.Reply;
import com.multi.bbs.museum.model.vo.Museum;
import com.multi.bbs.museum.model.vo.MusBookmark;
import com.multi.bbs.museum.model.vo.MuseComment;
import com.multi.bbs.museum.model.vo.MuseReplyComment;

@Mapper
public interface MuseumMapper {

	List<Museum> selectMuseumList(Map<String, String> param);

	int selectResultCount(Map<String, String> param);

	List<MusBookmark> getMuseumLike(int musNo);

	Museum selectMuseumByNo(Map<String, Object> param);

	int insertComment(MuseComment comment);

	int insertReplyComment(MuseComment comment);

	List<MuseComment> getComments(Map<String, Object> param);

	int deleteComment(int cno);

	int deleteReply(int rcno);

	List<MuseReplyComment> getReply(Map<String, Object> param);

	Map<String, Object> getMuseStar(Map<String, String> param);

	int submitMuseStar(Map<String, String> param);

	int updateMuseStar(Map<String, String> param);

	int insertMuseBookmark(Map<String, Object> map);

	int deleteMuseBookmark(Map<String, Object> map);

	int selectMuseBookmarkCount(Map<String, Object> map);

	List<Museum> getAroundMuseum(Map<String, Object> param);

	
	
}
























