package com.hanul.berp;



import java.lang.reflect.Array;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;


import approval.And_Ing_tableVO;
import approval.ApprovalDAO;
import approval.FileUtility;
import approval.Ing_tableVO;
import approval.Result_tableVO;
import emp.EmpDAO;
import emp.PatternVO;
import notice.NoticeVO;
import work.CommonCodeVO;

@Controller
public class ApprovalController {
	@Autowired ApprovalDAO dao;
	@Autowired EmpDAO emp_dao;
	@Autowired FileUtility fileUtility;
	
	//상신함 뷰
	@RequestMapping("/submitList.ap")
	public String submitList(int employee_id, Model model) {
		model.addAttribute("submitList", dao.submitList(employee_id));
		model.addAttribute("employee_id", employee_id);
		return "side/approval/submitList";
	}
	
	//보관함 뷰
	@RequestMapping("/lockerList.ap")
	public String lockerList(int employee_id, Model model) {
		model.addAttribute("lockerList", dao.lockerList(employee_id));
		model.addAttribute("employee_id", employee_id);
		return "side/approval/lockerList";
	}
	
	//보관함 디테일에서 취소 시 삭제
	@ResponseBody
	@RequestMapping(value="/deleteLockerList.ap",
				produces="text/html; charset=utf8")
	public String deleteLockerList(int employee_id, String url, 
								Model model, int ing_no, int no, HttpServletRequest req) {
		
		Ing_tableVO locker = dao.lockerListDetail(no, employee_id);
		fileUtility.deleteFile(locker.getFile_path(), req);
		
		if(dao.deleteIng(ing_no)==1) {
			StringBuffer msg = new StringBuffer("<script>");
			msg.append("alert('삭제했습니다.'); location='")
				.append(url).append("?employee_id=").append(employee_id).append("'");
			msg.append("</script>");
			return msg.toString();
		}
		return null;
	}
	
	
	
	//수신함 뷰
	@RequestMapping("/receiveList.ap")
	public String receiveList(int employee_id, Model model) {
		model.addAttribute("receiveList", dao.receiveList(employee_id));
		model.addAttribute("employee_id", employee_id);
		return "side/approval/receiveList";
	}
	//결재함 뷰
	@RequestMapping("/approvalList.ap")
	public String approvalList(int employee_id, Model model,
			@RequestParam(defaultValue = "-1")String code_value) {
		
		model.addAttribute("employee_id", employee_id);
		model.addAttribute("documentCheckAll", dao.document_check());
		model.addAttribute("code_value", code_value);
		
		if(code_value.equals("-1")) {
			model.addAttribute("approvalList", dao.approvalList(employee_id));
			
		}else {
			model.addAttribute("approvalList", dao.approvalList(employee_id, code_value));
		}
		
		return "side/approval/approvalList";
	}
	
	//상신함에서 작성 버튼
	@RequestMapping("/post_department")
	public String post(Model model, String department_name, int employee_id) {
		
		if( !department_name.equals("부서") ) 
			model.addAttribute("departmentEmployee", dao.departmentEmployee(department_name, employee_id));
		
		return "approval/department/approver_list";
	}
			
	
	//상신함에서 작성 버튼
	@RequestMapping("/post.ap")
	public String post(Model model, Ing_tableVO vo, int employee_id, 
			@RequestParam(defaultValue = "-1") int ing_no, HttpServletRequest request,
			MultipartFile file,
			@RequestParam(defaultValue = "부서") String department_name) {
		
//		if( ! file.isEmpty() ) {
//			vo.setFile_name( file.getOriginalFilename() );
//			vo.setFile_path( fileUtility.fileUpload("approval", file, request) );
//		}

		if( !department_name.equals("부서")) 
			model.addAttribute("departmentEmployee", dao.departmentEmployee(department_name, employee_id));
		
		model.addAttribute("document_title", vo.getDocument_title());
		model.addAttribute("document_content", vo.getDocument_content());
		
		model.addAttribute("departments", emp_dao.departments());
		model.addAttribute("department_name", department_name);
		model.addAttribute("ing_no", ing_no);
		return "side/approval/post";
	}
	
