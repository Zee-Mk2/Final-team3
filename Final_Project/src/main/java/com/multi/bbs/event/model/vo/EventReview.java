package com.multi.bbs.event.model.vo;


import java.util.Date;

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
	private Date writeTime;
	private String name;
	private String timeDiff;
	private String reFileName;
}