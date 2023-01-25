
package com.hanul.berp;

import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import apply.ApplyVO;
import emp.EmpAndInsertDTO;
import emp.EmpVO;
import member.MemberDAO;
import recruit.CommonCodeVO;
import recruit.CompanyVO;
import recruit.RecruitDAO;
import recruit.RecruitVO;

@Controller
public class RecruitController {
	
	//@Autowired private MemberDAO member;
	@Autowired
	RecruitDAO dao;
	
	//첨부파일 다운로드 요청
		@ResponseBody @RequestMapping(value="/download.rec",produces="text/html; charset=utf-8")
		public String download(String recruit_num, String url, HttpServletRequest request
							, HttpServletResponse response) throws Exception{
			
			RecruitVO vo = dao.recruit_info(recruit_num);
			boolean download
			= fileDownload(vo.getFile_name(), vo.getFile_path(), request, response);
			
			if(!download) {
				
				StringBuffer msg = new StringBuffer("<script>");
				msg.append("alert('다운로드할 파일이 없습니다!'); location='")
				.append(url).append("';");
				msg.append("</script>");
				return msg.toString();
				
			}else
				return null;
			
			
		}

		public boolean fileDownload(String file_name, String file_path, HttpServletRequest request,
				HttpServletResponse response) throws Exception {

			file_path = file_path.replace(appURL(request), "d://app/" + request.getContextPath());

	//다운로드할 파일객체 생성		
			File file = new File(file_path);
			if (!file.exists())
				return false;

	//text/html, image/png,  xlxs, .....
			String mime = request.getSession().getServletContext().getMimeType(file_path);
			response.setContentType(mime);

			file_name = URLEncoder.encode(file_name, "utf-8");
			file_name = file_name.replaceAll("\\+", "%20");// .replaceAll("?", "%36");

			response.setHeader("content-disposition", "attachment; filename=" + file_name); // 첨부되어진 파일을 내려받도록 처리

			ServletOutputStream out = response.getOutputStream();
			FileCopyUtils.copy(new FileInputStream(file), out);
			out.flush();
			return true;
		}
		
	
	
	
	
	
	@RequestMapping("/delete.rec")
	public String delete(String recruit_num) {
		
		dao.delete(recruit_num);
		
		
		return "redirect:list.rec";
		
	}
	
	
	@RequestMapping("/update.rec")
	public String update(RecruitVO vo,String recruit_num
			,String file_name, MultipartFile file, HttpServletRequest request) throws Exception{
		
		RecruitVO recruit = dao.recruit_info(vo.getRecruit_num());

		
		if( file.isEmpty() ) {
			//첨부파일이 없는 경우
			if( file_name.isEmpty() ) {							
				attachedFile_delete(recruit.getFile_path(), request);
				
			}else {
				//파일명이 있는 경우
				//원래 첨부파일이 있었고, 그 파일을 그대로 사용하는 경우
				vo.setFile_name(recruit.getFile_name());
				vo.setFile_path(recruit.getFile_path());
				
			}
			
		}else {
			//첨부파일이 있는 경우
			vo.setFile_name( file.getOriginalFilename() );
			vo.setFile_path( fileUpload("recruit", file, request) );	
			
			//원래 첨부파일이 있었다면 물리적파일을 삭제
			attachedFile_delete( recruit.getFile_path(), request );
		}
		
		
		
		
		dao.recruit_update(vo);
		
		return "redirect:detail.rec?recruit_num=" + recruit_num;
	}
	
	
	
	@RequestMapping("/modify.rec")
	public String modify(Model model, String recruit_num) {
		RecruitVO vo = dao.recruit_info(recruit_num);
		List<CommonCodeVO> code = dao.recruit_pattern();
		List<CommonCodeVO> career = dao.recruit_career();
		List<CompanyVO> company = dao.recruit_pattern_company();

		model.addAttribute("vo", vo);
		model.addAttribute("code", code);
		model.addAttribute("career", career);
		model.addAttribute("company", company);	
		
		return "empty/recruit/modify";
	}
	
	@RequestMapping("/detail.rec")
	public String info(Model model, String recruit_num) {		
		
		
		
		model.addAttribute("com", dao.recruit_info_company(recruit_num));
		model.addAttribute("vo", dao.recruit_info(recruit_num));
		
		return "empty/recruit/detail";
	}

	@RequestMapping("/list.rec")
	public String recruitList(Model model
		, @RequestParam(defaultValue="all") String employee_pattern
			,HttpSession session
			) {
		//사원조회
		List<RecruitVO> recruit ;
		
		//코드 목록 조회
		List<CommonCodeVO> code = dao.recruit_pattern();

		//신입경력 코드목록조회
		//List<CommonCodeVO> code_career = dao.recruit_career();
	
		

		if(employee_pattern.equalsIgnoreCase("all")) {
			recruit = dao.recruit_list();
		}else {
			recruit = dao.recruit_list(employee_pattern);
		}

		/*
		if(career.equalsIgnoreCase("all")) {
			recruit = dao.recruit_list();
		}else {
			recruit = dao.recruit_list(career);
		}
		*/
		
		//model.addAttribute("com", dao.recruit_info_company_com());
		model.addAttribute("recruitList", recruit);
		model.addAttribute("code", code);
		//model.addAttribute("code_career", code_career);
		model.addAttribute("code_value", employee_pattern);
		//model.addAttribute("code_value", career);
		
		
		return "empty/recruit/list";
		//return "recruit/list";
	}
	
