package com.multi.bbs.event.model.vo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class EventImg {
	private int imgNo;
	private int evntNO;
	private String url;

}