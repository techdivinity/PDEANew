/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Bean.NewVendorBean;
import Model.VendorRegistrationDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

 import org.apache.commons.fileupload.*;
 import org.apache.commons.io.output.*;
 import org.apache.commons.fileupload.servlet.*;
 import org.apache.commons.fileupload.disk.*;
 import java.io.*;
 import java.util.*;
import javax.servlet.http.HttpSession;

/**
 *
 * @author divinity
 */
public class AddNewVendor extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       PrintWriter out = response.getWriter();
       HttpSession session = request.getSession(true);
        NewVendorBean bean=new NewVendorBean();
       try{
            DiskFileItemFactory factory = new DiskFileItemFactory();

            ServletFileUpload sfu = new ServletFileUpload(factory);
            List items = sfu.parseRequest(request);

            Iterator iter = items.iterator();//out.print("  1");

            while (iter.hasNext()) 
            { 
               FileItem item = (FileItem) iter.next();
               String fieldName = item.getFieldName();
               switch(fieldName)
               {
                  case "mailID" :bean.setEmail(item.getString());//out.print(" 1 "+email+"<br> ");
                       break;
                  case "pass": bean.setPass(item.getString());//out.print(" 3 "+pass+" <br>");
                       break;
                  case "questions": bean.setQus(item.getString());//out.print(" 3 "+pass+" <br>");
                       break;
                  case "ans": bean.setAns(item.getString());//out.print(" 3 "+pass+" <br>");
                       break;
                  case "firmName": bean.setCompanyName(item.getString());//out.print(" 5 "+companyName+" <br>");
                       break;
                  case "phno": bean.setPhno1(item.getString()); //out.print(" 6 "+phno1+" <br>");
                       break;
                  case "phno2": bean.setPhno2(item.getString());//out.print(" 7 "+phno2+" <br>");
                       break;
                  case "address": bean.setAddress(item.getString());//out.print(" 8 "+address+" <br>");
                       break;
                  case "SAN": bean.setSAN(item.getString());//out.print(" 9 "+SAN+" <br>");
                       break;
                  case "CST": bean.setCST(item.getString());//out.print(" 10 "+CST+" <br>");
                       break;
                  case "VAT": bean.setVAT(item.getString());//out.print(" 11 "+VAT+" <br>");
                       break;
                  case "PAN": bean.setPAN(item.getString());//out.print(" 12 "+PAN+" <br>");
                       break;
                  case "TAN": bean.setTAN(item.getString());//out.print(" 13 "+TAN+" <br>");
                       break;
                  case "web": bean.setWeb(item.getString());//out.print(" 14 "+web+" <br>");
                       break;
                  case "IT": bean.setB(item.get());
                       break;
                  case "skilled": bean.setSkilled(item.getString());//out.print(" 25 "+skilled+" <br>");
                       break;
                  case "nonSkilled": bean.setNonSkilled(item.getString());//out.print(" 26 "+nonSkilled+" <br>");
                       break;

                  case "category": 
                                  switch(item.getString())
                                  {
                                      case "Benches": bean.setBench(true);
                                          break;
                                      case "Black Board": bean.setBlackbord(true);
                                          break;
                                      case "Books": bean.setBook(true);
                                          break;
                                      case "Chemical Material": bean.setChemical(true);
                                          break;
                                      case "Glassware Material": bean.setGlassware(true);
                                          break;
                                      case "I-card & material": bean.setIcard(true);
                                          break;
                                      case "Sports Material": bean.setSports(true);
                                          break;
                                      case "Steal Furniture": bean.setSteel(true);
                                          break;
                                      case "Wooden Furniture": bean.setWooden(true);
                                          break;
                                      case "Science Instruments": bean.setScienceInstru(true);
                                          break;

                                  }
               }
            }
            VendorRegistrationDao dao=new VendorRegistrationDao();
            String result=dao.addVendor(bean);
            out.print(result);
            if(result.equals("SUCCESS")) 
            {
                session.setAttribute("result", "SUCCESS");
                session.setAttribute("ID", bean.getEmail());
                response.sendRedirect("registrationSuccess.jsp");
            }
            else
            {
                session.setAttribute("result", "ERROR");
                response.sendRedirect("registrationSuccess.jsp");
            }
        
        
        }catch(Exception e)
        {
            e.printStackTrace(new java.io.PrintWriter(out));
        }
       
       
       
    }


}
