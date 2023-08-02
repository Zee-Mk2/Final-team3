package com.multi.bbs.event.model.vo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class EventProgramDTO {
	private int programNo;
	private int evntNo;
	private String title;
	private String content;
	private String location;
}