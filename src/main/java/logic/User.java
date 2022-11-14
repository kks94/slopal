package logic;

import java.util.Date;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Past;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

public class User {
	@Size(min=3,max=10,message="아이디는 3자이상 10자 이하로 입력하세요")
	private String userid;
	@Size(min=3,max=10,message="비밀번호는 3자이상 10자 이하로 입력하세요")
	private String password;
	@NotEmpty(message="사용자이름은 필수입니다.")
	private String username;
	private String phoneno;
	private String add1;
	private String add2;	
	private String add3;	
	@NotEmpty(message="이메일은 필수입니다.")
	@Email(message="email 형식으로 입력하세요")
	private String email;
	@Past(message="생일은 과거 날짜만 가능합니다.")
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date birthday;
	
	// getter, setter, toString
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPhoneno() {
		return phoneno;
	}
	public void setPhoneno(String phoneno) {
		this.phoneno = phoneno;
	}
	public String getAdd1() {
		return add1;
	}
	public void setAdd1(String add1) {
		this.add1 = add1;
	}
	public String getAdd2() {
		return add2;
	}
	public void setAdd2(String add2) {
		this.add2 = add2;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getAdd3() {
		return add3;
	}
	public void setAdd3(String add3) {
		this.add3 = add3;
	}
	@Override
	public String toString() {
		return "User [userid=" + userid + ", password=" + password + ", username=" + username + ", phoneno=" + phoneno
				+ ", add1=" + add1 + ", add2=" + add2 + ", add3=" + add3 +", email=" + email + ", birthday=" + birthday
				+ "]";
	}

}
