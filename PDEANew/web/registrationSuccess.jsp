<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Welcome to PDEA E-Tender Portal</title>
<meta name="keywords" content="free etendering  by pdea  " />
<meta name="description" content="Maintain and developed by divinity technologies,pune" />
<link href="style.css" rel="stylesheet" type="text/css" />
<!--  Free CSS Template | Designed by TemplateMo.com  --> 
<!--  Slimbox Credit Link | http://www.digitalia.be/software/slimbox2  -->
<link rel="stylesheet" href="style/slimbox2.css" type="text/css" media="screen" />
<link rel="stylesheet" href="style/login.css" type="text/css" media="screen" />
<link rel="stylesheet" href="style/table.css" type="text/css" media="screen" />
<script type="text/javascript" src="style/jquery.min.js"></script>
<script type="text/javascript" src="style/slimbox2.js"></script>
<script type="text/javascript" src="stopBack.js"></script>



</head>
<body>
    <div id="templatemo_background_section_top">
    
    	<div class="templatemo_container">
        	<div id="templatemo_logo_section">
            	<img src="images/logo1.png" style="margin-top: -16px; height: 80px"   alt=""/>
            </div>
            
            <div id="templatemo_search_box">
                 <div style="float: right; color: #8A4500" >
                  <span id="date">
                         
                  </span>
                  
              </div>
           	 
            	<form action="index.html" method="post">
    	            	<input type="text" value="Search" id="textfield" onfocus="clearText(this)" onblur="clearText(this)"/>
        	            <input type="submit" name="Search" value="Search" alt="Search" id="button" title="Search" />
			  </form>
          </div>
            
            <div id="templatemo_menu_section">
               
                 <ul id="nav_m">
	<li class="top_m"><a href="home.jsp" class="top_link_m"><span>HOME</span></a></li>
        <li class="top_m"><a href="aboutpdea.jsp" id="about" class="top_link_m"><span>About PDEA</span></a></li>
        <li class="top_m"><a href="accountpdea.jsp" class="top_link_m"><span>My Account</span></a></li>
        <li class="top_m"><a class="top_link_m" href="contactus.jsp"><span>Rules</span></a></li>
	<li class="top_m"><a href="contactus.jsp"   class="top_link_m"><span>Contact Us</span></a></li>
        <li class="top_m"><a href="contactus.jsp"   class="top_link_m"><span>FAQ</span></a></li>
        
       </ul>
            
			</div>
        </div>
    </div><!-- End Of Top Background -->
<div class="site_content">
    <c:choose>
        <c:when test= "${sessionScope.result=='SUCCESS'}">
            <div class="alert-box success">
                 <span>successful</span><br>
                     Your Vendor registration done successfully with login id : <B>${sessionScope.ID}</B><br>
                        <a href="login.jsp?cat=vender">Login</a> to continue.
            </div>
        </c:when>
        <c:when test= "${sessionScope.result=='ERROR'}">
            <div class="alert-box error">
                 <span>Error</span><br>
                     Something went wrong. Registration Failed.<br>
                       Please  <a href="registration.jsp">Try Again</a>.
            </div>
        </c:when>
        <c:otherwise>
            <c:redirect url="/home"/>
        </c:otherwise>
    </c:choose>
            <c:remove var="result" scope="session" /><c:remove var="ID" scope="session" />
            
                         
        
                </div>
               <p></p>
        <div id="templatemo_footer">
        	Copyright © 2016 Pune District Education Association,Pune | <a href="http://www.etenderingpdeapune.org" target="_parent">Website Developed and Maintain</a> by <a href="http://www.divinityindia.in" target="_parent">Divinity Technologies,Pune</a>
        </div>
        </div><!-- End Of container -->
    </div><!-- End Of Middle Background -->
</body>
<!--  Designed by www.divinityindia.in --> 
</html>