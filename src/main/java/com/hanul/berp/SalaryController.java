package com.hanul.berp;




import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import emp.DepartmentVO;
import emp.EmpDAO;
import salary.SalEmpVO;
import emp.EmpVO;
import salary.BonusVO;
import salary.SalaryDAO;
import salary.SalaryVO;

@Controller
public class SalaryController {
	@Autowired SalaryDAO dao;
	@Autowired EmpDAO emp_dao;
	
	@RequestMapping("list.sa")
	public String hrList(Model model, HttpSession session, @RequestParam(defaultValue = "-1") int department_id) {
		
		List<SalEmpVO> workList = null;		
		if( department_id == -1 ) {
			workList = dao.employee_list();
		}else {
			workList = dao.employee_list_d(department_id);
		}
		//List<SalEmpVO> empList = dao.employee_list();
		List<SalEmpVO> departments = dao.departments();
		
		model.addAttribute("department_id", department_id);
		model.addAttribute("list", workList);
		model.addAttribute("departments", departments);
		
		return "side/salary/salList";
	}
	
	@RequestMapping("modify.sa")
	public String salModify(Model model , int id) {
	
		SalEmpVO emp = dao.mod_info(id);
		List<SalaryVO> sa = dao.salary_List();
		List<SalEmpVO> sl = dao.employee_list();
		
	
		
		model.addAttribute("emp", emp);
		 model.addAttribute("sa", sa); 
		model.addAttribute("sl", sl);
		
		return "side/salary/salModify";
	}
	
	@RequestMapping("bonus.sa")
	public String salBonus(Model model , int id) {
	
		SalEmpVO emp = dao.mod_info(id);
	
		model.addAttribute("emp", emp);
		
		return "side/salary/salBonus";
	}
	@RequestMapping("insertCommission.sa")
	public String insert_commission(int employee_id, String salary, String commission) {
	
		SalEmpVO vo = new SalEmpVO();
		vo.setSalary(Integer.parseInt(salary));
		vo.setEmployee_id(employee_id);
		vo.setCommission_pct(Float.parseFloat(commission));
		
		dao.update_salary(vo);
		
		return "redirect:list.sa";
	}
	@RequestMapping("insertBonus.sa")
	public String insert_bonus(int employee_id, String bonus, String bonus_comment) {
	
		SalEmpVO vo = new SalEmpVO();
		vo.setBonus(Integer.parseInt(bonus));
		vo.setEmployee_id(employee_id);
		vo.setBonus_comment(bonus_comment);
		
		System.out.println(dao.insert_bonus(vo));
		
		return "redirect:list.sa";
	}
	
	@RequestMapping("/mySalary.sa")
	public String mySalary(int employee_id, Model model) {
		
		SalEmpVO vo = dao.mySalary(employee_id);
		
		model.addAttribute("mySalary", vo);
		return "side/salary/salMySalary";
	}
	
	
	
	
	
	
	//====================================안드로이드==========================================
	
	Gson gson = new Gson();
	
	@ResponseBody @RequestMapping(value="/andDeptList.sa", produces="text/html; charset=utf-8")
	public String DeptList() {
		return gson.toJson(emp_dao.departments());
	}
	

	@ResponseBody @RequestMapping(value="/andSalaryList.sa", produces="text/html; charset=utf-8")
	public String SalaryList(String department_name) {
		
		List<SalaryVO> salaryList;
		if(department_name.equals("전체")) {
			salaryList = dao.salaryList();
		}else {
			salaryList = dao.salaryList(department_name);
		}
		
		return gson.toJson(salaryList);
	}
	
	@ResponseBody @RequestMapping(value="/andInsertBonus.sa", produces="text/html; charset=utf-8")
	public String andInsertBonus(int employee_id, String bonus, String bonus_comment, String bonus_date) throws ParseException {
		System.out.println("상여");
		
//		DateFormat df = new SimpleDateFormat("yyyy/MM/dd");
//		Date d_bonus_date = df.parse(bonus_date);
				
		HashMap<String, Object> map = new HashMap<>();
        map.put("bonus" , bonus);
        map.put("bonus_date" , bonus_date);
        map.put("bonus_comment", bonus_comment);
        map.put("employee_id", employee_id);
        int res = dao.andInsertBonus(map);
		return gson.toJson(res);
	}
	
	@ResponseBody @RequestMapping(value="/andBonusList.sa", produces="text/html; charset=utf-8")
	public String andBonusList(String department_name) {
		
		
		List<BonusVO> bonusList;
		if(department_name.equals("전체")) {
			bonusList = dao.andBonusList();
		}else {
			bonusList = dao.andBonusList(department_name);
		}
		
		
		
		
		
		return gson.toJson(bonusList);
	}
	
	@ResponseBody @RequestMapping(value="/andCommissionSave.sa", produces="text/html; charset=utf-8")
	public String andCommissionSave(int employee_id, int commission_pct) {
		System.out.println("커미션");
		return gson.toJson(dao.andCommissionSave(employee_id, commission_pct));
	}
	
	@ResponseBody @RequestMapping(value="/andSalarySave.sa", produces="text/html; charset=utf-8")
	public String andSalarySave(int employee_id, int salary) {
		System.out.println("샐러리");
		return gson.toJson(dao.andSalarySave(employee_id, salary));
	}
	
	@ResponseBody @RequestMapping(value="/andMySalaryVo.sa", produces="text/html; charset=utf-8")
	public String andMySalaryVo(int employee_id) {
		System.out.println("andMySalaryVo");
		SalaryVO vo = dao.andMySalaryVo(employee_id);
     	return gson.toJson(vo);
	}
	
	@ResponseBody @RequestMapping(value="/andMyBonusList.sa", produces="text/html; charset=utf-8")
	public String andMyBonusList(int employee_id) {
		System.out.println("andMyBonusList");
		List<BonusVO> myBonusList = dao.andMyBonusList(employee_id);
		return gson.toJson(myBonusList);
	}
	
	@ResponseBody @RequestMapping(value="/andDepartments.sa", produces="text/html; charset=utf-8")
	public String departments() {
		List<DepartmentVO> list = emp_dao.departments();
		return gson.toJson(list);
	}
	@ResponseBody @RequestMapping(value="/andDepartment_name.sa", produces="text/html; charset=utf-8")
	public String andDepartment_name() {
		List<SalaryVO> list = dao.andDepartment_name();
		return gson.toJson(list);
	}
	
	@ResponseBody @RequestMapping(value="/andSalaryName.sa", produces="text/html; charset=utf-8")
	public String andSalaryName(String name) {
	
		List<SalaryVO> list = dao.andSalaryName(name);
		return gson.toJson(list);
		
	}
}
