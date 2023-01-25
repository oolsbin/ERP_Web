package mypage;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Repository;



@Repository
public class MyPageDAO {
	@Autowired private SqlSession sql;
	
	
public List<MemberVO> member_list(){
		
		return sql.selectList("mypage.memberList");
	}

public MemberVO member_Info(String email){
	
	return sql.selectOne("mypage.memberInfo", email);
}

public void member_modify(String email){
	
	sql.update("mypage.memberUpdate", email);
}

public int employee_id(String email) {
	return sql.selectOne("mypage.employee_id", email);
}

public EmpMemberVO empMember_list(int employee_id) {
	return sql.selectOne("mypage.empMember", employee_id);
}


//안드

public void and_emp_modify(EmpVO vo) {
	 sql.update("mypage.andUpdate", vo);
}
}
