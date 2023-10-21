package com.example.web_lab2.servlets;

import com.example.web_lab2.validation.Validator;
import com.example.web_lab2.beans.RowCheckout;
import com.example.web_lab2.beans.Table;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.time.LocalTime;
import java.time.format.DateTimeFormatter;


import java.io.IOException;

import static java.lang.Math.pow;

@WebServlet(name = "AreaCheckServlet", value = "/check")
public class AreaCheckServlet extends HttpServlet {
    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm:ss");

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String strX = request.getParameter("x");
            String strY = request.getParameter("y");
            String strR = request.getParameter("r");
            if (!(strX.length() <= 10 && strY.length() <= 10 && strR.length() <= 10)) {
                return;
            }
            float x = Float.parseFloat(strX);
            float y = Float.parseFloat(strY);
            float r = Float.parseFloat(strR);

            Validator validator = new Validator(x, y, r);
            long startTime = System.nanoTime();
            if (validator.validate()) {
                String result = checkout(x, y, r) ? "ПРАВДА" : "ЛОЖЬ";
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

    public static boolean checkout(float x, float y, float r) {
        return (x >= 0 && x <= r && y >= 0 && y <= r) || (x <= 0 && x >= -r && y <= 0 && y >= -r) || (x >= 0 && y >= 0 && pow(x, 2) + pow(y, 2) <= pow(r / 2, 2));
    }

}