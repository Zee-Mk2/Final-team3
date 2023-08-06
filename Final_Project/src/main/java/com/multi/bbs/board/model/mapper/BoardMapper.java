package com.multi.bbs.board.model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.multi.bbs.board.model.vo.Board;
import com.multi.bbs.board.model.vo.Comment;


@Mapper
public interface BoardMapper {
	List<Board> selectBoardList(Map<String, String> map);
	int selectBoardCount(Map<String, String> map);
	Board selectBoardByNo(int no);
	int insertBoard(Board board);
	int insertComment(Comment comment);
	int updateBoard(Board board);
	int updateReadCount(Board board);
	int deleteBoard(int no);
	int deleteComment(int no);
}

