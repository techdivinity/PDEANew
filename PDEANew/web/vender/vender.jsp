<%-- 
    Document   : vender
    Created on : Jun 15, 2016, 6:18:34 PM
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
        <h1>Hello World!</h1>
        Server Version: <%= application.getServerInfo() %><br> Servlet Version: <%= application.getMajorVersion() %>.<%= application.getMinorVersion() %> JSP Version: <%= JspFactory.getDefaultFactory().getEngineInfo().getSpecificationVersion() %> <br>
    </body>
</html>
