package javabean;
public class BusinessBean {
    public boolean valid(String username, String password) {
        boolean isValid = false;
        DBAccessBean db = new DBAccessBean();
        if (db.createConn()) {
            String sql = "select * from usertable where username='" + username + "'and password='" + password + "';";
            db.query(sql);
            if (db.next()) {
                isValid = true;
            }
            db.closeRs();
            db.closeStmt();
            db.closeConn();
        }
        return isValid;
    }

    public boolean isExist(String username) {
        boolean isExist = false;
        DBAccessBean db = new DBAccessBean();
        if (db.createConn()) {
            String sql = "select * from usertable where username='" + username + "'";
            db.query(sql);
            if (db.next()) {
                isExist = true;
            }
            db.closeRs();
            db.closeStmt();
            db.closeConn();
        }
        return isExist;
    }

    public void add(String username, String password, String email) {
        DBAccessBean db = new DBAccessBean();
        if (db.createConn()) {
            String sql = "insert into usertable(username,password,email)values('" + username + "','" + password + "','"
                    + email + "')";
            db.update(sql);
            db.closeStmt();
            db.closeConn();
        }
    }
}