<%@ page contentType="text/html;charset=utf-8" %>
<%@ page language="java" import="java.util.*" %>
<html>
    <head>
        <title>My JSP 'menu.jsp' starting page</title>
    </head>
    <body>
        <form name="form1" action="logout.jsp" method="post">
            <table width="200" border="1">
                <tr><td colspan="2">登陆成功</td>
                <tr><td>欢迎你</td><td><%=(String)session.getAttribute("username")%></td>
                </tr>
                <tr><td colspan="2">
                    <input type="submit" name="submit" value="退出">
                </tr>
            </table>
        </form>
    </body>
</html>