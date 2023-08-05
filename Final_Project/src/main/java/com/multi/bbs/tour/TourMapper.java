package com.multi.bbs.tour;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TourMapper {

	List<TourList> getMuseumList(String keyword);

	List<TourList> getHeritageList(String keyword);

	int insertTour(Tour tour);

	void insertTourSchedule(TourSchedule tourSchedule);

	List<Tour> searchTourList(Map<String, String> param);

	List<Tour> tourList(Map<String, String> param);

	int getBoardCount(Map<String, String> param);

	int allBoardCount();

	Tour getTourByTno(int tno);

	List<TourSchedule> getSchedulsByTno(int tno);

	int insertComment(TourComment comment);

	List<TourComment> getComments(int tno);

	int deleteComment(int cno);

	int insertReplyComment(TourComment comment);

	List<TourReplyComment> getReply(int tno);

	int deleteReply(int rcno);

	int completeTour(int tno);

	int recruitTour(int tno);

	int deleteTour(int tno);
	
}
