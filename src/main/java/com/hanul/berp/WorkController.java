package com.hanul.berp;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import emp.DepartmentVO;
import emp.EmpVO;
import work.CommonCodeVO;
import work.HolidayResultVO;
import work.HolidayVO;
import work.WorkDAO;
import work.WorkResultVO;
import work.WorkVO;

@Controller
public class WorkController {
	@Autowired
	WorkDAO dao;
	Gson gson = new GsonBuilder()
	.setDateFormat("yyyy-MM-dd").create();


	@RequestMapping("/work")
	public String work_list( Model model, HttpSession session ) {


		EmpVO vo = (EmpVO) session.getAttribute("loginInfo");
		
		vo = dao.empInfo(vo.getEmployee_id());
		model.addAttribute("vo", vo);

		WorkVO wVo = dao.workInfo(vo.getEmployee_id());
		model.addAttribute("wVo", wVo);

	
		List<WorkResultVO> workList = dao.workResult(vo.getEmployee_id());
		
		model.addAttribute("workList",workList); 
		
	

		return "side/work/work";
	}

	// 퇴근 버튼 눌렀을 때 시간 update
	@ResponseBody
	@RequestMapping("/work_end_input")
	public String work_end_input(Model model,HttpSession session, String end_work) {
		
		EmpVO vo = (EmpVO) session.getAttribute("loginInfo");
		
		vo = dao.empInfo(vo.getEmployee_id());
		
		
		dao.work_end_input(end_work, vo.getEmployee_id());
		
		
		

		return "work";
	}


	//출근버튼 눌렀을 때 시간 insert
	
	@ResponseBody
	@RequestMapping("/work_start_input")
	public String work_start_input(String start_work,HttpSession session, Model model
			)  {
		EmpVO vo = (EmpVO) session.getAttribute("loginInfo");
		
		try {
			
			dao.work_start_input(start_work, vo.getEmployee_id(), vo.getDepartment_id(), vo.getCompany_cd());	
		} catch (Exception e) {
			
		}
		
		
		return "work";
	
	}
	

	@RequestMapping("/holiday")
	public String holiday(String id, Model model, HttpSession session ) {
		EmpVO vo = (EmpVO) session.getAttribute("loginInfo");
		vo = dao.empInfo(vo.getEmployee_id());
		model.addAttribute("vo",vo);
		
		
		
		List<WorkResultVO> holiday_list = dao.holiday_list(vo.getEmployee_id());
		
		model.addAttribute("holiday_list",holiday_list); 
		
		List<CommonCodeVO> codeList = dao.codeList();
		
		model.addAttribute("codeList", codeList);
		
		List<HolidayVO> hoList = dao.holidayList(vo.getEmployee_id());
		
		model.addAttribute("hoList", hoList);
		
		
		List<HolidayResultVO> holiday_submit_list = dao.holiday_submit_list(vo.getEmployee_id());
		
		model.addAttribute("holiday_submit_list",holiday_submit_list);
		
		
		
		
		return "side/work/holiday";
	}
	
	
	@RequestMapping("/holiday_submit")
	public String holiday_submit(HttpSession session,String start_holiday, String end_holiday, String work_code) {
		
		 EmpVO vo = (EmpVO) session.getAttribute("loginInfo"); vo =
		  dao.empInfo(vo.getEmployee_id());
				
		
		System.out.println(start_holiday);
		System.out.println(end_holiday);
		System.out.println(work_code);
		System.out.println("ajax submit");
		
	
			dao.holiday_submit(start_holiday,end_holiday,vo.getEmployee_id(),vo.getDepartment_id(),vo.getCompany_cd(),work_code);			
		
		
		
		
		return "side/work/holiday";
	}
	
	
	
	@RequestMapping("/workList")
	public String work_list(Model model, @RequestParam(defaultValue = "-1")  int department_id,
			String work_date) {
		
		List<WorkResultVO> workList = null;
//		
		//model.addAttribute("workList",workList);
	
		
		//dao.rList();
		
		if( department_id == -1) {
			workList = dao.rList();
		}else {			
			workList = dao.department_work(department_id, work_date);
		}
		List<emp.DepartmentVO> departments = dao.departments();
		model.addAttribute("departments",departments);
		model.addAttribute("department_id", department_id);
		
		model.addAttribute("workList",workList);
		model.addAttribute("work_date" , work_date);
		
		return "side/work/workList";
	}
	/* =======================안드로이드 ====================== */
	
