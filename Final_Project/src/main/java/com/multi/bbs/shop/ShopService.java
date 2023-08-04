package com.multi.bbs.shop;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ShopService {
	@Autowired
	ShopMapper mapper;

	public List<Product> searchProducts(String keyword) {
		return mapper.searchProducts(keyword);
	}
	
}
