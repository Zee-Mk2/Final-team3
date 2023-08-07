package com.multi.bbs.heritage.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Heritage {
	private int hNo;
	private String kind;
	private String name;
	private String name2;
	private String kindCode;
	private String cityCode;
	private String ccbaAsno;
	private double lo;
	private double la;
	private String gcodeName;
	private String bcodeName;
	private String mcodeName;
	private String scodeName;
	private Date asDate;
	private String location;
	private String era;
	private String img;
	private String content;
	private String bookmark;
	private double average;
}