package apply;

import java.sql.Date;

public class ApplyVO {

	//RECRUIT_NUM, APPLY_EMAIL, APPLY_NUM, APPLY_NAME, FILE_NAME, FILE_PATH, APPLY_CHECK
	private String recruit_num, apply_email, apply_name, 
	file_name, file_path, apply_check, apply_phone, apply_pw,recruit_title,checkPass, apply_pic_name, apply_pic_path;
	public String getApply_pic_name() {
		return apply_pic_name;
	}
	public void setApply_pic_name(String apply_pic_name) {
		this.apply_pic_name = apply_pic_name;
	}
	public String getApply_pic_path() {
		return apply_pic_path;
	}
	public void setApply_pic_path(String apply_pic_path) {
		this.apply_pic_path = apply_pic_path;
	}
	private int apply_num, dual_num;
	private Date apply_date;
	
	
	public int getDual_num() {
		return dual_num;
	}
	public void setDual_num(int dual_num) {
		this.dual_num = dual_num;
	}
	public String getCheckPass() {
		return checkPass;
	}
	public void setCheckPass(String checkPass) {
		this.checkPass = checkPass;
	}
	public Date getApply_date() {
		return apply_date;
	}
	public void setApply_date(Date apply_date) {
		this.apply_date = apply_date;
	}
	public String getRecruit_title() {
		return recruit_title;
	}
	public void setRecruit_title(String recruit_title) {
		this.recruit_title = recruit_title;
	}
	public String getApply_pw() {
		return apply_pw;
	}
	public void setApply_pw(String apply_pw) {
		this.apply_pw = apply_pw;
	}
	public String getApply_phone() {
		return apply_phone;
	}
	public void setApply_phone(String apply_phone) {
		this.apply_phone = apply_phone;
	}
	public String getRecruit_num() {
		return recruit_num;
	}
	public void setRecruit_num(String recruit_num) {
		this.recruit_num = recruit_num;
	}
	public String getApply_email() {
		return apply_email;
	}
	public void setApply_email(String apply_email) {
		this.apply_email = apply_email;
	}
	public String getApply_name() {
		return apply_name;
	}
	public void setApply_name(String apply_name) {
		this.apply_name = apply_name;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	public String getFile_path() {
		return file_path;
	}
	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}
	public String getApply_check() {
		return apply_check;
	}
	public void setApply_check(String apply_check) {
		this.apply_check = apply_check;
	}
	public int getApply_num() {
		return apply_num;
	}
	public void setApply_num(int apply_num) {
		this.apply_num = apply_num;
	}
	
	
	
}
