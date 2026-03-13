package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.Pay;
import com.dao.UserDao;

@WebServlet("/PayController")
public class PayController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        HttpSession ss = request.getSession();

        Pay pay = new Pay();
        pay.setEmail((String) ss.getAttribute("email"));
        pay.setVehicle_no((String) ss.getAttribute("vehicleno"));
        pay.setSlotname(request.getParameter("slotname"));
        pay.setAmount(request.getParameter("amount"));
        pay.setPayment_date(LocalDate.now().toString());

        UserDao dao = new UserDao();
        int status = dao.savePayment(pay);

        if (status > 0) {
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Payment Successful!')");
            out.println("location='PaymentHistory.jsp';");
            out.println("</script>");
        } else {
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Payment Failed! Please Try Again.')");
            out.println("location='Pay.jsp';");
            out.println("</script>");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}