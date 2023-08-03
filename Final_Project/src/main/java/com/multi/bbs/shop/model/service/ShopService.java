package com.multi.bbs.shop.model.service;

import java.util.List;

import com.multi.bbs.shop.Product;

public interface ShopService {
	public boolean registerBoard(Product params);
	public Product getGoodsDetail(String productid);
	public List<Product> getBoardList();
}
