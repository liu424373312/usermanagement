package register.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import register.model.User;

public class UserDAOImpl implements UserDAO {
	private String dbClassName = "com.mysql.jdbc.Driver";
	private String dbUrl = "jdbc:mysql://localhost:3306/userdb";
	private String dbUser = "root";
	private String dbPwd = "liuyong561";

	public UserDAOImpl() {
	}

	public Connection getConnection() {
		Connection conn = null;
		try {
			Class.forName(dbClassName);
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPwd);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}

	public void saveUser(User user) {
		Connection con = null;
		PreparedStatement stmt = null;
		try {
			con = getConnection();
			con.setAutoCommit(false);
			stmt = con
					.prepareStatement("insert into users(userName,password,gender,role,email,age)values(?,?,?,?,?,?)");
			stmt.setString(1, user.userName);
			stmt.setString(2, user.password);
			stmt.setString(3, user.gender);
			stmt.setString(4, user.role);
			stmt.setString(5, user.email);
			stmt.setInt(6, user.age);
			stmt.execute();
			con.commit();
		} catch (Exception e) {
			try {
				con.rollback();
			} catch (SQLException sqlex) {
				sqlex.printStackTrace();
			}
		} finally {
			try {
				stmt.close();
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public void updateUser(User user) {
		Connection con = null;
		PreparedStatement stmt = null;
		try {
			con = getConnection();
			con.setAutoCommit(false);
			stmt = con
					.prepareStatement("update users set userName =?,password=?,gender=?,role=?,email=?,age=?,where id="
							+ user.id + "");
			stmt.setString(1, user.userName);
			stmt.setString(2, user.password);
			stmt.setString(3, user.gender);
			stmt.setString(4, user.role);
			stmt.setString(5, user.email);
			stmt.setInt(6, user.age);
			stmt.execute();
			con.commit();
		} catch (Exception e) {
			try {
				con.rollback();
			} catch (SQLException sqlex) {
				sqlex.printStackTrace();
			}
		} finally {
			try {
				stmt.close();
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public User[] listAllUser() {
		User[] users = null;
		int i;
		Connection con = null;
		Statement stmt = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery("select count(*)from users");
			rs.next();
			users = new User[rs.getInt(1)];
			pstmt = con.prepareStatement("select * from users");
			rs = pstmt.executeQuery();
			i = 0;
			while (rs.next()) {
				users[i] = new User();
				users[i].id = rs.getLong(1);
				users[i].userName = rs.getString(2);
				users[i].password = rs.getString(3);
				users[i].gender = rs.getString(4);
				users[i].role = rs.getString(5);
				users[i].email = rs.getString(6);
				users[i].age = rs.getInt(7);
			}
			rs.close();
			stmt.close();
			con.close();
		} catch (SQLException sqlex) {
			sqlex.printStackTrace();
		}
		return users;
	}

	public User listUserById(long userId) {
		User user = new User();
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			stmt = con.prepareStatement("select * from users where id="
					+ userId + "");
			rs = stmt.executeQuery();
			if (rs.next()) {
				user.id = rs.getLong(1);
				user.userName = rs.getString(2);
				user.password = rs.getString(3);
				user.gender = rs.getString(4);
				user.role = rs.getString(5);
				user.email = rs.getString(6);
				user.age = rs.getInt(7);
			}
			rs.close();
			stmt.close();
			con.close();
		} catch (SQLException sqlex) {
			sqlex.printStackTrace();
		}
		return user;
	}

	public void deleteUser(long userId) {
		Connection con = null;
		PreparedStatement stmt = null;
		try {
			con = getConnection();
			con.setAutoCommit(false);
			stmt = con.prepareStatement("delete from users where id=?");
			stmt.setLong(1, userId);
			stmt.execute();
			con.commit();
		} catch (Exception e) {
			try {
				con.rollback();
			} catch (SQLException sqlex) {
				sqlex.printStackTrace();
			}
		} finally {
			try {
				stmt.close();
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public String validate(String userName, String password) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String role = "";
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select * from users where userName ='"
					+ userName + "' and password='" + password + "'");
			if (rs.next()) {
				role = rs.getString("role");
			}
			rs.close();
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return role;
	}

}
