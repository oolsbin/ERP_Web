package work;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.hanul.berp.EmpController;

import emp.DepartmentVO;
import emp.EmpVO;



@Repository
public class WorkDAO {
	@Autowired @Qualifier("bteam") private SqlSession sql;
	
	/*
	 * public List<WorkDAO> work_list(){
	 * 
	 * return sql.selectList("work.list"); }
	 */
	
	public WorkVO workInfo(int employee_id) {
		
		return sql.selectOne("work.workInfo", employee_id);
	}

	
	public int work_end_input(String end_work, int employee_id) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("end_work", end_work);
		map.put("employee_id",employee_id);
		
		return sql.update("work.end_work",map);
	}
	
	
	public int work_start_input(String start_work, int employee_id, int department_id, String company_cd ) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("start_work", start_work);
		map.put("employee_id", employee_id);
		map.put("department_id", department_id);
		map.put("company_cd", company_cd);
		
		
		
		return sql.insert("work.start_work", map);
	}

	public EmpVO empInfo(int employee_id) {
		
		return sql.selectOne("work.empInfo", employee_id);
	}
	
	public List<WorkResultVO> rList() {
		
		return sql.selectList("work.list");
	}
	public List<WorkResultVO> workResult(int employee_id) {
		
		return sql.selectList("work.workResult", employee_id);
	}
	
	public List<WorkResultVO> rList2() {
		
		return sql.selectList("work.list2");
	}
	public List<WorkResultVO> holiday_list(int employee_id) {
		
		return sql.selectList("work.holiday_list", employee_id);
	}

	public List<CommonCodeVO> codeList(){
		
		return sql.selectList("work.codeList");
	}
	public int holiday_submit(String start_holiday, String end_holiday,int employee_id, int department_id, String company_cd,String work_code ){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("start_holiday", start_holiday);
		map.put("end_holiday", end_holiday);
		map.put("employee_id", employee_id);
		map.put("department_id", department_id);
		map.put("company_cd", company_cd);
		map.put("work_code", work_code);
		return sql.insert("work.holiday_submit", map);
	}
	
	public List<HolidayResultVO> holiday_submit_list(int employee_id ){
		
		return sql.selectList("work.holiday_submit_list", employee_id);
	}
	public List<HolidayVO> holidayList(int employee_id){
		
		return sql.selectList("work.holidayList", employee_id);
	}
	
	public List<HolidayVO> holidayAllList(){
		
		return sql.selectList("work.holidayAllList");
	}
	
	
	public List<DepartmentVO> departments(){
		
		return sql.selectList("work.departments");
	}
	
	public List<WorkResultVO> department_work(int department_id, String work_date) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("department_id",department_id);
		map.put("work_date", work_date);
		return sql.selectList("work.department_work", map);
	}
	
	
	public List<WorkResultVO> department_work() {
		return sql.selectList("work.department_work");
	}
	
	public List<WorkVO> search(int employee_id) {
		
		return sql.selectList("work.search",employee_id);
	}
	public WorkVO andEndSearch(int employee_id) {
		
		return sql.selectOne("work.andEndSearch", employee_id);
	}
	
	public int andHoliday(HolidayVO vo){
		
		return sql.insert("work.andHoliday", vo);
	}
	
	public List<CommonCodeVO> andCode() {
		
		return sql.selectList("work.andCode");
	}
	public List<CommonCodeVO> andHolidaySearch() {
		
		return sql.selectOne("work.andHolidaySearch");
	}
	public List<HolidayVO> andHoliday_List(){
		
		return sql.selectList("work.andHoliday_List");
		
	}
	public List<HolidayVO> andHolidayDept_List(int department_id){
		
		return sql.selectList("work.andHolidayDept_List",department_id);
		
	}
	public List<WorkResultVO> andHolidayIndi_List(int employee_id){
		
		return sql.selectList("work.andHolidayIndi_List", employee_id);
	}
	
		public int andWork_start_input(WorkVO dto) {
		
		return sql.insert("work.andStart_work",dto);
	}
		public int andWork_end_input(WorkVO dto) {
			
			return sql.update("work.andEnd_work",dto);
		}


		public WorkVO findToday(int employee_id) {
			
			return sql.selectOne("findToday", employee_id);
		}


		
}
