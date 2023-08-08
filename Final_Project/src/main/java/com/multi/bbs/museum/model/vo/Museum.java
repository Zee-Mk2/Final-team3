package com.multi.bbs.museum.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Museum {
	private int musNo;
	private String name;
	private String summary;
	private String viewHours;
	private String fee;
	private String tel;
	private String img;
	private String sumImg;
	private double la;
	private double lo;
	private String ProgramImg;
	private String address;
	private String bookmark;
	private double average;
}
