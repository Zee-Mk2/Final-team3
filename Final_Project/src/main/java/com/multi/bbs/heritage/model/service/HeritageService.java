package com.multi.bbs.heritage.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.multi.bbs.common.util.PageInfo;
import com.multi.bbs.heritage.model.mapper.HeritageMapper;
import com.multi.bbs.heritage.model.vo.HeriBookmark;
import com.multi.bbs.heritage.model.vo.Heritage;
import com.multi.bbs.heritage.model.vo.Reply;

@Service
public class HeritageService {

	@Autowired
	private HeritageMapper mapper;

	public int getHeritageCount(Map<String, Object> paramMap) {
		return  mapper.selectHeritageCount(paramMap);
	}

	public List<Heritage> getHeritageList(PageInfo pageInfo, Map<String, Object> paramMap) {
		paramMap.put("limit", "" + pageInfo.getListLimit());
		paramMap.put("offset", "" + (pageInfo.getStartList()-1));
		return mapper.selectHeritageList(paramMap);
	}
	
	@Transactional(rollbackFor = Exception.class)
	public Heritage findByNo(Map<String, String> param) {
		return mapper.selectHeritageByNo(param);
	}
	
	@Transactional(rollbackFor = Exception.class)
	public int saveReply(Reply reply) {
		return mapper.insertReply(reply);
	}

	public List<Reply> getRepliesList(int hNo) {
		return mapper.getRepliesList(hNo);
	}

	public int deleteReply(int rNo) {
		return mapper.deleteReply(rNo);
	}
	
	// 북마크
	
	public List<HeriBookmark> getHeriBookmarkList(int mno) {
		return mapper.selectHeriBookmarkList(mno);
	}

	public List<Heritage> getHeritageByHeriBookmarkList(int mno) {
		return mapper.selectBookmarkHeritage(mno);
	}

	public int getHeriBookmarkCount(Map<String, Object> map) {
		return mapper.selectHeriBookmarkCount(map);
	}

	public int removeHeriBookmark(Map<String, Object> map) {
		return mapper.deleteHeriBookmark(map);
	}

	public int addHeriBookmark(Map<String, Object> map) {
		return mapper.insertHeriBookmark(map);
	}


	
	 public Double getheritageStarsAverage(int no) { 
		 return mapper.selectHeritageStarsAverage(no); }
	  

	public int getHeritageStarsByHNo(int no) {
		return mapper.selectReplyCountByHNo(no);
	}

	public int getReplyCountByHNo(int no) {
		return mapper.selectReplyCountByHNo(no);
	}

	public int submitHeriStar(Map<String, String> param) {
		Map<String, Object> result = mapper.getHeriStar(param);
		if (result == null) {
			return mapper.submitHeriStar(param);
		} else {
			return mapper.updateHeriStar(param);
		}
	}

	 




	
}
