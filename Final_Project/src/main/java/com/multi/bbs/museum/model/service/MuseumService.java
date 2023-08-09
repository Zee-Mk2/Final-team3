package com.multi.bbs.museum.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.multi.bbs.common.util.PageInfo;
import com.multi.bbs.heritage.model.vo.Reply;
import com.multi.bbs.museum.model.mapper.MuseumMapper;
import com.multi.bbs.museum.model.vo.MuseComment;
import com.multi.bbs.museum.model.vo.MuseReplyComment;
import com.multi.bbs.museum.model.vo.Museum;

@Service
public class MuseumService {
	
	@Autowired
	private MuseumMapper museumMapper;

	public List<Museum> getMuseumList(Map<String, String> paramMap, PageInfo pageInfo) {
		paramMap.put("limit", "" + pageInfo.getListLimit());
		paramMap.put("offset", "" + (pageInfo.getStartList() - 1));
		return museumMapper.selectMuseumList(paramMap);
	}

	public Museum findByNo(Map<String, Object> param) {
		return museumMapper.selectMuseumByNo(param);
	}
	
	public int getResultCount(Map<String, String> paramMap) {
		return museumMapper.selectResultCount(paramMap);
	}

	public int writeComment(MuseComment comment, String update) {
		if (update == null) {
			return museumMapper.insertComment(comment);
		} else {
			comment.setCno(Integer.valueOf(update));
			return museumMapper.insertReplyComment(comment);
		}
	}
	
	public List<MuseComment> getComments(Map<String, Object> param) {
		return museumMapper.getComments(param);
	}

	public int deleteComment(int cno) {
		return museumMapper.deleteComment(cno);
	}

	public int deleteReply(int rcno) {
		return museumMapper.deleteReply(rcno);
	}

	public List<MuseReplyComment> getReply(Map<String, Object> param) {
		return museumMapper.getReply(param);
	}

	public int submitMuseStar(Map<String, String> param) {
		Map<String, Object> result = museumMapper.getMuseStar(param);
		if (result == null) {
			return museumMapper.submitMuseStar(param);
		} else {
			return museumMapper.updateMuseStar(param);
		}
	}

	public int getMuseBookmarkCount(Map<String, Object> map) {
		return museumMapper.selectMuseBookmarkCount(map);
	}

	public int removeMuseBookmark(Map<String, Object> map) {
		return museumMapper.deleteMuseBookmark(map);
	}

	public int addMuseBookmark(Map<String, Object> map) {
		return museumMapper.insertMuseBookmark(map);
	}

	public List<Museum> getAroundMuseum(Map<String, Object> param) {
		return museumMapper.getAroundMuseum(param);
	}
	


}
