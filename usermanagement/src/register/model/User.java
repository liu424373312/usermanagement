package register.model;

public class User {
	public long id;
	public String userName;
	public String password;
	public String role;
	public String gender;
	public String email;
	public int age;

	public String toString() {
		return "�û�:" + userName + "<br>����:" + password + "<br>��ɫ:" + role
				+ "<br>�Ա�:" + gender + "<br>Email:" + email + "<br>����:" + age;
	}
}
