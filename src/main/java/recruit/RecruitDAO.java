package recruit;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import apply.ApplyVO;





@Repository

public class RecruitDAO {

	@Autowired private SqlSession sql;
	
	public void delete(String recruit_num) {
		sql.delete("recruit.delete", recruit_num);
		
	}
	
	public String currval() {
		return sql.selectOne("recruit.currval");
	}
	
	public List<RecruitVO> recruit_list(){
		
		return sql.selectList("recruit.list");
	}
	public List<RecruitVO> recruit_list(String employee_pattern){
		
		return sql.selectList("recruit.list_code", employee_pattern);
	}
	public List<RecruitVO> recruit_list_career(String career){
		
		return sql.selectList("recruit.list_code_career", career);
	}
	
	public int recruit_insert(RecruitVO vo) {
		return sql.insert("recruit.insert", vo);
	}
	
	public List<CommonCodeVO> recruit_pattern(){
	
		return sql.selectList("recruit.pattern");
	}
	public List<CommonCodeVO> recruit_pattern_career(){
		
		return sql.selectList("recruit.pattern_career");
	}
	public List<CommonCodeVO> recruit_career(){
		
		return sql.selectList("recruit.pattern_career");
	}
	public List<CompanyVO> recruit_pattern_company(){
		
		return sql.selectList("recruit.pattern_company");
	}
	
	public RecruitVO recruit_info(String recruit_num) {
		
		return sql.selectOne("recruit.detail", recruit_num);
	}
	
	public RecruitVO recruit_info_company(String recruit_num) {
		
		return sql.selectOne("recruit.detail_company", recruit_num);
	}

	/*
	 * public RecruitVO recruit_info_company_com() {
	 * 
	 * return sql.selectOne("recruit.detail_company_com"); }
	 */
	public void recruit_update(RecruitVO vo) {
		sql.update("recruit.update", vo);
	}
	
	/////////////////////////////////////////////////////////////////
	public List<RecruitVO> and_rec_list() {
		return sql.selectList("recruit.andSelect");
	}
	public List<AndApplyVO> and_my_rec_list(String name) {
		return sql.selectList("recruit.andMyList", name);
	}

	public List<RecruitVO> and_apply_spinnerList() {
		return sql.selectList("recruit.andApplySpinnerList");
	}
	public List<RecruitVO> and_apply_spinnerCareerList(String career) {
		return sql.selectList("recruit.andApplySpinnerCareerList", career);
	}
	//관리자 부분
	public List<RecruitVO> and_apply_spinnerSelectList() {
		return sql.selectList("recruit.andApplyCheckSelect");
	}
	public List<RecruitVO> and_apply_spinnerSelectAllList() {
		return sql.selectList("recruit.andApplyCheckSelectList");
	}
	public List<RecruitVO> and_apply_spinnerSelectAllOne(String title) {
		return sql.selectList("recruit.andApplyCheckSelectOne", title);
	}
	public List<RecruitVO> and_apply_spinnerSelectPassList() {
		return sql.selectList("recruit.andApplyPassSelectList");
	}
	public List<RecruitVO> and_apply_spinnerSelectPassOne(String title) {
		return sql.selectList("recruit.andApplyPassSelectOne", title);
	}
	public void and_apply_PassORFail(ApplyVO vo) {
		sql.update("recruit.andApplyPassORFail", vo);
	}
}
