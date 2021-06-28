package com.tjoeun.spring.dto;

import lombok.Data;

@Data
public class OrderDetailDTO {

	private int order_detail_idx; 
	private String order_idx; //order number
	private int product_idx; //product number
	private int amount; //purchase quantity
	private String member_id; //Purchaser
	
}
