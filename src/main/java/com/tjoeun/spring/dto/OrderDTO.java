package com.tjoeun.spring.dto;

import java.util.Date;

import lombok.Data;

@Data
public class OrderDTO {

	private String order_idx;
	
	private String member_id; //주문결제자의 아이디 
	private int paymentprice; //배송비+물품총가격 = 결제금액
	
	private String sender_name; //발송인의 이름
	private String sender_address; //발송인의 주소
	private int sender_postcode; //발송인 우편번호
	private String sender_tel; //발송인의 전화번호 
	
	private String recipient_name; //수신인의 이름
	private String recipient_address; //수신인의 주소 
	private int recipient_postcode; 	
	private String recipient_tel; 
	
	
	private Date order_date; //결제일 
	private String memo; 
	private String payment_method; 
	
	private String circumstance; 


}
