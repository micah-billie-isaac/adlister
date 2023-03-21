package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "controllers.RegisterServlet", urlPatterns = "/register")
public class RegisterServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");


        // validate input
        boolean inputHasErrors = username.isEmpty()
            || email.isEmpty()
            || password.isEmpty();

        if(DaoFactory.getUsersDao().findByUsername(username) != null){
            request.setAttribute("req0", "username error");
            request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request,response);
        }

        if(username.length() < 3){
            request.setAttribute("req1", "username error");
            request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request,response);
            return;

        }
        if(username.length() > 15){
            request.setAttribute("req2", "username error");
            request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request,response);
            return;

        }
        if(password.length() < 8){
            request.setAttribute("req3", "password error");
            request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request,response);
            return;
        }


        if (inputHasErrors) {
            response.sendRedirect("/register");
            return;
        }






        // create and save a new user
        User user = new User(username, email, password);
        DaoFactory.getUsersDao().insert(user);
        response.sendRedirect("/login");
    }
}
