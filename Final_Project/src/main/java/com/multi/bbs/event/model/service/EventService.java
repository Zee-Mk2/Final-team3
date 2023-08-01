package com.multi.bbs.event.model.service;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.multi.bbs.event.model.mapper.EventMapper;
import com.multi.bbs.event.model.vo.Event;
import com.multi.bbs.event.model.vo.EventProgram;


@Service
public class EventService {
	@Autowired
	private EventMapper mapper;

	public List<Event> getEventList(Map<String, String> param) {
		
		return mapper.selectEventList(param);
	}


	@Transactional(rollbackFor = Exception.class)
	public EventProgram findByNo(int eventNo) {
		EventProgram eventProgram = mapper.selectEventByNoWithEvent(eventNo);
		return eventProgram;
	}

	
	
	

}