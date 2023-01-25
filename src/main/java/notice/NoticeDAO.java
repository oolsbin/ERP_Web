package notice;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeDAO {

	@Autowired private SqlSession sql;
	
	public List<NoticeVO> notice_list() {
		return sql.selectList("notice.notice_list");
	}
	
	public int notice_insert(NoticeVO vo) {
		return sql.insert("notice.insert", vo);
	}
	
	public NoticeVO notice_detail(int notice_num) {
		
		return sql.selectOne("notice.detail", notice_num);
	}
	
	public int notice_read(int notice_num) {
		
		return sql.update("notice.read", notice_num);
	}
	
	public int notice_update(NoticeVO vo) {
		
		return sql.update("notice.update", vo);
	}
	
	public int notice_delete(int notice_num) {
		
		return sql.delete("notice.delete", notice_num);
	}
	
	public NoticeListVO notice_list_search(NoticeListVO search) {
		
		//page.setList( sql.selectList("notice.list", page));
		search.setList(sql.selectList("notice.list", search));
		return search;
	}
}
