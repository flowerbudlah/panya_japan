package com.tjoeun.spring.dao;

import java.util.List;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tjoeun.spring.dto.ProductDTO;

@Repository
public class ProductDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	//상품전시(상품게시판 메인)
	public List<ProductDTO> getProductListByCategory(int category_idx){
		List<ProductDTO> productListByCategory = sqlSessionTemplate.selectList("product.getProductListByCategory", category_idx);
			return productListByCategory ;
	}
	
	//상품상세보기(상품게시판 글읽기)
	public ProductDTO getProductDetail(int product_idx){
		ProductDTO productDetail = sqlSessionTemplate.selectOne("product.getProductDetail", product_idx);
			return productDetail ;
	}
	
	//상품등록(상품게시판 글읽기)
	public void addProduct(ProductDTO newProductDTO) {
		sqlSessionTemplate.insert("product.addProduct", newProductDTO);
	}

	//상품삭제
	public void delete(int product_idx) {
		sqlSessionTemplate.delete("product.delete", product_idx); 
	}
	
	
	//상품수정
	public void modify(ProductDTO modifyProductDTO) {
		sqlSessionTemplate.update("product.modify", modifyProductDTO);
	}
	
	
	
	

}
