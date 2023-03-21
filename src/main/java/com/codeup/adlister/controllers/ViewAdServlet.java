package com.codeup.adlister.controllers;
import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ViewAdServlet", value = "/ViewAdServlet")
public class ViewAdServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Long adID = Long.parseLong(request.getParameter("id"));
        Ad ad = DaoFactory.getAdsDao().fetchAdByID(adID);
        System.out.println(ad);
        request.setAttribute("fetchedAd", ad);
        request.getRequestDispatcher("/WEB-INF/ads/viewAd.jsp").forward(request, response);


    }
}