	//상신함 저장
	@ResponseBody
	@RequestMapping(value="/insertPost.ap", produces="text/html; charset=utf8")
	public String insertPost(Ing_tableVO vo, int employee_id, String url, MultipartFile file, 
			HttpServletRequest request, String file_name,
			@RequestParam(defaultValue = "-1") int ing_no) {
		
		
		
		if( ! file.isEmpty() ) {
			vo.setFile_name( file.getOriginalFilename() );
			vo.setFile_path( fileUtility.fileUpload("approval", file, request) );
		}
		
		dao.deleteIng(ing_no);
		
		if(dao.insertPost(vo)==1 && dao.insertResult(vo)==1) {
			StringBuffer msg = new StringBuffer("<script>");
			msg.append("alert('제출했습니다.'); location='")
				.append(url).append("?employee_id=").append(employee_id).append("'");
			msg.append("</script>");
			return msg.toString();
		}
		
		return null;
	}
	
	//임시보관 중인 문서를 상신함과 결재함에 업로드
	//임시보관함 삭제 후 상신함 저장-결재함 저장
	@ResponseBody
	@RequestMapping(value="/deleteInsertSubmit.ap", produces="text/html; charset=utf8")
	public String deleteInsertSubmit(Ing_tableVO vo, int employee_id, String url, String file_name,
			int ing_no, MultipartFile file, HttpServletRequest request) {
			
//		if( ! file.isEmpty() ) {
//			vo.setFile_name( file.getOriginalFilename() );
//			vo.setFile_path( fileUtility.fileUpload("approval", file, request) );
//		}
		
		Ing_tableVO locker = dao.lockerListDetail(vo.getNo(), vo.getEmployee_id());
		
		//임시보관함에서 다시 제출한 문서에
		//첨부파일이 없으면,
		if( file.isEmpty() ) {

			//파일명이 없는 경우는 사용자가 뷰에서 업로드하지 않겠다고 삭제한 경우
			if( file_name.isEmpty() ) {
				fileUtility.deleteFile(vo.getFile_path(), request);
				
			}else {
				//파일명이 있는 경우
				//원래 첨부파일이 있었고, 그 파일을 그대로 사용하는 경우
				vo.setFile_name( locker.getFile_name() );
				vo.setFile_path( locker.getFile_path() );
			}
			
		}else {
			//첨부파일이 있는 경우
			vo.setFile_name( file.getOriginalFilename() );
			vo.setFile_path( fileUtility.fileUpload("approval", file, request) );	
			
			//원래 첨부파일이 있었다면 물리적파일을 삭제
			fileUtility.deleteFile(locker.getFile_path(), request);
		}
		
		if(dao.deleteIng(ing_no)==1 && dao.insertPost(vo)==1 && dao.insertResult(vo)==1) {
			
			StringBuffer msg = new StringBuffer("<script>");
			msg.append("alert('제출했습니다.'); location='")
				.append(url).append("?employee_id=").append(employee_id).append("'");
			msg.append("</script>");
			return msg.toString();
		}
		return null;
	}
	
	//임시보관함 저장(새로 작성 중이던 문서 취소)
	@RequestMapping("/insertLocker.ap")
	public String insertLocker(Ing_tableVO vo, int employee_id,
			MultipartFile file, HttpServletRequest request) {
		
		if( ! file.isEmpty() ) {
			vo.setFile_name( file.getOriginalFilename() );
			vo.setFile_path( fileUtility.fileUpload("approval", file, request) );
		}
		
		
				
		dao.insertLocker(vo);
		return "redirect:lockerList.ap?employee_id="+employee_id;
	}
	
	//임시보관함 저장(임시보관함에 있던 문서 다시 업로드 취소 후 저장)
	@ResponseBody
	@RequestMapping(value="/deleteInsertLocker.ap", 
					produces="text/html; charset=utf8")
	public String deleteInsertLocker(Ing_tableVO vo, String url, int ing_no, int employee_id, String file_name,
			int no, MultipartFile file, HttpServletRequest request) {
		//Ing_tableVO vo = dao.lockerListDetail(no, employee_id);
		
		Ing_tableVO locker = dao.lockerListDetail(vo.getNo(), vo.getEmployee_id());
		
		//임시보관함에서 다시 제출한 문서에
		//첨부파일이 없으면,
		if( file.isEmpty() ) {

			//파일명이 없는 경우는 사용자가 뷰에서 업로드하지 않겠다고 삭제한 경우
			if( file_name.isEmpty() ) {
				fileUtility.deleteFile(locker.getFile_path(), request);
				
			}else {
				//파일명이 있는 경우
				//원래 첨부파일이 있었고, 그 파일을 그대로 사용하는 경우
				vo.setFile_name( locker.getFile_name() );
				vo.setFile_path( locker.getFile_path() );
			}
			
		}else {
			//첨부파일이 있는 경우
			vo.setFile_name( file.getOriginalFilename() );
			vo.setFile_path( fileUtility.fileUpload("approval", file, request) );	
			
			//원래 첨부파일이 있었다면 물리적파일을 삭제
			fileUtility.deleteFile(locker.getFile_path(), request);
		}
		
		if(dao.deleteIng(ing_no)==1 && dao.insertLocker(vo)==1) {
								
			StringBuffer msg = new StringBuffer("<script>");
			msg.append("alert('저장했습니다.'); location='")
				.append(url).append("?employee_id=").append(employee_id).append("'");
			msg.append("</script>");
			return msg.toString();
		}
		return null;
	}
	
