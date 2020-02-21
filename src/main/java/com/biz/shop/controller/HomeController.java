package com.biz.shop.controller;

import java.util.List;
import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.biz.shop.domain.ProductVO;
import com.biz.shop.service.ProductService;

import lombok.RequiredArgsConstructor;

/**
 * Handles requests for the application home page.
 */
@RequiredArgsConstructor
@Controller
public class HomeController {
	
	
	private final ProductService proService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		
		
		 List<ProductVO> productList = proService.selectAll();
		
		
		model.addAttribute("PRODUCTLIST", productList);
		
		return "home";
	}
	
}
