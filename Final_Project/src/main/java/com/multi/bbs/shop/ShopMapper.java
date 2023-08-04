package com.multi.bbs.shop;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ShopMapper {

	List<Product> searchProducts(String keyword);

}
