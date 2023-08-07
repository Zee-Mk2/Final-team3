package com.multi.bbs.board.model.service;

import java.io.File;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.multi.bbs.board.model.mapper.BoardMapper;
import com.multi.bbs.board.model.vo.Board;
import com.multi.bbs.board.model.vo.Comment;
import com.multi.bbs.common.util.PageInfo;

@Service
public class BoardService {
	@Autowired
	BoardMapper mapper;
	
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

	@Transactional(rollbackFor = Exception.class)
	public int insertBoard(Board board, String isUpdate, String bno) {
		if (isUpdate == null) {
			return mapper.insertBoard(board);
		} else {
			board.setBno(Integer.valueOf(bno));
			return mapper.updateBoard(board);
		}
	}

	public List<Board> getBoardList(Map<String, String> param, PageInfo pageInfo) {
		param.put("limit", "" + pageInfo.getListLimit());
		param.put("offset", "" + (pageInfo.getStartList() - 1));
		return mapper.getBoardList(param);
	}

	public int getBoardCount(Map<String, String> param) {
		return mapper.getBoardCount(param);
	}

	public Board getBoardByBno(int bno) {
		mapper.increaseViews(bno);
		return mapper.getBoardByBno(bno);
	}

	public int deleteBoard(Map<String, String> param) {
		return mapper.deleteBoard(param);
	}

	public int postComment(Comment comment) {
		return mapper.insertComment(comment);
	}

	public List<Comment> getComment(int bno) {
		return mapper.getComment(bno);
	}

	public int deleteComment(int cno) {
		return mapper.deleteComment(cno);
	}
	
}
