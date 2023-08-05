package com.multi.bbs.tour;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class TourReplyComment {
	private int rcno;
	private int cno;
	private int tno;
	private int mno;
	private String name;
	private String state;
	private String content;
	private Date writeTime;
	private String isModified;
	private String isReply;
	private String timeDiff;
}
