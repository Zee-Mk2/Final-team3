package com.multi.bbs.tour;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Tour {
	private int tno;
	private int mno;
	private String name;
	private String state;
	private String title;
	private String region;
	private int numOfPeople;
	private String startDate;
	private String endDate;
	private int duration;
	private String category;
	private String content;
	private String fileName;
	private String reFileName;
	private Date writeTime;
	private String timeDiff;
	private String profilePic;
}
