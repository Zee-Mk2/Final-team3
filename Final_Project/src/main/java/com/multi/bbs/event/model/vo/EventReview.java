package com.multi.bbs.event.model.vo;


import java.time.ZonedDateTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class EventReview {
	private int evntReviewNo;
	private int evntNo;
	private int Mno;
	private String content;
	private int rating;
	private ZonedDateTime writeTime;
	private String name;

}