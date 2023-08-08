package com.multi.bbs.shop;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.multi.bbs.common.util.PageInfo;


@Service
public class ShopService {
	@Autowired
	ShopMapper mapper;

	public List<Product> searchProducts(Map<String, String> param, PageInfo pageInfo) {
		param.put("limit", "" + pageInfo.getListLimit());
		param.put("offset", "" + (pageInfo.getStartList() - 1));
		return mapper.searchProducts(param);
	}

	public int getCount(Map<String, String> param) {
		return mapper.getCount(param);
	}

	public Product getProductById(long productId) {
		return mapper.getProductById(productId);
	}

	@Transactional(rollbackFor = Exception.class)
	public int insertReview(ProductReview review) {
		return mapper.insertReview(review);
	}

	public List<ProductReview> getReviews(long productId) {
		return mapper.getReviews(productId);
	}

	public List<Product> getAnotherProducts(long productId) {
		return mapper.getAnotherProducts(productId);
	}

	@Transactional(rollbackFor = Exception.class)
	public void insertOrder(OrderedList order) {
		mapper.insertOrder(order);
	}

	public int deleteReview(int prno) {
		return mapper.deleteReview(prno);
	}
	
}
