/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

/**
 *
 * @author Mayuka Sanjula
 */
import beans.inbean;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "us_logincontroller", urlPatterns = {"/us_logincontroller"})
public class us_logincontroller extends HttpServlet {

 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         try {
            inbean ub = new inbean();
            ub.setUsername(request.getParameter("uname"));
            ub.setPassword(request.getParameter("pass"));
            
            String pass = ub.getPassword();
            String uname = ub.getUsername();
            String appr = "1";
            
            
            String sql = "SELECT * FROM `users` WHERE `id` ='"+uname+"' AND `password` = '"+pass+"' AND `apr` = '"+appr+"'";
            ResultSet search = DB.search(sql);
            if (search.next()) {

                HttpSession session = request.getSession();
                session.setAttribute("us_id", uname);
                String n = search.getString("username");
                String nm = search.getString("password");
                session.setAttribute("us_name", n);
                session.setAttribute("us_pass", nm);
                String an = search.getString("uniid");
                session.setAttribute("us_uniid", an);
                
                
                response.sendRedirect("us_incalendar.jsp");
                
            } else {
                response.sendRedirect("us_login_fail.jsp");
            }
        } catch (Exception ex) {
             PrintWriter out = response.getWriter();
             out.print(ex);
        }
        
    }

  

}