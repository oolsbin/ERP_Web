package notice;

import java.util.List;

public class NoticeListVO {

	private String search, keyword, viewType="list";
	private List<NoticeVO> list;
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getViewType() {
		return viewType;
	}
	public void setViewType(String viewType) {
		this.viewType = viewType;
	}
	public List<NoticeVO> getList() {
		return list;
	}
	public void setList(List<NoticeVO> list) {
		this.list = list;
	}
	
	
}