	@RequestMapping("/new.rec")
	public String board(Model model) {	
		List<CommonCodeVO> code = dao.recruit_pattern();
		List<CommonCodeVO> career = dao.recruit_career();
		List<CompanyVO> company = dao.recruit_pattern_company();
		List<RecruitVO> recruit = dao.recruit_list();
		
		model.addAttribute("code", code);
		model.addAttribute("career", career);
		model.addAttribute("company", company);		
		model.addAttribute("recruitList", recruit);
		
		return "empty/recruit/new";
	}
	
	@RequestMapping("/insert.rec")
	public String insert(RecruitVO vo, MultipartFile file, HttpServletRequest request) {
		// 첨부파일이 있는 경우
		if (!file.isEmpty()) {
			vo.setFile_name(file.getOriginalFilename());
			vo.setFile_path(fileUpload("recruit", file, request));
		}

		// 화면에서 입력한 정보를 DB에 신규저장한 후
		dao.recruit_insert(vo);
		// 응답화면연결
		return "redirect:list.rec";
	}

	// 파일업로드
	public String fileUpload(String category, MultipartFile file, HttpServletRequest request) {
		
		String path

				= "d://app" + request.getContextPath();

		
		String upload = "/upload/" + category + new SimpleDateFormat("/yyyy/MM/dd").format(new Date());

		
		path += upload;

		
		File folder = new File(path);
		if (!folder.exists())
			folder.mkdirs();

		// 업로드하는 파일명을 고유한 아이디를 붙여 저장한다: ajlh2348-ahflhq_abc.txt
		String file_name = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();

		try {
			file.transferTo(new File(path, file_name));
		} catch (Exception e) {
		}

		
		return appURL(request) + upload + "/" + file_name;
	}

	public String appURL(HttpServletRequest request) {
		
		return request.getRequestURL().toString().replace(request.getServletPath(), "");
	}
	//첨부되어진 물리적 파일 삭제
	public void attachedFile_delete(String file_path, HttpServletRequest request) {
		if (file_path != null) {
			
			file_path = file_path.replace(appURL(request), "d://app/" + request.getContextPath());
			File file = new File(file_path);
			if (file.exists())
				file.delete();
		}
	}
	
	////////////////////////////////////////////////////////////////////////////////
	@ResponseBody @RequestMapping(value="/andRecList.rec", produces="text/html; charset=utf-8")
	public String andRecList() {
		
		
		return new Gson().toJson(dao.and_rec_list());

	}
	@ResponseBody @RequestMapping(value="/andMyApplyList.rec", produces="text/html; charset=utf-8")
	public String andMyApplyList(String name) {
		
		
		return new Gson().toJson(dao.and_my_rec_list(name));

	}
	@ResponseBody @RequestMapping(value="/andApplySpinnerList.rec", produces="text/html; charset=utf-8")
	public String andApplySpinnerList() {
		
		
		return new Gson().toJson(dao.and_apply_spinnerList());

	}
	@ResponseBody @RequestMapping(value="/andApplyCareerSelect.rec", produces="text/html; charset=utf-8")
	public String andApplyCareerSelect(String career) {
		
		
		return new Gson().toJson(dao.and_apply_spinnerCareerList(career));

	}
	//관리자 부분
	@ResponseBody @RequestMapping(value="/andApplyCheckSelect.rec", produces="text/html; charset=utf-8")
	public String andApplyCheckSelect() {
		
		
		return new Gson().toJson(dao.and_apply_spinnerSelectList());

	}
	
	@ResponseBody @RequestMapping(value="/andApplyCheckSelectList.rec", produces="text/html; charset=utf-8")
	public String andApplyCheckSelectList() {
		
		
		return new Gson().toJson(dao.and_apply_spinnerSelectAllList());

	}
	
	@ResponseBody @RequestMapping(value="/andApplyCheckSelectOne.rec", produces="text/html; charset=utf-8")
	public String andApplyCheckSelectOne(String title) {
		
		
		return new Gson().toJson(dao.and_apply_spinnerSelectAllOne(title));

	}
		
	@ResponseBody @RequestMapping(value="/andApplyPassSelectList.rec", produces="text/html; charset=utf-8")
	public String andApplyPassSelectList() {
		
		
		return new Gson().toJson(dao.and_apply_spinnerSelectPassList());

	}
	
	@ResponseBody @RequestMapping(value="/andApplyPassSelectOne.rec", produces="text/html; charset=utf-8")
	public String andApplyPassSelectOne(String title) {
		
		
		return new Gson().toJson(dao.and_apply_spinnerSelectPassOne(title));

	}
	@ResponseBody @RequestMapping(value="/andApplyPassORFail.rec", produces="text/html; charset=utf-8")
	public void andApplyPassORFail(String phone, String check) {
		ApplyVO vo = new ApplyVO();
		vo.setApply_phone(phone);
		vo.setApply_check(check);
		
		dao.and_apply_PassORFail(vo);

	}
	
	
}
