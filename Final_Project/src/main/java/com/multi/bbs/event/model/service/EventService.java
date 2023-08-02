package com.multi.bbs.event.model.service;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.multi.bbs.event.model.mapper.EventMapper;
import com.multi.bbs.event.model.vo.Event;
import com.multi.bbs.event.model.vo.EventImg;
import com.multi.bbs.event.model.vo.EventProgram;
import com.multi.bbs.event.model.vo.EventProgramDTO;


@Service
public class EventService {
	@Autowired
	private EventMapper mapper;

	public List<Event> getEventList(Map<String, String> param) {
		
		return mapper.selectEventList(param);
	}


	@Transactional(rollbackFor = Exception.class)
	public List<EventProgramDTO> findByNo(int eventNo) {
        List<EventProgram> eventProgramList = mapper.selectEventByNoWithEventList(eventNo);
        List<EventProgramDTO> eventProgramDTOList = new ArrayList<>();

        for (EventProgram eventProgram : eventProgramList) {
            EventProgramDTO dto = new EventProgramDTO();
            dto.setProgramNo(eventProgram.getProgramNo());
            dto.setEvntNo(eventProgram.getEvntNo());
            dto.setTitle(eventProgram.getTitle());
            dto.setContent(eventProgram.getContent());
            dto.setLocation(eventProgram.getLocation());
            eventProgramDTOList.add(dto);
        }

        return eventProgramDTOList;
	}


	public Event getEventByNo(int no) {
        return mapper.selectEventByNo(no);
    }

	public List<EventImg> getEventImagesByNo(int no) {
        return mapper.getEventImagesByNo(no);
    }
	
	

}