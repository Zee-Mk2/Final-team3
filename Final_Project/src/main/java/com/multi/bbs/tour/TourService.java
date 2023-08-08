package com.multi.bbs.tour;

import java.io.File;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.multi.bbs.common.util.PageInfo;

@Service
public class TourService {
	@Autowired
	TourMapper mapper;	
	
	public String saveFile(MultipartFile upFile, String savePath) {
		File folder = new File(savePath);
		
		// 폴더 없으면 만드는 코드
		if(folder.exists() == false) {
			folder.mkdir();
		}
		System.out.println("savePath : " + savePath);
		
		// 파일이름을 랜덤하게 바꾸는 코드, test.txt -> 20221213_1728291212.txt
		String originalFileName = upFile.getOriginalFilename();
		String reNameFileName = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMdd_HHmmssSSS"));
		reNameFileName += originalFileName.substring(originalFileName.lastIndexOf("."));
		String reNamePath = savePath + "/" + reNameFileName;
		
		try {
			// 실제 파일이 저장되는 코드
			upFile.transferTo(new File(reNamePath));
		} catch (Exception e) {
			return null;
		}
		return reNameFileName;
	}

	public List<TourList> getMuseumList(String keyword) {
		return mapper.getMuseumList(keyword);
	}

	public List<TourList> getHeritageList(String keyword) {
		return mapper.getHeritageList(keyword);
	}

	@Transactional(rollbackFor = Exception.class)
	public int insertTour(Tour tour) {
		return mapper.insertTour(tour);
	}

	@Transactional(rollbackFor = Exception.class)
	public void insertTourSchedule(TourSchedule tourSchedule) {
		mapper.insertTourSchedule(tourSchedule);
	}

	public List<Tour> getTourList(Map<String, String> param, PageInfo pageInfo) {
		param.put("limit", "" + pageInfo.getListLimit());
		param.put("offset", "" + (pageInfo.getStartList() - 1));
		if (param.size() > 2) {
			return mapper.searchTourList(param);
		} else {
			return mapper.tourList(param);
		}
	}

	public int getBoardCount(Map<String, String> param) {
		if (param.size() > 0) {
			return mapper.getBoardCount(param);
		} else {
			return mapper.allBoardCount();
		}
	}

	public Tour getTourByTno(int tno) {
		return mapper.getTourByTno(tno);
	}

	public List<TourSchedule> getSchedulsByTno(int tno) {
		return mapper.getSchedulsByTno(tno);
	}

	@Transactional(rollbackFor = Exception.class)
	public int writeComment(TourComment comment, String update) {
		if (update == null) {
			return mapper.insertComment(comment);
		} else {
			comment.setCno(Integer.valueOf(update));
			return mapper.insertReplyComment(comment);
		}
	}

	public List<TourComment> getComments(int tno) {
		return mapper.getComments(tno);
	}

	@Transactional(rollbackFor = Exception.class)
	public int deleteComment(int cno) {
		return mapper.deleteComment(cno);
	}

	public List<TourReplyComment> getReply(int tno) {
		return mapper.getReply(tno);
	}
	
	@Transactional(rollbackFor = Exception.class)
	public int deleteReply(int rcno) {
		return mapper.deleteReply(rcno);
	}

	public int completeTour(int tno, String complete) {
		if (complete.equals("false")) {
			return mapper.completeTour(tno);
		} else {
			return mapper.recruitTour(tno);
		}
	}

	@Transactional(rollbackFor = Exception.class)
	public int deleteTour(int tno) {
		return mapper.deleteTour(tno);
	}
}
