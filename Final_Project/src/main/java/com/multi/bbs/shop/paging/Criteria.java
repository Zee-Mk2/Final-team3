package com.multi.bbs.shop.paging;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Criteria {
	private int currentPageNo;
	private int goodsPerPage;
	private int pageSize;
	private String searchKeyword;
	private int priceMin;
	private int priceMax;
	
	public Criteria() {
		this.currentPageNo = 1;
		this.goodsPerPage = 20;
		this.pageSize = 5;
	}
	
	public int getStartPage() {
		return (currentPageNo - 1) * goodsPerPage;
	}
}
