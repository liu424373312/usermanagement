package javabean;
import java.sql.*;
public class DBAccessBean{
    private String drv ="com.mysql.jdbc.Driver";
    private String url ="jdbc:mysql://localhost:3306/demo";
    private String usr ="root";
    private String pwd ="123456";
    private Connection conn =null;
    private Statement stmt =null;
    private ResultSet rs =null;
}

