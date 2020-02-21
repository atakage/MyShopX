package com.biz.shop.controller.admin;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.biz.shop.domain.DeptVO;
import com.biz.shop.service.DeptService;

import lombok.RequiredArgsConstructor;

@SessionAttributes("deptVO")
@RequiredArgsConstructor
@RequestMapping("/admin/dept")
@Controller
public class DeptController {
	
	
	
	private final DeptService deptService;

	
	
	@ModelAttribute("deptVO")
	public DeptVO deptVO() {
		return new DeptVO();
	}
	
	
	
	@RequestMapping(value= {"","/"}, method=RequestMethod.GET)
	public String dept(Model model, @ModelAttribute("deptVO") DeptVO deptVO) {
		
		
		deptVO = new DeptVO();
		
		
		this.modelMapping(model);
		model.addAttribute("deptVO", deptVO);
		
		return "admin/main";
		
	}
	
	
	@RequestMapping(value="/list", method=RequestMethod.GET )
	public String list(Model model) {
		
		
		this.modelMapping(model);
		
		return "admin/dept_list";
		
	}
	

	
	
	@RequestMapping(value="/input", method=RequestMethod.POST)
	public String input(@Valid @ModelAttribute("deptVO") DeptVO deptVO, BindingResult bResult,  Model model) {
		
		
		if(bResult.hasErrors()) {
			
			
			this.modelMapping(model);
			model.addAttribute("deptVO", deptVO);
			
		
			return "admin/main";
		}
		
		DeptVO ret = deptService.save(deptVO);
		
		
		return "redirect:/admin/dept";
		
		
		
	}
	
	
	
	
	
	@RequestMapping(value="/update/{id}", method=RequestMethod.GET)
	public String update(@PathVariable(name = "id") String d_idStr, Model model, HttpSession httpSession ) {
		
		
		
	//	this.modelMapping(model);
		
		
		 long d_id = Long.valueOf(d_idStr);
		 
		 
		 DeptVO deptVO = deptService.selectById(d_id);
		 
		 httpSession.setAttribute("deptVO", deptVO);
		 
		// model.addAttribute("deptVO", deptVO);
		 
		 return "redirect:/admin/dept/";
		 
	}
	
	
	
	
	@RequestMapping(value= {"/search/{search}","/search/","/search"}, method=RequestMethod.GET)
	public String search(@PathVariable("search") String search,  Model model) {
		
		
		this.modelMapping(model, search);
		
		return "admin/dept_list";
		
	}
	
	private void modelMapping(Model model, String search) {
		
		List<DeptVO> deptList = null;
		
		if(search == null) {
			deptList = deptService.selectAll();
		
		}else {
		
			deptList = deptService.findByDName(search);
		}
		
		model.addAttribute("DEPT_LIST", deptList);
		model.addAttribute("BODY", "DEPT");
		
		
	}
	
	
	private void modelMapping(Model model) {
		
		
		this.modelMapping(model, null);
		
	}
	
	
	
	
	
	
}
