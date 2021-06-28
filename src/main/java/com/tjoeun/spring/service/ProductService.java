package com.tjoeun.spring.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.tjoeun.spring.dao.ProductDAO;
import com.tjoeun.spring.dto.ProductDTO;


@Service
@PropertySource("/WEB-INF/properties/option.properties")
public class ProductService {

	@Autowired
	private ProductDAO productDAO;
	
	@Value("${item.path.load}")
	private String item_path_load;
	
	
  
	//상품리스트
	public List<ProductDTO> getProductListByCategory(int category_idx){
		List<ProductDTO> productListByCategory = productDAO.getProductListByCategory(category_idx); 
			return productListByCategory; 
	}
	
	//상품상세보기(게시글 하나 읽기)
	public ProductDTO getProductDetail(int product_idx){
		ProductDTO productDetail = productDAO.getProductDetail(product_idx);
			return productDetail;
	}
	
	
	
	
	//이미지 파일 첨부
	private String saveUploadFile(MultipartFile product_image_file) {
		
		String file_name = System.currentTimeMillis() + "_" + product_image_file.getOriginalFilename();
		
		try { 
			product_image_file.transferTo(new File(item_path_load + "/" + file_name));
			
		} catch (IllegalStateException e) { 
			e.printStackTrace();
		} catch (IOException e) { 
			e.printStackTrace();
		}
		return file_name;
	}
	//상품등록
	public void addProduct(ProductDTO newProductDTO) {
		//상품을 등록하기 전에 이경우는 반드시 이미지 파일을 업로드 하기 때문
		MultipartFile product_image_file = newProductDTO.getProduct_image_file(); 
		
		String file_name = saveUploadFile(product_image_file);
		
		newProductDTO.setProduct_img(file_name);
	
		productDAO.addProduct(newProductDTO);
	}
	
	
	
	
	//상품삭제
	public void delete(int product_idx) {
		productDAO.delete(product_idx);
	}
	
	
	//상품정보수정
	public void modify(ProductDTO modifyProductDTO) {
		
		MultipartFile product_image_file = modifyProductDTO.getProduct_image_file(); 
		
		String file_name = saveUploadFile(product_image_file);
		
		modifyProductDTO.setProduct_img(file_name);

			productDAO.modify(modifyProductDTO);
	}
	
	

	}
