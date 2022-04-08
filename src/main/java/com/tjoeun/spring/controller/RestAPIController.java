package com.tjoeun.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import org.springframework.web.bind.annotation.RestController;

import com.tjoeun.spring.service.MemberService;


@RestController
public class RestAPIController {
  
	@Autowired
	private MemberService memberService;
	
	//Duplicate Checking ID
	@GetMapping("/member/checkID/{member_id}")
	public String checkID(@PathVariable String member_id) {
		boolean chck = memberService.checkID(member_id);
			return chck+"";
	}

	
}




