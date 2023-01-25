package salary;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;


@Repository
public class SalaryDAO {
	@Autowired @Qualifier("bteam") private SqlSession sql;
	
	public List<SalaryVO> salary_List() {
		return sql.selectList("salary.saList");
	}
	public List<SalEmpVO> employee_list(){
		return sql.selectList("salary.empList");
	}
	//부서목록조회
	public List<SalEmpVO> departments() {
		return sql.selectList("salary.departments");
	}
	public List<SalEmpVO> employee_list_d(int department_id){
		return sql.selectList("salary.empList_d",department_id);
	}
	public SalEmpVO mod_info(int employee_id) {
		return sql.selectOne("salary.modInfo", employee_id);
	}
	public void update_salary(SalEmpVO vo) {
		sql.update("salary.update_salary", vo);
	}
	public int insert_bonus(SalEmpVO vo) {
		return sql.insert("salary.insert_bonus", vo);
	}
	public SalEmpVO mySalary(int employee_id) {
		return sql.selectOne("salary.mySalary", employee_id);
	}
	
	
	
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////

	public List<SalaryVO> salaryList() {
		List<SalaryVO> salaryList = sql.selectList("salary.salaryList");
		return salaryList;
	}
	public List<SalaryVO> salaryList(String department_name) {
		List<SalaryVO> salaryList = sql.selectList("salary.salaryList_department_name", department_name);
		return salaryList;
	}
	
	public int andInsertBonus(HashMap<String, Object> map) {
		 
		return sql.insert("salary.andInsertBonus", map);
	}
	
	public List<BonusVO> andBonusList(){
		List<BonusVO> bonusList = sql.selectList("salary.andBonusList");
		return bonusList;
	}
	public List<BonusVO> andBonusList(String department_name){
		List<BonusVO> bonusList = sql.selectList("salary.andBonusList_department_name", department_name);
		return bonusList;
	}
	public int andCommissionSave(int employee_id, int commission_pct){
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("employee_id", employee_id+"");
		map.put("commission_pct", commission_pct+"");
		int res = sql.update("salary.andCommissionSave", map);
		return res;
	}
	public int andSalarySave(int employee_id, int salary){
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("employee_id", employee_id+"");
		map.put("salary", salary+"");
		int res = sql.update("salary.andSalarySave", map);
		return res;
	}
	
	
	public SalaryVO andMySalaryVo(int employee_id) {
		SalaryVO vo = sql.selectOne("salary.andMySalaryVo", employee_id); 
		return vo;
	}
	
	public List<BonusVO> andMyBonusList(int employee_id) {
		List<BonusVO> list = sql.selectList("salary.andMyBonusList", employee_id);
		return list;
	}
	
	public List<SalaryVO> andDepartment_name(){
		return sql.selectList("salary.andDepartment_name");
	}
	public List<SalaryVO> andSalaryName(String name) {
		
		return sql.selectList("salary.andSalaryName",name);
	}
}
