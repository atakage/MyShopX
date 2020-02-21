package com.biz.shop.controller.user;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.biz.shop.domain.ProductVO;
import com.biz.shop.service.ProductService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@RequestMapping(value="/user/product")
@Controller
public class B2C_Controller {
	
	
	private final ProductService proService;
	
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String list(Model model) {
		
	
		return null;
		
	}
	
	
	
	
	
	
	@RequestMapping(value="/detail", method=RequestMethod.GET)
	public String detail(@RequestParam("id") String id, Model model) {
		
		
		
		
		ProductVO productVO = proService.findById(Long.valueOf(id));
		
		
		log.debug("브이오" + productVO.toString());
		
		
		model.addAttribute("PRODUCTVO", productVO);
		
		
		return "home";
		
	}

}
