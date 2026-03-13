package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.Slot;
import com.dao.AdminDao;

@WebServlet("/ManageSlotsController")
public class ManageSlotsController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String action = request.getParameter("action");
        AdminDao dao = new AdminDao();

        if (action.equals("add")) {
            Slot slot = new Slot();
            slot.setSlotname(request.getParameter("slotname"));
            slot.setSlotaddress(request.getParameter("slotaddress"));
            slot.setSlotarea(request.getParameter("slotarea"));
            slot.setCity(request.getParameter("city"));
            slot.setState(request.getParameter("state"));
            slot.setCountry(request.getParameter("country"));

            int status = dao.addSlot(slot);
            if (status > 0) {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Slot Added Successfully')");
                out.println("location='ManageSlots.jsp';");
                out.println("</script>");
            } else {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Failed to Add Slot')");
                out.println("location='ManageSlots.jsp';");
                out.println("</script>");
            }
        } else if (action.equals("delete")) {
            int id = Integer.parseInt(request.getParameter("id"));
            int status = dao.deleteSlot(id);
            if (status > 0) {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Slot Deleted Successfully')");
                out.println("location='ManageSlots.jsp';");
                out.println("</script>");
            } else {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Failed to Delete Slot')");
                out.println("location='ManageSlots.jsp';");
                out.println("</script>");
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}