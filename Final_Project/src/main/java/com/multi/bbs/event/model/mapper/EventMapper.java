package com.multi.bbs.event.model.mapper;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.multi.bbs.event.model.vo.Event;
import com.multi.bbs.event.model.vo.EventProgram;


@Mapper
public interface EventMapper {

	List<Event> selectEventList(Map<String, String> param);


	EventProgram selectEventByNoWithEvent(int no);
	
	
	

}