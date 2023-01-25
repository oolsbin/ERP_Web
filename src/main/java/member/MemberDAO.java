package member;


import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import emp.EmpVO;



@Repository
public class MemberDAO {
	@Autowired private SqlSession sql;

	public int insert(MemberVO vo) {
	      return sql.insert("member.insert", vo);
	   }
	
	//회원가입 때 아이디 중복체크
	public int checkId(String id) {
		return sql.selectOne("member.checkId", id);
	}

	/*
	 * //로그인할 때 아이디와 비밀번호 체크 public EmpVO checkLogin(int employee_id, String pw) {
	 * HashMap<String, String> map = new HashMap<String, String>();
	 * map.put("employee_id", employee_id+""); map.put("pw", pw); return
	 * sql.selectOne("member.checkLogin", map); }
	 */
	//로그인할 때 아이디와 비밀번호 체크
	public EmpVO checkLogin(int employee_id, String pw) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("employee_id", employee_id);
		map.put("pw", pw);
		return sql.selectOne("member.checkLogin", map);
	}
	
	

	///////////////////////////////////안드로이드/////////////////////////////////////////////////////////
	public List<AndLoginMemberVO> andCheckLogin() {
		return sql.selectList("member.andCheckLogin");
	}
	
	public List<AndLoginMemberVO> andLogin(String id) {
		return sql.selectList("member.andLogin", Integer.parseInt(id));
	}

	public int andInsert(JoinDTO dto_temp) {
			return sql.insert("member.andInsert", dto_temp);
	}

	


}//class