	//상신함 목록 중 제목 클릭시 상세화면
	@RequestMapping("/submitListDetail.ap")
	public String submitListDetail(int no, int employee_id, Model model) {
		model.addAttribute("submitListDetail", dao.submitListDetail(no, employee_id));
		model.addAttribute("employee_id", employee_id);
		return "side/approval/submitListDetail";
	}
	
	//보관함 목록 중 제목 클릭시 상세화면
	@RequestMapping("/lockerListDetail.ap")
	public String lockerListDetail(Model model, int no, int ing_no,  
			@RequestParam(defaultValue = "부서")String department_name, int employee_id) {
		
		//model.addAttribute("lockerListDetail", dao.lockerListDetail(no, employee_id));
		Ing_tableVO vo = dao.lockerListDetail(no, employee_id);
		model.addAttribute("lockerListDetail", vo);
		model.addAttribute("departments", emp_dao.departments());
		 
		return "side/approval/lockerListDetail";
	}
	
	//보관함 목록 중 제목 클릭시 상세화면2
	@RequestMapping("/lockerListDetailTwo.ap")
	public String lockerListDetailTwo(Model model, Ing_tableVO vo, 
			@RequestParam(defaultValue = "부서")String department_name) {
//	public String lockerListDetailTwo(Model model, int no, int ing_no, String document_title, String document_content, 
//			@RequestParam(defaultValue = "부서")String department_name, int employee_id) {
		
		model.addAttribute("lockerListDetail", vo);
		model.addAttribute("departments", emp_dao.departments());
		
		if(department_name != "부서") 
			model.addAttribute("departmentEmployee", dao.departmentEmployee(department_name, vo.getEmployee_id()));	
		
		model.addAttribute("department_name", department_name);
		
		
		return "side/approval/lockerListDetail";
	}
	
//	//보관함 목록 중 제목 클릭시 상세화면
//	@RequestMapping("/lockerListDetail.ap")
//	public String lockerListDetail(Model model, int employee_id, int no, int ing_no,
//			@RequestParam(defaultValue = "부서") String department_name ) {
//		
//		if(department_name != "부서") 
//			model.addAttribute("departmentEmployee", dao.departmentEmployee(department_name, employee_id));
//		
//		
//		model.addAttribute("department_name", department_name);
//		
//		Ing_tableVO vo = dao.lockerListDetail(no, employee_id);
//		model.addAttribute("document_content", vo.getDocument_content());
//		model.addAttribute("document_title", vo.getDocument_title());
//		model.addAttribute("employee_id", employee_id);
//		model.addAttribute("departments", emp_dao.departments());
//		model.addAttribute("ing_no", ing_no);
//		
//		return "side/approval/lockerListDetail";
//	}
	
	//수신함 목록 중 제목 클릭시 상세화면
	@RequestMapping("/receiveListDetail.ap")
	public String receiveListDetail(int no, int employee_id, Model model, String document_check) {
		model.addAttribute("receiveListDetail", dao.receiveListDetail(no, employee_id));
		model.addAttribute("employee_id", employee_id);
		model.addAttribute("document_checks", dao.document_checks());
		model.addAttribute("document_check", document_check);
		return "side/approval/receiveListDetail";
	}
	
	//수신함에서 처리하면 result_table에 저장
	@ResponseBody
	@RequestMapping(value="/insertResultEnd.ap", produces="text/html; charset=utf8")
	public String insertResultEnd(Ing_tableVO vo, String url, int ing_no){
		if(dao.insertResultEnd(vo) == 1 && dao.deleteIng(ing_no)==1) {
			StringBuffer msg = new StringBuffer("<script>");
			msg.append("alert('처리 완료.'); location='")
				.append(url).append("?employee_id=").append(vo.getApprover_id()).append("'");
			msg.append("</script>");
			return msg.toString();
		}
		return null;
	}
	
