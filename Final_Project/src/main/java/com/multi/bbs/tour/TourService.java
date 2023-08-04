package com.multi.bbs.tour;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TourService {
	@Autowired
	TourMapper mapper;

	public List<TourList> getMuseumList(String keyword) {
		return mapper.getMuseumList(keyword);
	}

	public List<TourList> getHeritageList(String keyword) {
		return mapper.getHeritageList(keyword);
	}

	public int insertTour(Tour tour) {
		return mapper.insertTour(tour);
	}

	public void insertTourSchedule(TourSchedule tourSchedule) {
		mapper.insertTourSchedule(tourSchedule);
	}

	public List<Tour> getTourList() {
		return mapper.getTourList();
	}
}
