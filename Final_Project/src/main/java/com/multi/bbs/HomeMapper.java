package com.multi.bbs;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.multi.bbs.event.model.vo.Event;
import com.multi.bbs.heritage.model.vo.Heritage;
import com.multi.bbs.museum.model.vo.Museum;
import com.multi.bbs.shop.Product;
import com.multi.bbs.tour.Tour;

@Mapper
public interface HomeMapper {

	List<Tour> getTour();

	List<Product> getProduct();

	List<Heritage> getHeritage();

	Museum getMuseum(String name);

	List<Event> getEvent(String startDate);

}
