/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Bean.ListBean;
import Model.UploadListDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author divinity
 */
public class UploadListSuccess extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession(true);
        
        try{
            ListBean bean=new ListBean();
            bean.setFile(request.getParameter("file"));
            bean.setListType(request.getParameter("listType"));
            String[] headers=request.getParameterValues("header");
            bean.setHeaders(headers);
            String[] allowedCID=request.getParameterValues("selectCollege");
            bean.setAllowedCIDUniq(new HashSet<String>(Arrays.asList(allowedCID)).toArray(new String[0]));
            ArrayList<String[]> elements = new ArrayList<String[]>();
            for(int i=0;i<headers.length;i++)
            {
                elements.add(request.getParameterValues(""+i));
            }
            bean.setElements(elements);
        
            UploadListDao dao=new UploadListDao();
            String result=dao.uploadList(bean);
            out.print(result);
            if(result.equals("SUCCESS"))
            {
                session.setAttribute("msg", result);
                response.sendRedirect("uploadResult.jsp");
            }
            else
            {
                session.setAttribute("msg", "ERROR");
                response.sendRedirect("uploadResult.jsp");
            }
            
        }
        catch(Exception e)
        {
            out.print(e);
        }
        
    }
}
