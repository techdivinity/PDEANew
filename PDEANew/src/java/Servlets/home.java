/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Model.HomeDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author divinity
 */
public class home extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        
        try
        {
            HomeDao dao=new HomeDao();
            ArrayList<String[]> list=dao.getActiveTender();
            for(int i=0;i<list.size();i++)
            {
                out.print(list.get(i)[0]+" "+list.get(i)[1]+" "+list.get(i)[2]+" "+list.get(i)[3]+" ");
            }
            
            request.setAttribute("info", list);
            RequestDispatcher dispatcher = request.getRequestDispatcher("home.jsp");
            dispatcher.forward( request, response );
        }
        catch(Exception e)
        {

        }
        
        
        
        
    }


}
