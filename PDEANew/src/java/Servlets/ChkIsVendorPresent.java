/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Model.VendorRegistrationDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author divinity
 */
public class ChkIsVendorPresent extends HttpServlet {
@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String vendor=request.getParameter("val");
        String cat=request.getParameter("cat");
        try{
            VendorRegistrationDao dao= new VendorRegistrationDao();
            String result=dao.getUserPresentStatus(vendor, cat);
            
                out.print(result);
            
        
        
        }catch(Exception e)
        {
            
        }
        
    }
}
