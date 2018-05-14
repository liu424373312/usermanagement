<%@ page contentType="text/html;charset=utf-8" %>
<%@ page language="java" import="java.util.*" %>
<html>
    <head>
        <title>My JSP 'register.jsp' starting page</title>
    </head>
    <body>
        <form name="forml" action="register_control.jsp" method="post">
            <table width="200" border="1">
                <tr><td colspan="2">注册窗口</td>
                <tr><td>用户名</td><td><input type="text" name="username" size="10"></td>
                </tr>
                <tr><td>密码</td><td><input type="password" name="password1" size="10"></td>
                </tr>
                <tr><td>确认密码</td><td><input type="password" name="password2" size="10"></td>
                </tr>
                <tr><td>Email</td><td><input type="text" name="email" size="10"></td>
                </tr>
                <tr><td colspan="2">
                    <input type="submit" name="submit" value="提交">
                    <a href="login.jsp">返回登陆页面</a></td>
                </tr>
            </table>
        </form>
    </body>
</html>