package com.multi.bbs.board.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Comment {
	private int cno;
	private int bno;
	private int mno;
	private String name;
	private String state;
	private String content;
	private Date writeTime;
	private String isModified;
	private String timeDiff;
	private String reFileName;
}
