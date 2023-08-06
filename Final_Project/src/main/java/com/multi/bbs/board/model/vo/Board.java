package com.multi.bbs.board.model.vo;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Board {
	private int bno;
	private int mno;
	private String name;
	private String state;
	private String boardCat;
	private String title;
	private String content;
	private String fileName;
	private String reFileName;
	private List<Comment> commentList; 
	private Date writeTime;
	private String isModified;
	private int views;
}
