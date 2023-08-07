package com.multi.bbs.board.model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.multi.bbs.board.model.vo.Board;
import com.multi.bbs.board.model.vo.Comment;

@Mapper
public interface BoardMapper {

	int insertBoard(Board board);

	List<Board> getBoardList(Map<String, String> param);

	int getBoardCount(Map<String, String> param);

	Board getBoardByBno(int bno);

	void increaseViews(int bno);

	int deleteBoard(Map<String, String> param);

	int updateBoard(Board board);

	int insertComment(Comment comment);

	List<Comment> getComment(int bno);

	int deleteComment(int cno);

}
