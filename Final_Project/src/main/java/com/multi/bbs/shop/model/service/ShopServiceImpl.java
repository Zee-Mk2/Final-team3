package com.multi.bbs.shop.model.service;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.multi.bbs.shop.Product;
import com.multi.bbs.shop.ProductMapper;

@Service
public class ShopServiceImpl implements ShopService {
	
	@Autowired
	private ProductMapper productMapper;
	
	@Override
	public boolean registerBoard(Product params) {
		int queryList = 0;
		
		if (params.getProductid() == null) {
			queryList = productMapper.insertProduct(params);
		}
		
		return (queryList == 1) ? true : false;
		
	}
	
	@Override
	public Product getGoodsDetail(String productid) {
		return productMapper.selectProduct(productid);
	}
	
	@Override
	public List<Product> getBoardList() {
		List<Product> boardList = Collections.emptyList();
		
		int goodsTotalCount = productMapper.selectTotalCount();
		
		if (goodsTotalCount > 0) {
			boardList = productMapper.selectCount();
		}
		
		return boardList;
	}
}
