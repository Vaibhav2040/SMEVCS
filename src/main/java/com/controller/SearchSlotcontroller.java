package com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.Slot;
import com.dao.UserDao;

@WebServlet("/SearchSlotcontroller")
public class SearchSlotcontroller extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String city = request.getParameter("city");

        UserDao dao = new UserDao();
        List<Slot> slots = dao.searchSlots(city);

        request.setAttribute("slots", slots);
        request.setAttribute("city", city);
        request.getRequestDispatcher("SearchSlot.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}