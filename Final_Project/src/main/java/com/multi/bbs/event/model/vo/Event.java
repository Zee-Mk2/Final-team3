package com.multi.bbs.event.model.vo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class Event {
	private int evntNo;
	private String name;
	private String summary;
	private String startDate;
	private String endDate;
	private String ageLimit;
	private String fee;
	private String location;
	private String poster;

}