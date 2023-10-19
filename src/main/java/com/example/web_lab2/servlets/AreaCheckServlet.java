package com.example.web_lab2.servlets;

import com.example.web_lab2.validation.IValidator;
import com.example.web_lab2.validation.Validator;
import com.example.web_lab2.beans.RowCheckout;
import com.example.web_lab2.beans.Table;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.time.LocalTime;
import java.time.format.DateTimeFormatter;


import java.io.IOException;

@WebServlet(name = "AreaCheckServlet", value = "/check")
public class AreaCheckServlet extends HttpServlet {
    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm:ss");

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            float x = Float.parseFloat(request.getParameter("x"));
            float y = Float.parseFloat(request.getParameter("y"));
            float r = Float.parseFloat(request.getParameter("r"));
            IValidator validator = new Validator(x, y, r);
            long startTime = System.nanoTime();
            if (validator.validate()) {
                String result = validator.checkout() ? "ПРАВДА" : "ЛОЖЬ";
                LocalTime time = LocalTime.now();
                String currentTime = time.format(formatter);
                String scriptTime = String.format("%.2f", (double) (System.nanoTime() - startTime) * 0.0001);
                RowCheckout row = new RowCheckout(x, y, r, result, currentTime, scriptTime);
                Table table = (Table) request.getAttribute("table");
                table.addRow(row);
                getServletContext().setAttribute("row", row);
                getServletContext().setAttribute("table", table);
            }
        } catch (Exception e) {
            getServletContext().setAttribute("error", e.getMessage());
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        }

    }

}