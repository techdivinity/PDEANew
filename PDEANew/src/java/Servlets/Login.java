/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Com.MD5;
import Model.loginAttrib;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author divinity
 */
public class Login extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        PrintWriter out = response.getWriter();  
        HttpSession session = request.getSession(true); 
        String user=request.getParameter("userName");
        String pass=request.getParameter("passWord");
        String cat=request.getParameter("category");
        String javaScript = request.getParameter("JavaScript");
        if(javaScript!=null && javaScript.equals("false"))
        {
            response.sendRedirect("home.jsp");
        }
        MD5 m=new MD5();
        String pw=null;
        try {
            pw=m.getpass(pass);
        } catch (Exception ex) {
            
        }
        
        try
        {

    
        
            if(cat.equals("admin"))
            {
                String category=loginAttrib.getCategory(user, pw);
                
                if(category!=null)
                {
                    out.print(category);
                    switch (category)
                    {
                        case "account" : session.setAttribute("user", user);
                                       session.setAttribute("category", category);
                                       response.sendRedirect("admin/admin.jsp");
                                       break;
                        case "building" : session.setAttribute("user", user);
                                       session.setAttribute("category", category);
                                       response.sendRedirect("building.jsp");
                                       break;
                        default:request.setAttribute("temp", category);
                                request.setAttribute("cat", cat);
                                RequestDispatcher dispatcher = request.getRequestDispatcher("/login.jsp");
                                dispatcher.forward( request, response );    
                    }
                }
                else
                {
                    request.setAttribute("temp", "Invalid Login Details !!!");
                    request.setAttribute("cat", cat);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/login.jsp");
                    dispatcher.forward( request, response );
                }
            }
            else
            {
//                String passCat="login"+cat;
                String go=loginAttrib.ChkUserPass(user, pw, cat);
                if(go!=null)
                {
                    session.setAttribute("user", user);
                    session.setAttribute("category", cat);
                    session.setAttribute("id", go);
                    response.sendRedirect(cat+"/"+cat+".jsp");
                }
                else
                {
                    request.setAttribute("temp", "Invalid Login Details !!!");
                    request.setAttribute("cat", cat);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/login.jsp");
                    dispatcher.forward( request, response );
                }
            }
    
    
        }
        catch (Exception e){}
        out.close();
    }

    
}
