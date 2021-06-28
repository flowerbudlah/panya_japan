package com.tjoeun.spring.controller;

import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tjoeun.spring.dto.CartDTO;
import com.tjoeun.spring.dto.MemberDTO;
import com.tjoeun.spring.dto.OrderDTO;
import com.tjoeun.spring.dto.OrderDetailDTO;
import com.tjoeun.spring.dto.OrderListDTO;
import com.tjoeun.spring.service.CartService;

@Controller
@RequestMapping("/mypage")
public class CartController {
	@Autowired
	private CartService cartService;

	//putting goods in my cart
	@ResponseBody
	@PostMapping("/cart/")
	public String addGoodsInCart(CartDTO cartDTO, HttpSession session) {
	
		MemberDTO loginMemberDTO = (MemberDTO) session.getAttribute("loginMemberDTO");
		cartDTO.setMember_id(loginMemberDTO.getMember_id()); 
	
		boolean istAlreadyExisted = cartService.findCartGoods(cartDTO);
		System.out.println("istAlreadyExisted : " + istAlreadyExisted);
		
		if (istAlreadyExisted) {   
			return "already_existed";
         } else {
            cartService.addGoodsInCart(cartDTO);
			return "add_success";
		}
	}
	
	//cartList
	@RequestMapping(value = "/cart/cartlist/{member_id}", method = {RequestMethod.GET, RequestMethod.POST})
	public String myCart(@PathVariable("member_id") String member_id, Model model) {
		
		Map<String, List> cartMap = cartService.getMyCart(member_id);
		model.addAttribute("cartMap", cartMap);
		
		//배송비 제외한 결제금액
		int paymentMoney = cartService.sum(member_id); 
		model.addAttribute("paymentMoney", paymentMoney); 
		
		return "mypage/cart/cartlist";
	}
	
	//eliminate the goods in my basket
	@GetMapping("/cart/cartlist/delete")
	public String delete(@RequestParam("cart_idx") int cart_idx, HttpSession session) {
		cartService.delete(cart_idx); 
		
		MemberDTO loginMemberDTO = (MemberDTO) session.getAttribute("loginMemberDTO");
		
		return "redirect:/mypage/cart/cartlist/"+loginMemberDTO.getMember_id();
	}
	
	//change the quantity of the goods in my basket
	@PostMapping("/cart/cartlist/updateAmount")
	public String updateAmount(@ModelAttribute("updateAmountCartDTO") CartDTO updateAmountCartDTO, HttpSession session) {
		
		cartService.updateAmount(updateAmountCartDTO); 
		MemberDTO loginMemberDTO = (MemberDTO) session.getAttribute("loginMemberDTO");
		return "redirect:/mypage/cart/cartlist/"+loginMemberDTO.getMember_id();
	}

	
	
	//order and payment
	@PostMapping("/order")
	public String order(HttpSession session, OrderDTO newOrderDTO, OrderDetailDTO newOrderDetailDTO){
		MemberDTO loginMemberDTO = (MemberDTO) session.getAttribute("loginMemberDTO");
		String member_id = loginMemberDTO.getMember_id(); 
		
	
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		String ymd = ym + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		String subNum = "";
		for(int i = 1; i <= 6; i ++) {	subNum += (int)(Math.random()*10);	}
		String order_idx = ymd+"_"+subNum;
		
		newOrderDTO.setOrder_idx(order_idx); 
		newOrderDTO.setMember_id(member_id); 
		cartService.orderInfo(newOrderDTO); 
		
		newOrderDetailDTO.setOrder_idx(order_idx); 
		newOrderDetailDTO.setMember_id(member_id); 
		cartService.orderInfoDetail(newOrderDetailDTO);
		
		//because of Paying the goods in my basket, I eliminate the goods in my cart
		cartService.emptyMyCart(member_id); 
		return "redirect:/mypage/order/orderInfo"; 
	}
	
	//특정인의 결제완료된 주문목록 
	@GetMapping("/order/orderInfo")
	public String orderPaymentList(HttpSession session, Model model){
		
		MemberDTO loginMemberDTO = (MemberDTO)session.getAttribute("loginMemberDTO");
		String member_id = loginMemberDTO.getMember_id(); 
		
		List<OrderDTO> orderPaymentList = cartService.orderPaymentList(member_id); 
		model.addAttribute("orderPaymentList", orderPaymentList);
		
		return "mypage/order/orderInfo";
	}
	

	//결제가 완료가 된경우, 상품에 관한 상세정보도 알수있는 
	@GetMapping("/order/orderInfo_Details")
	public String getOrderList(HttpSession session, 
		@RequestParam("order_idx") String order_idx, OrderDTO idAndOrderIdxOrderDTO, Model model){
	
		MemberDTO loginMemberDTO = (MemberDTO)session.getAttribute("loginMemberDTO");
		String member_id = loginMemberDTO.getMember_id(); 
		
		idAndOrderIdxOrderDTO.setMember_id(member_id); 
		idAndOrderIdxOrderDTO.setOrder_idx(order_idx); 
	 
		List<OrderListDTO> allInformationAboutOrder = cartService.allInformationAboutOrder(idAndOrderIdxOrderDTO); 
	 
		model.addAttribute("allInformationAboutOrder", allInformationAboutOrder);
		
		return "mypage/order/orderInfo_Details";
		
		
	}
	
	
	
	
}


