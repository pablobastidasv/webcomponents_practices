package com.pablobastidas.servlet;

import com.pablobastidas.model.BeerExpert;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Servlet para consultar la información
 *
 * Created by pbastidas on 3/24/15.
 */
public class BeerSelected extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String c = request.getParameter("color");
        BeerExpert be = new BeerExpert();
        List<String> brands = be.getBrands(c);

        request.setAttribute("style", brands);

        request.getRequestDispatcher("result.jsp").forward(request, response);

    }
}
