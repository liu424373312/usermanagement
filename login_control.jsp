<%@ page import="javabean.BusinessBean" %>
<%
    
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    
    if(username == null || password == null)
        response.sendRedirect("login.jsp");
    else{
        
        BusinessBean businessBean = new BusinessBean();
        boolean isValid = businessBean.valid(username,password);
        out.print(isValid);
        if(isValid){
            session.setAttribute("username",username);
            response.sendRedirect("menu.jsp");
        }else response.sendRedirect("login.jsp");
    }
%>