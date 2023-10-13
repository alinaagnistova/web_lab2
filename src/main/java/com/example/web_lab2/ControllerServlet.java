package com.example.web_lab2;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "ControllerServlet", value = "/ControllerServlet")
public class ControllerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String x = request.getParameter("x");
        String y = request.getParameter("y");
        String r = request.getParameter("r");
        if(x != null && y != null && r != null) {
            HttpSession session = request.getSession();
            BeanStorage beanStorage = (BeanStorage) session.getAttribute("beanStorage");
            if (beanStorage == null){
                beanStorage = new BeanStorage();
                session.setAttribute("beanStorage", beanStorage);
            }
            request.setAttribute("beanStorage", beanStorage);
            request.getRequestDispatcher("/check").forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/index.jsp");
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

}