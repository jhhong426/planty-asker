package com.plantynet.domain;

import org.springframework.beans.factory.annotation.Autowired;

import com.plantynet.service.PasswordEncoder;

// DB와 송수신되는 데이터
public class ManagerVO {

	private Integer mngr_no; 	//관리자 NO
	private String mngr_id;		// 관리자 ID
	private String password;	// 관리자 PW
	private String mngr_name;	// 관리자 이름
	private int emp_no;		    // 관리자 사원번호
	private String department;	// 관리자 부서
	private String position;	// 관리자 직책
	private String authority;	// 관리자 권한
	private String status;      // 관리자 상태

	public Integer getMngr_no() {
		return mngr_no;
	}

	public void setMngr_no(Integer mngr_no) {
		this.mngr_no = mngr_no;
	}
	
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

	public String getMngr_name() {
	    return mngr_name;
	}

	public void setMngr_name(String mngr_name) {
	    this.mngr_name = mngr_name;
	}
	  
	public int getEmp_no() {
		return emp_no;
	}
	
	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}
	
	public String getDepartment() {
		return department;
	}
	
	public void setDepartment(String department) {
		this.department = department;
	}
	
	public String getPosition() {
		return position;
	}
	
	public void setPosition(String position) {
		this.position = position;
	}
	
	public String getAuthority() {
		return authority;
	}
	
	public void setAuthority(String authority) {
		this.authority = authority;
	}
	
		
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "ManagerVO [mngr_id=" + mngr_id + ", mngr_name=" + mngr_name +
				  ", emp_no=" + emp_no +", department=" + department + ", position=" + position + ", authority=" +authority + ", status=" + status +"]";
	}
}
