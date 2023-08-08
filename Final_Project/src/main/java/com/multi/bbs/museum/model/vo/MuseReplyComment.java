package com.multi.bbs.museum.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MuseReplyComment {
	private int rcno;
	private int cno;
	private int musNo;
	private int mno;
	private String name;
	private String state;
	private String content;
	private Date writeTime;
	private String isModified;
	private String isReply;
	private String timeDiff;
}
