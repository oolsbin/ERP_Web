package com.hanul.berp;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.NoHandlerFoundException;

import emp.EmpDAO;
import emp.EmpVO;


@Controller
public class HomeController {
	@Autowired EmpDAO dao;
	@RequestMapping(value = {"/","/index"})
	public String index() {
		return "layout/index";
	}
	
	@RequestMapping(value= {"/side"})
	public String side(Model model) {
		
		EmpVO vo = dao.emp_info(0);
		
		model.addAttribute("vo", vo);
		return "side";
	}
	
	@RequestMapping(value = {"/sideIndex"})
	public String sideIndex(HttpSession session) {
		
		
		return "side/sideIndex";
	}
	
	
	@RequestMapping("/recruit")
	public String recruit() {
		
			
		return "recruit";
	}
	
	
	
	  @GetMapping("/error404")
	    public String Error404(HttpServletResponse res, Model model) {
//	        LOGGER.warn("========== ERROR 404 PAGE ==========");
	        model.addAttribute("code", "ERROR_404");
	        return "custom404";
	    }
	    
	    @GetMapping("/error500")
	    public String Error500(HttpServletResponse res, Model model) {
//	        LOGGER.warn("========== ERROR 500 PAGE ==========");
	        model.addAttribute("code", "ERROR_500");
	        return "custom404";
	    }
	
	
}
