package com.multi.bbs.shop;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ProductMapper {
	int selectCount();
	List<Product> selectAll();
	Product selectProduct(String productid);
	int insertProduct(Product product);
}
