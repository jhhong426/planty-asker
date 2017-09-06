package com.plantynet.dto;

//로그인 화면에 전달되는 데이터를 수집
public class LoginDTO {
	
	private String mngr_id;		//관리자 ID
	private String password;	//관리자 PW
	
	public String getMngr_id() {
		return mngr_id;
	}
	public void setMngr_id(String mngr_id) {
		this.mngr_id = mngr_id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	@Override
	public String toString() {
		return "LoginDTO [mngr_id=" + mngr_id + ", password=" + password + "]";
	}
	
	
	
}