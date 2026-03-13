package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.AdminDao;

@WebServlet("/AdminLoginController")
public class AdminLoginController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        HttpSession ss = request.getSession();

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        AdminDao dao = new AdminDao();
        boolean status = dao.checkAdmin(email, password);

        if (status) {
            ss.setAttribute("admin", email);
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Admin Login Successful')");
            out.println("location='AdminHome.jsp';");
            out.println("</script>");
        } else {
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Invalid Admin Credentials')");
            out.println("location='AdminLogin.jsp';");
            out.println("</script>");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}