	//결재함 목록 중 제목 클릭시 상세화면
	@RequestMapping("/approvalListDetail.ap")
	public String approvalListDetail(int no, int employee_id, Model model) {
		model.addAttribute("approvalListDetail", dao.approvalListDetail(no, employee_id));
		model.addAttribute("employee_id", employee_id);
		return "side/approval/approvalListDetail";
	}
	
	//보관함 리스트에서 체크박스로 다수 게시글 한꺼번에 삭제
	@ResponseBody
	@RequestMapping(value="/deleteLocker.ap", produces="text/html; charset=utf8")
	public String deleteLocker(String[] deleteCheck, String url, int employee_id) {
		if(dao.deleteLocker(deleteCheck) == deleteCheck.length) {		//보낸 int[]를 편하게 String[]으로 받는다
			StringBuffer msg = new StringBuffer("<script>");
			msg.append("alert('삭제 완료.'); location='")
				.append(url).append("?employee_id=").append(employee_id).append("'");
			msg.append("</script>");
 			return msg.toString();
		}
		return null;		
	}
	
	@ResponseBody @RequestMapping(value="/downloadSubmit.ap"
			, produces="text/html; charset=utf-8")
	public String downloadSubmit(int no, int employee_id, String url, HttpServletRequest request
			, HttpServletResponse response) throws Exception{
		
		Ing_tableVO vo = dao.submitListDetail(no, employee_id);
		
		boolean download 
		=fileUtility.fileDownload(vo.getFile_name(), vo.getFile_path(), request, response);
		
		if( !download ) {
			
			StringBuffer msg = new StringBuffer("<script>");
			msg.append("alert('다운로드할 파일이 없습니다!'); location='")
				.append(url).append("'; ");
			msg.append("</script>");
			return msg.toString();
		}else
			return null;
	}
	
	@ResponseBody @RequestMapping(value="/downloadApproval.ap"
			, produces="text/html; charset=utf-8")
	public String downloadApproval(int no, int employee_id, String url, HttpServletRequest request
			, HttpServletResponse response) throws Exception{
		
		Result_tableVO vo = dao.approvalListDetail(no, employee_id);
		
		boolean download 
		=fileUtility.fileDownload(vo.getFile_name(), vo.getFile_path(), request, response);
		
		if( !download ) {
			
			StringBuffer msg = new StringBuffer("<script>");
			msg.append("alert('다운로드할 파일이 없습니다!'); location='")
				.append(url).append("'; ");
			msg.append("</script>");
			return msg.toString();
		}else
			return null;
	}
	
	@ResponseBody @RequestMapping(value="/downloadReceive.ap"
			, produces="text/html; charset=utf-8")
	public String downloadReceive(int no, int employee_id, String url, HttpServletRequest request
			, HttpServletResponse response) throws Exception{
		
		Ing_tableVO vo = dao.receiveListDetail(no, employee_id);
		
		boolean download 
		=fileUtility.fileDownload(vo.getFile_name(), vo.getFile_path(), request, response);
		
		if( !download ) {
			
			StringBuffer msg = new StringBuffer("<script>");
			msg.append("alert('다운로드할 파일이 없습니다!'); location='")
				.append(url).append("'; ");
			msg.append("</script>");
			return msg.toString();
		}else
			return null;
	}
	
	@ResponseBody @RequestMapping(value="/downloadLocker.ap"
			, produces="text/html; charset=utf-8")
	public String downloadLocker(int no, int employee_id, String url, HttpServletRequest request
			, HttpServletResponse response) throws Exception{
		
		Ing_tableVO vo = dao.lockerListDetail(no, employee_id);
		
		boolean download 
		=fileUtility.fileDownload(vo.getFile_name(), vo.getFile_path(), request, response);
		
		if( !download ) {
			
			StringBuffer msg = new StringBuffer("<script>");
			msg.append("alert('다운로드할 파일이 없습니다!'); location='")
				.append(url).append("'; ");
			msg.append("</script>");
			return msg.toString();
		}else
			return null;
	}
	
	// ========================================== 안드 ====================================================


			///////////앤드로이ㄷㄷㄷ/////////////



