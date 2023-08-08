package com.multi.bbs.shop;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderedList {
	private int orderNo;
	private String productId;
	private int mno;
	private String title;
	private String image;
	private int price;
	private int quantity;
	private String orderDate;
	private String address;
}
