package firebase;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FireBaseDAO {
	@Autowired private SqlSession sql;
	
	public int fireSelectCnt(int employee_id) {
		return sql.selectOne("firebase.fireSelectCnt", employee_id);
		
	}

}
