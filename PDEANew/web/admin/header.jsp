<%-- 
    Document   : header
    Created on : Jun 16, 2016, 10:38:09 AM
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
            <jsp:include page="adminUserChk.jsp" />
            
            <div id="templatemo_logo_section">
            	<img src="../images/logo1.png" style="margin-top: -16px; height: 80px"   alt=""/>
            </div>
            
            <div id="templatemo_search_box">
               
                 <div style="float: right; color: #8A4500" >
                  <span id="date">
                         
                  </span>
                  
              </div>
                <div >
                    <b><font>${sessionScope.user}</font></b></br>
                       <b><a href="../Logout" >Log Out</a></b>
                </div>
          </div>
    </body>
</html>
