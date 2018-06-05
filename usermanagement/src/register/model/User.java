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
		return "用户:" + userName + "<br>密码:" + password + "<br>角色:" + role
				+ "<br>性别:" + gender + "<br>Email:" + email + "<br>年龄:" + age;
	}
}
