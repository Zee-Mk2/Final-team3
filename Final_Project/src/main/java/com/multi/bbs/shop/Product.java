package com.multi.bbs.shop;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Product {
	private String productid;
    private String producttype;
    private String title;
    private String image;
    private int lprice;
    private String category1;
    private String category2;
    private String category3;
    private String category4;
    private String mallname;
}
