<%@ page import="javabean.BusinessBean" %>
<%
    //
    String username = request.getParameter("username");
    String password1 = request.getParameter("password1");
    String password2 = request.getParameter("password2");
    String email = request.getParameter("email");

    if(username == null || password1 == null || password2 == null || email == null)
        response.sendRedirect("register.jsp");
    else{
                
        BusinessBean businessBean = new BusinessBean();
        boolean isExist = businessBean.isExist(username);
        if(!isExist){
            businessBean.add(username,password1,email);
            response.sendRedirect("login.jsp");
        }else response.sendRedirect("register.jsp");
    }
%>