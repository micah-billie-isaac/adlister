package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.Category;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "DeleteAdServlet", value = "/delete")
public class DeleteAdServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        long id = Long.parseLong(request.getParameter("id"));

        List<Category> categories = DaoFactory.getAdsDao().fetchCategoriesByAdID(id);
        for (Category category : categories) {
            DaoFactory.getAdsDao().deleteCategoryAd(category.getId(), id);
        }
        DaoFactory.getAdsDao().deleteAd(id);

        response.sendRedirect("/ads");
    }
}
