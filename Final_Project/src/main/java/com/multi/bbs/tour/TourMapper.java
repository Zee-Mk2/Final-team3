package com.multi.bbs.tour;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TourMapper {

	List<TourList> getMuseumList(String keyword);

	List<TourList> getHeritageList(String keyword);

	int insertTour(Tour tour);

	void insertTourSchedule(TourSchedule tourSchedule);

	List<Tour> getTourList();
	
}