	@ResponseBody @RequestMapping(value="/andWorkList",
	produces="text/html; charset=utf-8") public String andWorkList() {
	
	List<WorkResultVO> list = dao.rList(); 
	return gson.toJson(list); }
	
	
	
		//출근버튼 눌렀을 때 시간 insert
		
		@ResponseBody
		@RequestMapping("/andWork_start_input")
		public String andWork_start_input(String dto)  {
	
			WorkVO vo =  new Gson().fromJson(dto, WorkVO.class);
			
			return dao.andWork_start_input(vo)+"";
	
		}
		@ResponseBody
		@RequestMapping("/andWork_end_input")
		public String andWork_end_input(String dto)  {
			
			WorkVO vo =  new Gson().fromJson(dto, WorkVO.class);
			System.out.println(vo.getEnd_work());
			System.out.println(vo.getEmployee_id());
			
			return dao.andWork_end_input(vo)+"";
			
		}
		@ResponseBody @RequestMapping(value="/andHoliday", produces="text/html; charset=utf-8")
		public String andHoliday(String vo) {
			HolidayVO dto =  new Gson().fromJson(vo, HolidayVO.class);
			
			try {
				return dao.andHoliday(dto)+"";
			} catch (Exception e) {
				return "1";
			}
			
	}

		
		@ResponseBody @RequestMapping(value="/andHolidayList", produces="text/html; charset=utf-8")
		public String andHolidayList()  {
			
			Gson gson2 = new GsonBuilder()
					.setDateFormat("yy년MM월dd일").create();
			
			return gson2.toJson(dao.holidayAllList());
			
			
		}
		@ResponseBody @RequestMapping(value="/andSearch", produces="text/html; charset=utf-8")
		public String andSearch(int employee_id) {
			
		
			
			return gson.toJson(dao.search(employee_id));
		}
		
		
		
		@ResponseBody @RequestMapping(value="/andEndSearch", produces="text/html; charset=utf-8")
		public String andEndSearch(int employee_id) {
			
			
			return gson.toJson(dao.andEndSearch(employee_id));
		}
		
		
		
		
		@ResponseBody @RequestMapping(value="/andWorkDept", produces="text/html; charset=utf-8")
		public String andWorkDept() {
		
			List<DepartmentVO> list = dao.departments();
			return gson.toJson(list);
		}

		
		@ResponseBody @RequestMapping(value="/andWorkDeptList",
		produces="text/html; charset=utf-8") public String andWorkDeptList(int department_id , String work_date) { 
			System.out.println(department_id);
			System.out.println(work_date);
		
		return gson.toJson(dao.department_work(department_id, work_date));
		}
		
		@ResponseBody @RequestMapping(value="/andCode", produces="text/html; charset=utf-8")
		public String andCode() {
			
			List<CommonCodeVO> list = dao.andCode();
			
			return gson.toJson(list);
		}
		@ResponseBody @RequestMapping(value="/andHolidaySearch", produces="text/html; charset=utf-8")
		public String andHolidaySearch(String vo) {
			HolidayVO dto =  new Gson().fromJson(vo, HolidayVO.class);
			//
			return gson.toJson(dto);
		}
		
		@ResponseBody @RequestMapping(value="/andHoliday_List", produces="text/html; charset=utf-8")
		public String andHoliday_List() {
			
			
			return gson.toJson(dao.andHoliday_List());
			
		}
		@ResponseBody @RequestMapping(value="/andHolidayDept_List", produces="text/html; charset=utf-8")
		public String andHolidayDept_List(int department_id) {
			
			
			return gson.toJson(dao.andHolidayDept_List(department_id));
			
		}
		
		@ResponseBody @RequestMapping(value="/andHolidayIndi_List", produces="text/html; charset=utf-8")
		public String andHolidayIndi_List(int employee_id) {
			List<WorkResultVO> list = dao.andHolidayIndi_List(employee_id);
			Gson gson2 = new GsonBuilder()
					.setDateFormat("yy년MM월dd일").create();
			return gson2.toJson(list);		
		}
		@ResponseBody @RequestMapping(value="/findToday", produces="text/html; charset=utf-8")
		public String findToday(int employee_id) {
			WorkVO list = dao.findToday(employee_id);
			
			if(list.equals("")) {
				return "1";
			}
			
			
			return gson.toJson(list);		
		}
		
		
}