	@ResponseBody @RequestMapping(value="/andTempList", produces="text/html; charset=utf-8")
	public String andTempList() {
		Gson gson = new Gson();
		return gson.toJson(dao.andTempList());
	}
	@ResponseBody @RequestMapping(value="/andTempSubmit", produces="text/html; charset=utf-8")
	public String andTempSubmit(int ing_no) {
		
		return dao.andTempUpdate(ing_no)+"";
	}
	@ResponseBody @RequestMapping(value="/andTempDelete", produces="text/html; charset=utf-8")
	public String andTempDelete(int ing_no) {
		
		return dao.andTempDelete(ing_no)+"";
	}
	@ResponseBody @RequestMapping(value="/andTempModify", produces="text/html; charset=utf-8")
	public String andTempModify(String vo) {
		Gson gson = new Gson();
		Ing_tableVO dto = gson.fromJson(vo,Ing_tableVO.class);
		
		
		return dao.andTempModify(dto.getDocument_title(),dto.getDocument_content(), dto.getIng_no())+"";
	}
	@ResponseBody @RequestMapping(value="/andTempListOne", produces="text/html; charset=utf-8")
	public String andTempListOne(String ing_no) {
				
		Gson gson = new Gson();
		
		return gson.toJson(dao.andTempListOne(ing_no))+"";
	}
	
	@ResponseBody @RequestMapping(value="/andApproval_list", produces="text/html; charset=utf-8")
	public String andApproval_list() {
		
		Gson gson = new Gson();
		
		return gson.toJson(dao.andApproval_list());
	}

	//////////////////////////////////////////////////////////////////////
	@ResponseBody @RequestMapping(value="/andWrite.ap", produces="text/html; charset=utf-8")
	public String andWrite(int employee_id) {
		
		List<And_Ing_tableVO> list = dao.andWriteList(employee_id);
		
		return new Gson().toJson(list);

	}


		@ResponseBody @RequestMapping(value="/andRec.ap", produces="text/html; charset=utf-8")
	   public String andRec(int employee_id) {
	      
	      List<And_Ing_tableVO> list = dao.andRecList(employee_id);
	      
	      return new Gson().toJson(list);

	   }
		@ResponseBody @RequestMapping(value="/andCodeList", produces="text/html; charset=utf-8")
		public String andCodeList(String document_check) {
				
			return new Gson().toJson(dao.andCodeList(document_check));
			
		}
		@ResponseBody @RequestMapping(value="/andResult_code", produces="text/html; charset=utf-8")
		public String andResult_code() {
				List<CommonCodeVO> list = dao.andResult_code();
			return new Gson().toJson(list);
			
		}

		@ResponseBody @RequestMapping(value="/andRecsign.ap", produces="text/html; charset=utf-8")
		   public String andRecsign() {
		      
		      List<And_Ing_tableVO> list = dao.andRecsign();
		   
		      return new Gson().toJson(list);
		   }
		
		@ResponseBody @RequestMapping(value="/andRecConfirm.ap", produces="text/html; charset=utf-8")
		public String andRecConfirm(String vo) {
			And_Ing_tableVO vo_list = new Gson().fromJson(vo, And_Ing_tableVO.class);
			int i = dao.andRecConfirm(vo_list);
			if(i == 1) {
			return "1";
			}else { 
				return "응안돼";
			}
		}
		@ResponseBody @RequestMapping(value="/andFirstDep.ap", produces="text/html; charset=utf-8")
		public String andFirstDep() {
			List<And_Ing_tableVO> list = dao.andFirstDep();
			return new Gson().toJson(list);
			
		}
		@ResponseBody @RequestMapping(value="/andSecondDep.ap", produces="text/html; charset=utf-8")
		public String andSecondDep(int department_id) {
			List<And_Ing_tableVO> list = dao.andSecondDep(department_id);
			return new Gson().toJson(list);
			
		}
		@ResponseBody @RequestMapping(value="/andNewInsert.ap", produces="text/html; charset=utf-8")
		public int andNewInsert(String vo) {
			And_Ing_tableVO vo1 = new Gson().fromJson(vo, And_Ing_tableVO.class);
			
			return dao.andNewInsert(vo1);
			
		}
		@ResponseBody @RequestMapping(value="/andNewNotInsert.ap", produces="text/html; charset=utf-8")
		public int andNewNotInsert(String vo) {
			And_Ing_tableVO vo1 = new Gson().fromJson(vo, And_Ing_tableVO.class);
			
			return dao.andNewNotInsert(vo1);
			
		}
}
