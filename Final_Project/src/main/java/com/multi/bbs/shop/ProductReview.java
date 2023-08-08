package com.multi.bbs.shop;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductReview {
	private int prno;
	private String productId;
	private int mno;
	private String content;
	private Date createTime;
	private String timeDiff;
	private String reFileName;
	private String name;
}
