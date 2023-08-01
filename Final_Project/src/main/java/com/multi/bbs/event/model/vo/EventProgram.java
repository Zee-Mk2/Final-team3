package com.multi.bbs.event.model.vo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class EventProgram {
	private int programNo;
	private int evntNo;
	private String view;
	private String street;
	private String story;
	private String history;
	private String picture;
	private String market;
	private String food;
	private String sleep;
	private String img1;
	private String img2;
	private String img3;
	private String name;
	private String poster;
    private String summary;
	
}