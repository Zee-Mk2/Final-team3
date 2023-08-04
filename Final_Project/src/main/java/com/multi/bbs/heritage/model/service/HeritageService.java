package com.multi.bbs.heritage.model.service;

import java.util.ArrayList;
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
	public Heritage findByNo(int hNo) {
		Heritage heritage = mapper.selectHeritageByNo(hNo);
		
		return heritage;
	}
	
	@Transactional(rollbackFor = Exception.class)
	public int saveReply(Reply reply) {
		return mapper.insertReply(reply);
	}

	public List<Reply> getRepliesList(int hNo) {
		return mapper.getRepliesList(hNo);
	}

	
	// 북마크
	
	public List<HeriBookmark> getHeriBookmarkList(int mno) {
		return mapper.selectHeriBookmarkList(mno);
	}

	public List<Heritage> getHeritageByHeriBookmarkList(List<HeriBookmark> heriBookmarkList) {
		List<Integer> hNoList = new ArrayList<>();
		for(HeriBookmark heriBookmark : heriBookmarkList) {
			hNoList.add(heriBookmark.getHNo());
		}
		List<Heritage> heritage = mapper.selectHeritageByHNo(hNoList);
		
		return heritage;
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


	
}
