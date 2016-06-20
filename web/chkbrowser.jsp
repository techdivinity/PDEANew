<%-- 
    Document   : chkbrowser
    Created on : Mar 4, 2016, 1:13:47 PM
    Author     : divinity
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%
                   String ua = request.getHeader("User-Agent");
                   boolean isChrome = (ua != null && ua.indexOf("Chrome/") != -1);
                   boolean isFirefox = (ua != null && ua.indexOf("Firefox/") != -1);
                   boolean isOpera = (ua != null && ua.indexOf("OPR/") != -1);
                   //out.print("  OPERA="+isOpera+"  CHROME="+isChrome+"  FIREFOX="+isFirefox);
                   int go=0;
                   
                   if (isFirefox) 
                   {
                       //out.print("   I am Firefox  ");
                        String subsString = ua.substring( ua.indexOf("Firefox"));
                        String Info[] = (subsString.split(" ")[0]).split("/");
                        String browsername = Info[0];
                        String browserversion = Info[1];
                        String ver=browserversion.split("\\.")[0];
                        int v=Integer.parseInt(ver);
                        if(v>=30){go=1;}
                    } 
                   else if (isOpera)
                   {
                       //out.print("   I am Opera  ");
                       String subsString = ua.substring( ua.indexOf("OPR"));
                        String Info[] = (subsString.split(" ")[0]).split("/");
                        String browsername = Info[0];
                        String browserversion = Info[1]; 
                         String ver=browserversion.split("\\.")[0];
                        int v=Integer.parseInt(ver);
                        if(v>=30){go=1;}
                   }
                   else if (isChrome) 
                   {
                       //out.print("   I am Chrome  ");
                        String subsString = ua.substring( ua.indexOf("Chrome"));
                        String Info[] = (subsString.split(" ")[0]).split("/");
                        String browsername = Info[0];
                        String browserversion = Info[1];
                        String ver=browserversion.split("\\.")[0];
                        int v=Integer.parseInt(ver);
                        if(v>=38){go=1;}
                    }
                   
                   if(go==0)
                   {
                       %>
                       <jsp:forward page="browsersupperror.jsp" />
                        <%
                   }
        %>
    </body>
</html>
