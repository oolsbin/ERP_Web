package approval;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import emp.EmpVO;
import work.CommonCodeVO;

@Repository
public class ApprovalDAO {
@Autowired @Qualifier("bteam") private SqlSession sql;

	public List<Ing_tableVO> submitList(int employee_id) {
		return sql.selectList("approval.submitList", employee_id);
	}
	
	public List<Ing_tableVO> lockerList(int employee_id) {
		return sql.selectList("approval.lockerList", employee_id);
	}
	
	public List<Ing_tableVO> receiveList(int employee_id) {
		List<Ing_tableVO> list = sql.selectList("approval.receiveList", employee_id);
		return list;
	}
	
	//결재함 전체 조회
	public List<Result_tableVO> approvalList(int employee_id) {
		List<Result_tableVO> list = sql.selectList("approval.approvalList", employee_id);
		return list;
	}
	
	//결재함에서 선택된 문서만 조회
	public List<Result_tableVO> approvalList(int employee_id, String code_value) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("code_value", code_value);
		map.put("employee_id", employee_id+"");
		List<Result_tableVO> list = sql.selectList("approval.approvalListPart", map);
		return list;
	}
	
	public int insertPost(Ing_tableVO vo) {
		return sql.insert("approval.insertPost", vo);
	}
	
	public int insertResult(Ing_tableVO vo) {
		return sql.insert("approval.insertResult", vo);
	}
			
	public int insertLocker(Ing_tableVO vo) {
		return sql.insert("approval.insertLocker", vo);
	}
	
	public List<EmpVO> departmentEmployee(String department_name, int employee_id){
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("employee_id", employee_id+"");
		map.put("department_name", department_name);
		return sql.selectList("approval.departmentEmployee", map);
	}
	
	public Ing_tableVO submitListDetail(int no, int employee_id) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("employee_id", employee_id+"");
		map.put("no", no+"");
		//Ing_tableVO vo = sql.selectOne("approval.submitListDetail", map);
		return sql.selectOne("approval.submitListDetail", map);
	}
	
	public Ing_tableVO lockerListDetail(int no, int employee_id) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("employee_id", employee_id+"");
		map.put("no", no+"");
		Ing_tableVO vo = sql.selectOne("approval.lockerListDetail", map);		
		return vo;
	}
	
	public Result_tableVO approvalListDetail(int no, int employee_id) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("employee_id", employee_id+"");
		map.put("no", no+"");
		return sql.selectOne("approval.approvalListDetail", map);
	}
	
	//ing_table 목록 중 하나 삭제
	public int deleteIng(int ing_no) {
		return sql.delete("approval.deleteIng", ing_no);
	}
	
	public Ing_tableVO receiveListDetail(int no, int employee_id) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("employee_id", employee_id+"");
		map.put("no", no+"");
		return sql.selectOne("approval.receiveListDetail", map);
	}
	
	//처리 상태 select tag에 쓰일 리스트 read
	public List<Object> document_checks() {
		return sql.selectList("approval.document_checks");
	}
	
	public int insertResultEnd(Ing_tableVO vo) {
		return sql.insert("approval.insertResultEnd", vo);
	}
	
	public int deleteLocker(String[] deleteCheck) {
		String checkList= String.join(",", deleteCheck);
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("checkList", checkList);
		return sql.delete("approval.deleteLocker", map);
	}
	
	public List<Common_codeVO> document_check() {
		return sql.selectList("approval.document_check");
	}


	


	////////////////////////안드/////////////
	
	
	public List<Ing_tableVO> andTempList(){
		
		return sql.selectList("approval.andTempList");
	}
	public int andTempUpdate(int ing_no) {
		
		return sql.update("approval.andTempUpdate",ing_no);
	}
	public int andTempDelete(int ing_no) {
		
		return sql.delete("approval.andTempDelete",ing_no);
	}
	public int andTempModify(String document_title, String document_content, int ing_no) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("document_content", document_content);
		map.put("document_title", document_title);
		map.put("ing_no",ing_no);
		return sql.update("approval.andTempModify",map);
	}
	public Ing_tableVO andTempListOne(String ing_no) {
		
		return sql.selectOne("approval.andTempListOne", ing_no);
	}
	
	public List<Result_tableVO> andApproval_list() {
		
		return sql.selectList("approval.andApproval_list");
	}

	public List<And_Ing_tableVO> andWriteList(int employee_id){
		return sql.selectList("approval.andWriteList", employee_id);

	}
	public List<And_Ing_tableVO> andRecList(int employee_id) {
		
		return sql.selectList("approval.andRecList",employee_id);
	}

	public List<And_Ing_tableVO> andRecsign() {
		return sql.selectList("approval.andRecsign");
	}

	public int andRecConfirm(And_Ing_tableVO vo_list) {
		 sql.insert("approval.andRecConfirm", vo_list);
		 return sql.delete("approval.andRecCencel", vo_list);
		 
	}
	public List<Result_tableVO> andCodeList(String document_check){
		
		return sql.selectList("approval.andCodeList" ,document_check);
	}
	public List<CommonCodeVO> andResult_code(){
		
		return sql.selectList("approval.andResult_code");
	}

	public List<And_Ing_tableVO> andFirstDep() {
		
		return sql.selectList("approval.andFirstDep");
	}

	public List<And_Ing_tableVO> andSecondDep(int department_id) {
		
		return sql.selectList("approval.andSecondDep",department_id);
	}

	public int andNewInsert(And_Ing_tableVO vo1) {
		sql.insert("approval.andResultInsert", vo1);
		return sql.insert("approval.andIngInsert", vo1);
	}

	public int andNewNotInsert(And_Ing_tableVO vo1) {
		return sql.insert("approval.andIngNotInsert", vo1);
	}

	
	
}
