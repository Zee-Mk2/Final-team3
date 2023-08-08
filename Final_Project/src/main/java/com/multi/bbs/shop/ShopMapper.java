package com.multi.bbs.shop;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ShopMapper {

	List<Product> searchProducts(Map<String, String> param);

	int getCount(Map<String, String> param);

	Product getProductById(long productId);

	int insertReview(ProductReview review);

	List<ProductReview> getReviews(long productId);

	List<Product> getAnotherProducts(long productId);

}
