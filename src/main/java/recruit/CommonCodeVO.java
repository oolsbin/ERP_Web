package recruit;

import java.sql.Date;

public class CommonCodeVO {

	//CODE_TITLE, CODE_VALUE, CODE_USED, CODE_NAME, CODE_BIRTH, CODE_MAKER
	
	private String code_title, code_value, code_used, code_name, code_maker;
	private Date code_birth;
	public String getCode_title() {
		return code_title;
	}
	public void setCode_title(String code_title) {
		this.code_title = code_title;
	}
	public String getCode_value() {
		return code_value;
	}
	public void setCode_value(String code_value) {
		this.code_value = code_value;
	}
	public String getCode_used() {
		return code_used;
	}
	public void setCode_used(String code_used) {
		this.code_used = code_used;
	}
	public String getCode_name() {
		return code_name;
	}
	public void setCode_name(String code_name) {
		this.code_name = code_name;
	}
	public String getCode_maker() {
		return code_maker;
	}
	public void setCode_maker(String code_maker) {
		this.code_maker = code_maker;
	}
	public Date getCode_birth() {
		return code_birth;
	}
	public void setCode_birth(Date code_birth) {
		this.code_birth = code_birth;
	}
	
	
}
