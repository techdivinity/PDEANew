<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<title>Welcome to PDEA E-Tender Portal</title>
<meta name="keywords" content="free etendering  by pdea  " />
<meta name="description" content="Maintain and developed by divinity technologies,pune" />
<link href="style.css" rel="stylesheet" type="text/css" />
<link href="style/table.css" rel="stylesheet" type="text/css" />
<!--  Free CSS Template | Designed by TemplateMo.com  --> 
<!--  Slimbox Credit Link | http://www.digitalia.be/software/slimbox2  -->
<link rel="stylesheet" href="style/slimbox2.css" type="text/css" media="screen" />
<link rel="stylesheet" href="style/login.css" type="text/css" media="screen" />
<script type="text/javascript" src="style/jquery.min.js"></script>
<script type="text/javascript" src="style/slimbox2.js"></script>
<script type="text/javascript" src="loginJS.js"></script>
<script type="text/javascript" src="stopBack.js"></script>
<script language="javascript" type="text/javascript">
window.onload = function () {
document.getElementById("js").style.display='none';
};
</script>


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
	<li class="top_m"><a href="home" class="top_link_m"><span>HOME</span></a></li>
        <li class="top_m"><a href="aboutpdea.jsp" id="about" class="top_link_m"><span>About PDEA</span></a></li>
        <li class="top_m"><a href="accountpdea.jsp" class="top_link_m"><span>My Account</span></a></li>
        
	<li class="top_m"><a href="contactus.jsp"   class="top_link_m"><span>Contact Us</span></a></li>
        <li class="top_m"><a href="faq.jsp"   class="top_link_m"><span>FAQ</span></a></li>
        
       </ul>
            
			</div>
        </div>
    </div><!-- End Of Top Background -->
    <div id="js" style="border: 1px solid #AAA;background: yellow;font-weight: bold;"><marquee behavior="alternate" scrollamount="2"><font color="red">JavaScript seems to be off, Please turn it on for better performance.</font></marquee></div>
    <script>document.getElementById("js").style.display='none';</script>
    <jsp:include page="chkbrowser.jsp"/>
    <div id="site_content">
        <c:set var="cat" value="${param.cat}" scope="page"/>
        <c:set var="cat1" value="${requestScope.cat}" scope="page"/>
        <c:if test="${cat1 != null}">
            <c:set var="cat" value="${cat1}" />
        </c:if>
        <c:choose>
            <c:when test= "${cat=='null'}">
                <c:set var="cat" />null
            </c:when>
            <c:when test= "${cat!='null'}">
                <c:choose>
                    <c:when test= "${cat=='admin'}">
                        <c:set var="catDisplay" value="Headquarter" scope="page"/>
                    </c:when>
                    <c:when test= "${cat=='college'}">
                        <c:set var="catDisplay" value="Branch" scope="page"/>
                    </c:when>
                    <c:when test= "${cat=='vender'}">
                        <c:set var="catDisplay" value="Vendor" scope="page"/>
                    </c:when>
                    <c:when test= "${cat=='contractor'}">
                        <c:set var="catDisplay" value="Civil Contractor" scope="page"/>
                    </c:when>
                    <c:otherwise>
                        <c:set var="catDisplay" value="W" scope="page"/>
                    </c:otherwise>
                </c:choose>
                
            </c:when>
            <c:otherwise></c:otherwise>
        </c:choose>

        </br></br>  
    <center>    
                
