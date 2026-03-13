package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.User;
import com.dao.UserDao;

@WebServlet("/UserRegistrationController")
public class UserRegistrationController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String mobile_no = request.getParameter("mobile_no");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String vehicle_no = request.getParameter("vehicle_no");
        String vehicle_name = request.getParameter("vehicle_name");
        String vehicle_owner_name = request.getParameter("vehicle_owner_name");

        User user = new User();
        user.setName(name);
        user.setAddress(address);
        user.setMobile_no(mobile_no);
        user.setEmail(email);
        user.setPassword(password);
        user.setVehicle_no(vehicle_no);
        user.setVehicle_name(vehicle_name);
        user.setVehicle_owner_name(vehicle_owner_name);

        UserDao dao = new UserDao();
        int status = dao.registerUser(user);

        if (status > 0) {
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Registration Successful! Please Login.')");
            out.println("location='UserLogin.jsp';");
            out.println("</script>");
        } else {
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Registration Failed! Please Try Again.')");
            out.println("location='UserRegister.jsp';");
            out.println("</script>");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}