package com.multi.bbs.shop.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.multi.bbs.shop.model.vo.Product;

@Mapper
public interface ProductMapper {
	int selectCount();
	List<Product> selectAll();
	Product selectProduct(String productid);
	int insertProduct(Product product);
	int selectTotalCount();
}