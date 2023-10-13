package com.example.web_lab2;

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
//            System.out.println(x); //just for check
//            System.out.println(y);//just for check
//            System.out.println(r);//just for check
            IVallidator validator = new Validator(x, y, r);
            long startTime = System.nanoTime();
            if (validator.validate()) {
                String result = validator.checkout() ? "ПРАВДА" : "ЛОЖЬ";
                LocalTime time = LocalTime.now();
                String currentTime = time.format(formatter);
                String scriptTime = String.format("%.2f", (double) (System.nanoTime() - startTime) * 0.0001);
                RowCheckout row = new RowCheckout(x, y, r, result, currentTime, scriptTime);
                BeanStorage beanStorage = (BeanStorage) request.getAttribute("beanStorage");
                BeanStorage table = new BeanStorage(beanStorage.getTable());
                table.addRow(row);
                //BeanSessionStorage bSS = (BeanSessionStorage) request.getAttribute("bss");
//                BeanSessionStorage cur = new BeanSessionStorage(bSS.getArr());
//                cur.addNewElement(el);
//                System.out.println(cur.sizeOfArr());
//                getServletContext().setAttribute("res", cur.getArr());
//                getServletContext().setAttribute("lastInfo", el);
//                request.setAttribute("bss", cur);
            }
        } catch (Exception e) {
            getServletContext().setAttribute("error", e.getMessage());
            System.out.println(e.getMessage()); //just for check
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        }

    }

}