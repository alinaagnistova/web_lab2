package com.example.web_lab2.servlets;

import com.example.web_lab2.beans.Table;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "ControllerServlet", value = "/ControllerServlet")
public class ControllerServlet extends HttpServlet {
    private Table table;
    @Override
    public void init(){
        this.table = new Table();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{
            request.setAttribute("table", table);
            getServletContext().getRequestDispatcher("/check").forward(request, response);
        } catch (Exception e) {
            getServletContext().setAttribute("error", e.getMessage());
            request.getServletContext().getRequestDispatcher("/error.jsp").forward(request, response);
        }
    }


}