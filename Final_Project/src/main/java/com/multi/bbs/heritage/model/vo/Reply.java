package com.multi.bbs.heritage.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Reply {
	private int rNo;
	private int hNo;
	private int mNo;
	private String name;
	private String content;
	private Date enroll_Date;
}
