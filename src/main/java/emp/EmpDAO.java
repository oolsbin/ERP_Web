package emp;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.google.gson.JsonElement;

import salary.SalEmpVO;

@Repository
public class EmpDAO {

	@Autowired private SqlSession sql;
	
	public List<PatternVO> pattern() {
		return sql.selectList("emp.employee_pattern");
	}
	
	//정보화면창
	public EmpVO emp_info(int employee_id) {
		return sql.selectOne("emp.info", employee_id);
	}
	
	//직급조회
	public List<EmpVO> position() {
		return sql.selectList("emp.position");
	}
	
	//회사코드조회
	public List<CompanyVO> company() {
		return sql.selectList("emp.company"); 
	}

	//사원목록조회
	public List<EmpVO> employee_list(){
		return sql.selectList("emp.empList");
	}
	
	public List<EmpVO> employee_list_s(int department_id){
		return sql.selectList("emp.empSelect", department_id);
	}
	
	//부서목록조회
	public List<DepartmentVO> departments() {
		return sql.selectList("emp.departments");
	}
	
	//사원정보저장
	public void employee_insert(EmpVO vo) {
		sql.insert("emp.insert", vo);
		
	}
	
	
	public void employee_update(EmpVO vo) {
		sql.update("emp.update", vo);
	}
	public void mypage_update(EmpVO vo) {
		sql.update("emp.mypage_update", vo);
	}

	public void employee_delete(int employee_id) {
		sql.delete("emp.delete", employee_id);
	}
	
	/////////////////////////////////////////////////////////////////////////////////////////////

	public List<EmpVO> andEmp_list() {
		
		return sql.selectList("emp.andempList");
	}
	public List<DepartmentVO> andEmp_department_list(){
		return sql.selectList("emp.andDepartments");
	}
	
	public List<CompanyVO> andEmp_company_list(){
		return sql.selectList("emp.andCompany");
	}
	public List<PositionVO> andEmp_position_list(){
		return sql.selectList("emp.andPosition");
	}

	public List<PatternVO> andEmp_pattern_list(){
		return sql.selectList("emp.andEmployee_pattern");
	}
	public List<EmpVO> andEmp_department_select(int department_id){
		return sql.selectList("emp.anddepartment_select", department_id);
	}
	public List<EmpVO> andEmp_company_select(String company){
		return sql.selectList("emp.andcompany_select", company);
	}
	public List<EmpVO> andEmp_position_select(String position){
		return sql.selectList("emp.andposition_select", position);
	}
	public List<EmpVO> andEmp_pattern_select(String pattern){
		return sql.selectList("emp.andEmp_pattern_select", pattern);
	}
	public int andEmp_modify(EmpAndInsertDTO dto) {
		return sql.update("emp.andModify", dto);
	}
	
	public int and_emp_insert(EmpAndInsertDTO dto) {
		return sql.insert("emp.andEmpInsert",dto);
	}

	public List<EmpCntVO> andNumBer() {
		
		return sql.selectList("emp.andEmpCnt");
	}


	public List<SalEmpVO> select() {
		
		return sql.selectList("salary.empList");
		
	}
	
	public List<SalEmpVO> select_d(int department_id){
		return sql.selectList("salary.empList_d", department_id);

	}
	public int and_emp_delete(int employee_id) {
		
		return sql.delete("emp.andDeleteEmployee", employee_id);

	}
}
