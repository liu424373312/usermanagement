<%@ page contentType="text/html;charset=utf-8" %>
<%@ page language="java" import="java.util.*" %>
<html>
    <head>
        <title>My JSP 'login.jsp' starting page</title>
    </head>
    <body>
        <form name="forml" action="login_control.jsp" method="post">
            <table width="200" border="1">
                <tr><td colspan="2">登录窗口</td>
                <tr><td>用户名:</td><td><input type="text" name="username" size="10"></td>
                </tr>
                <tr><td>密码:</td><td><input type="text" name="password" size="10"></td>
                </tr>
                <tr><td colspan="2">
                    <input type="submit" name="submit" value="登录">
                    <a href="register.jsp">注册新用户</a></td>
                </tr>
            </table>
        </form>
    </body>
</html>