package com.multi.bbs.event.model.mapper;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.multi.bbs.event.model.vo.Event;
import com.multi.bbs.event.model.vo.EventImg;
import com.multi.bbs.event.model.vo.EventProgram;


@Mapper
public interface EventMapper {

	List<Event> selectEventList(Map<String, String> param);

	List<EventProgram> selectEventByNoWithEventList(int eventNo);

	Event selectEventByNo(int no);

	List<EventImg> getEventImagesByNo(int eventNo);


	
	
	

}