<!--                        <div style="border: 1px solid #AAA;width: 740px;background: #ccffcc;border-radius: 15px;margin-bottom: 1px;height: 25px;line-height: 25px; font-size: 15px; color: #505050;font-family: serif">
                            <b><font color="brown">PDEA LOGIN</font></b>
                        </div>-->
                        <div style="border: 1px solid white;height: 300px;width: 740px;">
                            <div style="float: left;height: 200px;width: 240px; " >
                                <div style="height: 130px;background: #ccffcc;border: 1px solid #AAA;border-right: 1px solid #ccffcc;border-top-left-radius: 15px;">
                                    <!--<p style="margin-top: auto"/>-->
                                    <div class="homLogin" style="margin-top: 5px;width: 180px;" >
                                        <a style="cursor:pointer;" onclick="logcat('admin')" >Headquarter Login</a>
                                    </div>
                                    <div class="homLogin" style="width: 180px;" >
                                        <a style="cursor:pointer;" onclick="logcat('college')" >Branch Login</a>
                                    </div>
                                    <div class="homLogin"style="width: 180px;">
                                        <a style="cursor:pointer;" onclick="logcat('vender')" >Vendor Login</a>
                                    </div>
                                    <div class="homLogin"style="width: 180px;" >
                                        <a style="cursor:pointer;" onclick="logcat('contractor')" >Civil Contractor Login</a>
                                    </div>
                                </div>
                                <!--<p style="margin-top: "/>-->
                                <div style="height: 100px; border: 1px solid #AAA;border-top: none;border-left:1px solid #FFF;border-bottom: 1px solid #FFF;border-right: 2px solid #AAA ; background: #FFF;">
                                    <!--<p style="padding-top: 5px;"/>-->
                                    <br>
                                    <div class="LoginReg" style="margin-top: 0px" >
                                        <a  href="branchRegistration.jsp">Branch Registration</a>
                                    </div>
                                    <div class="LoginReg" >
                                        <a href="registration.jsp">Vendor Registration</a>
                                    </div>
                                    <div class="LoginReg" >
                                        <a href="registrationCivil.jsp">Civil Contractor Registration</a>
                                    </div>
                                </div>
                        </div>
                      
                            <div id="wrapper"  style=" border: 1px solid #AAA;border-left: none; width: 500px;height: 231px;float: right; background: #ccffcc;border-top-right-radius: 15px;border-bottom-right-radius: 15px;margin-left: -1px">
                <br>
                    <c:if test="${requestScope.temp !=null}">
                        <div class="alert-box error" style="width: 360px">
                            <font color="red"><b>${requestScope.temp}</b></font>
                        </div>
                    </c:if>
            
                
            <form action="Login" method="post" onsubmit="return valid()">
                <noscript>
            <input type="hidden" name="JavaScript" value="false" />
          </noscript>
                <div id="login" style="">
                <table id="simple">
                    <tr><td style="background:#ccffcc ">
                    <fieldset style="width: 400px; border: 1px solid #AAA; background: #EFF;border-radius: 15px;">
                        <legend style="border: 1px solid #AAA; background: #EFF;border-radius: 5px;"><b><font color="#00719f">&nbsp;&nbsp; ${catDisplay} Log in &nbsp;&nbsp;</font></b></legend>
                        <br>              
                        <table id="simple" align="center">
                            <tr><td style="background: #EFF;color:#424242;width: 150px"><b>${catDisplay} Login ID</b></td>
                                <td style="background: #EFF">
                                    <span id="unSpan"></span>
                                    <input type="email" name="userName" id="name"  oninvalid="this.setCustomValidity('Invalid Login ID.')" oninput="setCustomValidity('')" required/> 
                                </td></tr>
                            <tr><td style="background: #EFF;color:#424242;"><b>Password</b></td>
                                <td style="background: #EFF">
                                    <span id="passSpan"></span>
                                    <input type="password" name="passWord" id="pass"  required/>
                                </td></tr>
                            <tr><td style="background: #EFF;padding: 2px"></td><td style="background: #EFF"></td></tr>
                            <tr><td colspan="2"  style="background: #EFF">
                                <input type="hidden" value="${cat}" name="category"/>
                                <input type="submit" name="login" class="colorbutton" value="    Login    " style="float: right"/>
                                <c:choose>
                                    <c:when test= "${catDisplay=='Vendor' || catDisplay=='Civil Contractor'}">
                                        <a href="resetPass.jsp" style="font-size: 11px; ">
                                    Forgot Password ?</a>
                                    </c:when>
                                    <c:when test= "${catDisplay=='Headquarter'}">
                                        <a href="resetPassadm.jsp" style="font-size: 11px; ">
                                    Forgot Password ?</a>
                                    </c:when>
                                </c:choose>
                                </td></tr>
                        </table>
                    </fieldset>  
                </td></tr>
                </table>
                </div>
                                <c:if test="${catDisplay=='W'}">
                                    <script type="text/javascript">
                                        hideDiv();
                                        </script>
                                </c:if>
                                
        </form>
                                    <br>
    </div>
                        </div>
                </center>
    <br><br>
    </div>
                  
                <p></p>
        <div id="templatemo_footer">
        	Copyright © 2016 Pune District Education Association,Pune | Website Developed and Maintain by <a href="http://www.techdivinity.com" target="_parent">Tech Divinity ,Pune</a>
        </div>
        </div><!-- End Of container -->
    </div><!-- End Of Middle Background -->
</body>
<!--  Designed by www.divinityindia.in  --> 
</html>
