package com.codeup.adlister.controllers;
import com.codeup.adlister.dao.DaoFactory;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ViewAdServlet", value = "/ViewAdServlet")
public class ViewAdServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Long adID = Long.parseLong(request.getParameter("id"));
        request.setAttribute("fetchedAd", DaoFactory.getAdsDao().fetchAdByID(adID));
        request.getRequestDispatcher("/WEB-INF/ads/viewAd.jsp").forward(request, response);

    }
}
