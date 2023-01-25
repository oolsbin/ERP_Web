package com.hanul.berp;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.jdbc.SQL;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import emp.EmpDAO;
import emp.EmpVO;
import notice.NoticeDAO;
import notice.NoticeListVO;

@Controller
public class ProfileController {
	@Autowired EmpDAO dao;
	
	
	@RequestMapping("/profile.pr")
	public String Profile(Model model, HttpSession session ) {
		EmpVO vo = (EmpVO) session.getAttribute("loginInfo");
		
		
		model.addAttribute("vo", vo);
		return "side/profile/myProfile";
	}
}
