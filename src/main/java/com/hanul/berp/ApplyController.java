package com.hanul.berp;

import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
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

import apply.ApplyDAO;
import apply.ApplyVO;
import emp.CompanyVO;
import emp.DepartmentVO;
import emp.EmpVO;
import emp.PatternVO;
import member.MemberVO;
import recruit.CommonCodeVO;
import recruit.RecruitVO;

@Controller
public class ApplyController {

	@Autowired ApplyDAO dao;
	
	//사원 저장처리
	@RequestMapping("/insert_em.apply")
	public String insert_em(EmpVO vo, int apply_num) {
		//저장후 삭제도 추가 
		dao.employee_insert(vo);
		dao.delete_pass(apply_num);
		
		return "redirect:pass_check.apply";
	}
	
	
	
	//사원등록화면
	@RequestMapping("/register_em.apply")
	public String register(int apply_num, Model model) {
		ApplyVO vo = dao.apply_info(apply_num);
		model.addAttribute("vo",vo);
		
		List<EmpVO> emp = dao.employee_list();
		List<DepartmentVO> departments = dao.departments();
		List<CompanyVO> company = dao.company();
		List<EmpVO> position = dao.position();
		List<PatternVO> pattern = dao.pattern();
		
		model.addAttribute("departments", departments);
		model.addAttribute("company", company);
		model.addAttribute("emp", emp);
		model.addAttribute("position", position);
		model.addAttribute("pattern",pattern);
		
		
		return "side/apply/register";
	}
	
	
	
	
	//첨부파일 다운로드 요청
	@ResponseBody @RequestMapping(value="/download.apply",produces="text/html; charset=utf-8")
	public String download(int apply_num, String url, HttpServletRequest request
						, HttpServletResponse response) throws Exception{
		
		ApplyVO vo = dao.apply_info(apply_num);
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
	
	
////////////////////////////////////////
	
	
	@RequestMapping("/pass.apply")
	public String pass (ApplyVO vo ,String file_name, MultipartFile file, 
			HttpServletRequest request, int apply_num, String apply_check) {
	
		
		//ApplyVO apply = dao.apply_info(vo.getApply_num());
	
		dao.apply_update_check(apply_num, apply_check);
		
		
		return "redirect:applicantList.apply";
		
	}
	
	
	
	@RequestMapping("/check.apply") 
	public String admin_check(int apply_num, Model model) {
		ApplyVO vo = dao.apply_info(apply_num);
		model.addAttribute("vo",vo);
		
		
		return "side/apply/check";
	}
	
	
	
	@RequestMapping("/pass_check.apply")
	public String pass_checkList(Model model, @RequestParam(defaultValue="all") String recruit_num) {
		
		//지원자 조회
		List<ApplyVO> applicants;
		
		//채용공고 번호 조회
		List<apply.RecruitVO> recruit_list = dao.recruit_num();
		
		
		if(recruit_num.equalsIgnoreCase("all")) {
			//전체 지원자 리스트 조회recruits = 
			applicants = dao.pass_list();
		}else {
			//s선택
			applicants = dao.pass_list(recruit_num);
		}
		
		model.addAttribute("applicants", applicants);
		model.addAttribute("recruit_list", recruit_list);
		model.addAttribute("recruit_num", recruit_num);
		
		
		return "side/apply/pass_check";
	}
	
	@RequestMapping("/applicantList.apply")
	public String applicantList(Model model
			, @RequestParam(defaultValue="all") String recruit_num
			, @RequestParam(defaultValue="all") String apply_check
			
			) {
		
		//지원자 조회
		List<ApplyVO> applicants;
		
		//채용공고 번호 조회
		List<apply.RecruitVO> recruit_list = dao.recruit_num();
		//합불합
		List<ApplyVO> pass_list = dao.pass();
		
		
		
		
		if(recruit_num.equalsIgnoreCase("all")) {
			if(apply_check.equalsIgnoreCase("all")) {
				//전체 지원자 리스트 조회recruits = 
				applicants = dao.applicant_list();				
			}else {
				applicants = dao.applicant_list_check(apply_check);
			}
		}else{
			if(apply_check.equalsIgnoreCase("all")) {
				applicants = dao.applicant_list(recruit_num);
			}else {
				applicants = dao.applicant_list(recruit_num, apply_check);
				
			}
			//s선택
			//applicants = dao.applicant_list(recruit_num);
		}
		
		model.addAttribute("applicants", applicants);
		model.addAttribute("recruit_list", recruit_list);
		model.addAttribute("pass_list", pass_list);
		model.addAttribute("recruit_num", recruit_num);
		model.addAttribute("apply_check", apply_check);
		
		
		return "side/apply/applicantList";
	}

	@RequestMapping("/update.apply")
	public String update (ApplyVO vo ,String file_name, MultipartFile file, 
			HttpServletRequest request, int apply_num
			, MultipartFile pic_name, String pic_file_name
			) throws Exception {
		
		ApplyVO apply = dao.apply_info(vo.getApply_num());
		
		if( file.isEmpty() ) {
			//첨부파일이 없는 경우
			if( file_name.isEmpty() ) {							
				attachedFile_delete(apply.getFile_path(), request);
				
			}else {
				//파일명이 있는 경우
				//원래 첨부파일이 있었고, 그 파일을 그대로 사용하는 경우
				vo.setFile_name(apply.getFile_name());
				vo.setFile_path(apply.getFile_path());
				
			}
			
		}else {
			//첨부파일이 있는 경우
			vo.setFile_name( file.getOriginalFilename() );
			vo.setFile_path( fileUpload("apply", file, request) );	
			
			//원래 첨부파일이 있었다면 물리적파일을 삭제
			attachedFile_delete( apply.getFile_path(), request );
		}
		//////////////시작/////////////////사진
		if( pic_name.isEmpty() ) {
			//첨부파일이 없는 경우
			if( pic_file_name.isEmpty() ) {							
				attachedFile_delete_pic(apply.getApply_pic_path(), request);
				
			}else {
				//파일명이 있는 경우
				//원래 첨부파일이 있었고, 그 파일을 그대로 사용하는 경우
				vo.setApply_pic_name(apply.getApply_pic_name());
				vo.setApply_pic_path(apply.getApply_pic_path());
				
				
			}
			////////////////★ㅁ/ㅁ/★★★★
		}else {
			//첨부파일이 있는 경우
			vo.setApply_pic_name(pic_name.getOriginalFilename());
			vo.setApply_pic_path(fileUpload_pic("apply",pic_name, request));
			
			
			
			//원래 첨부파일이 있었다면 물리적파일을 삭제
			attachedFile_delete_pic( apply.getApply_pic_path(), request );
		}
		
		dao.apply_update(vo);
		
		
		return "redirect:detail.apply?apply_num=" +apply_num;
		
	}
	
	@RequestMapping("/modify.apply")
	public String modify_apply(int apply_num, Model model) {
		ApplyVO vo = dao.apply_info(apply_num);
		model.addAttribute("vo",vo);
		
		
		return "empty/apply/modify";
	}

	@ResponseBody @RequestMapping("/phone_check")
	public boolean id_check(String apply_phone) {
		//아이디가 db에 존재하는지 확인한 후 : 
		//1이면 사용불가(중복/false),0사용가넝(true)
			
		//true/false로 반환 
		
		return dao.apply_phone_check(apply_phone)==1 ? false:true;
		
	}
	
	@ResponseBody
	@RequestMapping("/application_detail") // ★ResponseBody
	public Object login(String apply_phone, String apply_pw, HttpSession session) {
				
		ApplyVO vo = dao.apply_info(apply_phone, apply_pw);
				
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("apply_num", vo == null? null : vo.getApply_num());
				map.put("exist", vo == null ? false : true);
		return map;

	}
		
	//화면요청
	@RequestMapping("/application.apply")
	public String application( Model model) {
				
		return "apply/application_check";
	}
	
	
	@RequestMapping("/delete.apply")
	public String delete(int apply_num) {
		dao.delete(apply_num);
		
		return "redirect:applyList.apply";
	}
	
	  
	@RequestMapping("/detail.apply") 
	public String detail (int apply_num,Model model) {
	 
		
		ApplyVO vo = dao.apply_info(apply_num);
		 
		 model.addAttribute("vo",vo);
		  
	 return "empty/apply/detail"; 
	  
	}
	 
	
	@RequestMapping("/applyList.apply")
	public String recruitList(Model model, @RequestParam(defaultValue="all") String employee_pattern) {
		//사원조회
		List<RecruitVO> recruit ;
		
		//코드 목록 조회
		List<CommonCodeVO> code = dao.recruit_pattern();

		if(employee_pattern.equalsIgnoreCase("all")) {
			recruit = dao.recruit_list();
		}else {
			recruit = dao.recruit_list(employee_pattern);
		}
		
		
		model.addAttribute("recruitList", recruit);
		model.addAttribute("code", code);
		model.addAttribute("code_value", employee_pattern);
		
		
		return "empty/apply/applyList";
	}
	/////////////////////////////////////이력서 첨부파일/////////////////////////////////////////////////
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
		/////////////////////////////증명사진 첨부파일 11.23. 추가////////////////////////
		// 파일업로드
		public String fileUpload_pic(String category, MultipartFile pic_name, HttpServletRequest request) {
			
			String path

					= "d://app" + request.getContextPath();			
			String upload = "/upload/" + category + new SimpleDateFormat("/yyyy/MM/dd").format(new Date());
	
			path += upload;
			
			File folder = new File(path);
			if (!folder.exists())
				folder.mkdirs();

			// 업로드하는 파일명을 고유한 아이디를 붙여 저장한다: ajlh2348-ahflhq_abc.txt
			String pic_file_name = UUID.randomUUID().toString() + "_" + pic_name.getOriginalFilename();
			try {
				pic_name.transferTo(new File(path, pic_file_name));
			} catch (Exception e) {
			}
			
			return appURL(request) + upload + "/" + pic_file_name;
		}

		
		//첨부되어진 물리적 파일 삭제
		public void attachedFile_delete_pic(String apply_pic_path, HttpServletRequest request) {
			if (apply_pic_path != null) {
				
				apply_pic_path = apply_pic_path.replace(appURL(request), "d://app/" + request.getContextPath());
				File pic_name = new File(apply_pic_path);
				if (pic_name.exists())
					pic_name.delete();
			}
		}
		
	///////////////////////////////이력서 이미지 끝////////////	
	
		 
		  @RequestMapping("/insert.apply")	
	public String insert( String recruit_num,RecruitVO recruit 
			,Model model ,ApplyVO vo, HttpServletRequest request
			, MultipartFile file, MultipartFile pic_name
			
			) {
		
			//  if(file[].)
			  
		// 첨부파일이 있는 경우
		if (!file.isEmpty()) {
			vo.setFile_name(file.getOriginalFilename());
			vo.setFile_path(fileUpload("apply", file, request));
			
			
			/*
			if(file.getName().equals("file_pic")) {
				vo.setApply_pic_name(file.getOriginalFilename());
				vo.setFile_path(fileUpload("apply_pic", file, request));
			
			}*/
		
		}
		if(!pic_name.isEmpty()) {
			vo.setApply_pic_name(pic_name.getOriginalFilename());
			vo.setApply_pic_path(fileUpload_pic("apply", pic_name, request));
		}
		
		
		
		
		
		
		dao.apply_insert(vo);
		int apply_num = dao.currval();		
		//String apply_phone = vo.getApply_phone();
		//String apply_pw = vo.getApply_pw();
		//int apply_num = vo.getApply_num();
		
		
		return "redirect:detail.apply?apply_num="+apply_num;
		//return "redirect:detail.apply?apply_phone=" + apply_phone+"&apply_pw="+apply_pw;
		
	}
	
	
	@RequestMapping("/fillout.apply")
	public String fillout(String recruit_num,String recruit_title, 
			 Model model) {
		
		
		//vo.setRecruit_num(recruit.get)
		//model.addAttribute("recruit",recruit);
		apply.RecruitVO recruit = dao.recruit_info(recruit_num);
		model.addAttribute("recruit",recruit);
		
		return "empty/apply/fillout";
	}
	
		 ////////////////////////////////////////////////////
 
}
