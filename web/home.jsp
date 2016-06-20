<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Welcome To PDEA E Tender Portal</title>
<meta name="keywords" content="free etendering  by pdea  " />
<meta name="description" content="Maintain and developed by divinity technologies,pune" />
<link href="style.css" rel="stylesheet" type="text/css" />
<link href="style/table.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="style/slimbox2.css" type="text/css" media="screen" />
<link rel="stylesheet" href="style/login.css" type="text/css" media="screen" />
<script type="text/javascript" src="style/jquery.min.js"></script>
<script type="text/javascript" src="style/slimbox2.js"></script>
<script type="text/javascript" src="loginJS.js"></script>
<script type="text/javascript" src="stopBack.js"></script>
<script type="text/javascript">
window.onload = function () {
//        setInterval("",6000);
//        
        
        document.getElementById("loadingimage").style.display='none';
        document.getElementById("js").style.display='none';
        toggleLogin(0);
};

</script>

</head>
<body>
    <div id="loadingimage">
        <!--<img src="images/Preloader_21.gif"/> <b>Please turn on javascript</b>-->
</div>
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
          <li class="top_m"><a href="login.jsp" class="top_link_m"><span>My Account</span></a></li>
          
	<li class="top_m"><a href="contactus.jsp"   class="top_link_m"><span>Contact Us</span></a></li>
        <li class="top_m"><a href="faq.jsp"   class="top_link_m"><span>FAQ</span></a></li>
         
                    
       </ul>
            </div>
        </div>
    </div><!-- End Of Top Background -->
    
    
    <div id="js" style="border: 1px solid #AAA;background: yellow;font-weight: bold;"><marquee behavior="alternate" scrollamount="2"><font color="red">JavaScript seems to be off, Please turn it on for better performance.</font></marquee></div>
    <script>document.getElementById("js").style.display='none';</script>
    
    <div id="templatemo_background_section_mid" > 
         <!--<marquee scrollamount="4">e-Procurement System Pune District Education Association,Pune</marquee>-->
    	<div class="templatemo_container">
        <div id="templatemo_content_area" style="margin-top: 10px;">
        	<div id="templatemo_left_section">
                <div class="templatemo_left_section_box" style="width: 615px">
                    <marquee scrollamount="4">e-Procurement System Pune District Education Association,Pune</marquee>
                	<div class="templatemo_left_section_box_top" >Welcome To Pune District Education Association's E-Tendering Portal</div>
                        <div class="site_content" style="width: 595px;padding: 10px">
                            <jsp:include page="chkbrowser.jsp"/>
        <div >
            <table id="simple" width="100%">
                <tr><td>
            <div>
        <img src="images/20.jpg" alt="President" width="98px" height="135px"/>
        <center>President<br>Ajit Pawar</center>
        
            </div></td>
                    <td style="vertical-align: top">
                        <div>
    <p style="font-size: 12px;">

<!--        The Pune District Education Association,Pune Portal of Semi-Government 
    of India facilitates all the schools and colleges comes under Pune District Education Association 
    to publish their Tender Enquiries, 
    Corrigendum and Award of Contract details. 
    The system also enables the users to migrate to total electronic procurement mode. </p>-->
    This portal facilitates all the schools and colleges coming under
    Pune District Education for centralised purchasing of chemicals, equipments, books, 
    journals etc that will ensure for competitive bidding and ultimately reducing the 
    cost of purchase. The e-tendering software will provide platform for schools, 
    colleges and association to work cohesively to get good quantity of stuff. 
    The system also enables the user including vendors to migrate to total 
    electronic procurement mode.
    <p style="font-size: 12px;">
    The primary objective of this portal is to provide a single point access 
    to the information on procurements made across various colleges vendor and supplier.</p>
            </div>
                    </td></tr>
            </table>
        </div><br>
            <table width="100%" style="border: none" >
                 <tr>
                <th style="background:#0e99c7;width: 30%;text-align: left;border-top-left-radius: 7px;">Tender Name</th>
                <th style="background:#0e99c7;width: 40%;text-align: left">Description</th>
                <th style="background:#0e99c7;width: 15%;text-align: left">End Date</th>
                <th style="background:#0e99c7;width: 15%;text-align: left;border-top-right-radius: 10px;">Department</th>
            </tr>
            </table >
            <%  SimpleDateFormat dt=new SimpleDateFormat("dd/MM/yyyy");
                  
                InitialContext initialContext = new InitialContext();
                Context context = (Context) initialContext.lookup("java:comp/env");
                DataSource ds = (DataSource) context.lookup("pdea");
                Connection con = ds.getConnection();
                
                String sql1 = "SELECT * FROM tender where CURDATE() BETWEEN startDate and endDate";
                PreparedStatement stmt1 = con.prepareStatement(sql1);
                ResultSet rs1 = stmt1.executeQuery();
            %>
            <div style="background: #F5F5F5;border: 1px solid #AAA;border-top: none;border-bottom-left-radius: 10px;border-bottom-right-radius: 10px; height: 160px;"> 
           <marquee behavior="scroll" direction="up" scrollamount="3" height="150" onmouseover="marq(1,this)" onmouseout="marq(2,this)">
            <table class="homTable"  width="100%" style="border: none">
            <% 
              while(rs1.next())
              {
                  String dep=rs1.getString("tenderType");
                  if(dep.equals("1")||dep.equals("2")||dep.equals("5")){dep="Account";}
                  else if(dep.equals("3")||dep.equals("4")){dep="Building";}
                  %><tr>
                      <td><a href="login.jsp"><%=rs1.getString("tenderName")%></a></td>  
                      <td><%=rs1.getString("description")%></td> 
                      <td><%=dt.format(rs1.getDate("endDate"))%></td> 
                      <td><%=dep%></td> 
                    </tr>
                    <%
              }
              
            %>
            </table></marquee></div>
            <% rs1.close();stmt1.close();con.close();
            %>
                </div>
 </div>

  </div><!-- End Of left Section -->
  <div id="templatemo_right_section" style="background: #FFF;border-radius: 15px;">
            
                
                <div class="templatemo_right_section_box" style="background: #ccffcc;margin: auto;margin-top: 20px;border-radius: 15px;">
                	
                           <!--<section class="container">-->
                              
<!--        <div class="loginBox">
    <fieldset style="border: 1px solid #AAA;background: #EFF">
        <legend style="background: #FFF;border: 1px solid #AAA;"><b><font color="#00719f">Log in to PDEA</font></b></legend>
          
       <form action="login" method="post" onsubmit="return valid()">
           <center>
               <br>
                   <table id="simple" >
               <tr ><td style="background:#EFF ">
                        <span id="unSpan"></span>
                        <input type="email" name="userName" id="name" placeholder="Login ID" style="width: 200px" oninvalid="this.setCustomValidity('Invalid User Name.')" oninput="setCustomValidity('')"/> 
                   </td></tr>
               <tr><td style="background:#EFF ">
                        <span id="passSpan"></span>
                        <input type="password" name="passWord" id="pass" placeholder="Password" style="width: 200px" />
                   </td></tr>     

        <tr><td style="background:#EFF ">
                <a href="resetPass.jsp" style="font-size: 11px">Forgot Password ?</a>
            <input type="submit" name="login" value="Login" style="float: right"/>
        </td></tr>
        
           </table>
                   <br>
           </center>
        </p>
          </form>

       </fieldset>
        <br>

    <div class="login-help">
      <p>Forgot your password? <a href="index.html">Click here to reset it</a>.</p>
      <a href="registration.jsp">&#9679 New Vender Registration </a><br>
      <a href="registrationCivil.jsp">&#9679 New Civil Contractor Registration </a>
      
    </div>
    </div>-->

<div class="homLogin" id="T1" >
    <a style="cursor:pointer;" onclick="toggleLogin(1)">Headquarter Login</a>
</div>
<div class="homLoginDiv" id="1">
    <table class="homLogintble">
        <form action="LoginCat" method="post" onsubmit="return valid()">
          <noscript>
            <input type="hidden" name="JavaScript" value="false" />
          </noscript>
    <tr ><td>
        <span id="unSpan"></span>
        <input type="email" name="userName" id="name" placeholder="Headquarter Login ID" style="width: 200px" oninvalid="this.setCustomValidity('Invalid User Name.')" oninput="setCustomValidity('')"/> 
   </td></tr>
    <tr><td>
        <span id="passSpan"></span>
        <input type="password" name="passWord" id="pass" placeholder="Password" style="width: 200px" />
    </td></tr>     

        <tr><td ><div class='aNbutton'>
         <a href="resetPassadm.jsp" >Forgot Password ?</a>
         <input type="hidden" value="admin" name="category"/>
         <input type="submit" name="login" class="colorbutton" value="   Login   " style="float: right"/>
            </div></td></tr>
        </form>
    </table>
</div>
<div class="homLogin" id="T2" >
  <a style="cursor:pointer;" onclick="toggleLogin(2)">Branch Login</a>
</div>
<div class="homLoginDiv" id="2">
    <table class="homLogintble">
        <form action="LoginCat" method="post" onsubmit="return valid()">
            <noscript>
            <input type="hidden" name="JavaScript" value="false" />
          </noscript>
    <tr ><td>
        <span id="unSpan"></span>
        <input type="email" name="userName" id="name" placeholder="Branch Login ID" style="width: 200px" oninvalid="this.setCustomValidity('Invalid User Name.')" oninput="setCustomValidity('')"/> 
   </td></tr>
    <tr><td>
        <span id="passSpan"></span>
        <input type="password" name="passWord" id="pass" placeholder="Password" style="width: 200px" />
    </td></tr>     

        <tr><td ><div class='aNbutton'>
         <a href="resetPass.jsp" >Forgot Password ?</a>
         <input type="hidden" value="college" name="category"/>
         <input type="submit" name="login" class="colorbutton" value="   Login   " style="float: right"/>
            </div></td></tr>
        </form>
        <tr><td></td></tr>
        <tr><td></td></tr>
        <tr><td></td></tr>
        <tr><td></td></tr>
        <tr><td style='border:'><div class="aForRegister">&#10148; Don't have ID??  Register <a href="branchRegistration.jsp">HERE.</a></div> </td></tr>
    </table>
</div>
<div class="homLogin"id="T3" >
   <a style="cursor:pointer;" onclick="toggleLogin(3)">Vendor Login</a>
</div>
<div class="homLoginDiv" id="3">
    <table class="homLogintble">
        <form action="LoginCat" method="post" onsubmit="return valid()">
            <noscript>
            <input type="hidden" name="JavaScript" value="false" />
          </noscript>
    <tr ><td>
        <span id="unSpan"></span>
        <input type="email" name="userName" id="name" placeholder="Vendor Login ID" style="width: 200px" oninvalid="this.setCustomValidity('Invalid User Name.')" oninput="setCustomValidity('')"/> 
   </td></tr>
    <tr><td>
        <span id="passSpan"></span>
        <input type="password" name="passWord" id="pass" placeholder="Password" style="width: 200px" />
    </td></tr>     

        <tr><td ><div class='aNbutton'>
         <a href="resetPass.jsp" >Forgot Password ?</a>
         <input type="hidden" value="vender" name="category"/>
         <input type="submit" name="login" class="colorbutton" value="   Login   " style="float: right"/>
            </div></td></tr>
        </form>
        <tr><td></td></tr>
        <tr><td></td></tr>
        <tr><td></td></tr>
        <tr><td></td></tr>
        <tr><td style='border:'><div class="aForRegister">&#10148; Don't have ID??  Register <a href="registration.jsp">HERE.</a></div> </td></tr>
    </table>
</div>
<div class="homLogin" id="T4" >
    <a style="cursor:pointer;" onclick="toggleLogin(4)">Civil Contractor Login</a>
</div>
<div class="homLoginDiv" id="4" >
    <table class="homLogintble">
        <form action="LoginCat" method="post" onsubmit="return valid()">
            <noscript>
            <input type="hidden" name="JavaScript" value="false" />
          </noscript>
    <tr ><td>
        <span id="unSpan"></span>
        <input type="email" name="userName" id="name" placeholder="Civil Contractor Login ID" style="width: 200px" oninvalid="this.setCustomValidity('Invalid User Name.')" oninput="setCustomValidity('')"/> 
   </td></tr>
    <tr><td>
        <span id="passSpan"></span>
        <input type="password" name="passWord" id="pass" placeholder="Password" style="width: 200px" />
    </td></tr>     

        <tr><td ><div class='aNbutton'>
         <a href="resetPass.jsp" >Forgot Password ?</a>
         <input type="hidden" value="contractor" name="category"/>
         <input type="submit" name="login" class="colorbutton" value="   Login   " style="float: right"/>
            </div></td></tr>
        </form>
        <tr><td></td></tr>
        <tr><td></td></tr>
        <tr><td></td></tr>
        <tr><td></td></tr>
        <tr><td style='border:'><div class="aForRegister">&#10148; Don't have ID??  Register <a href="registrationCivil.jsp">HERE.</a></div> </td></tr>
    </table>
</div>
        




  <!--</section>-->
              </div>
                
                <div class="templatemo_right_section_box" style="background: #ccffcc;margin: auto;margin-top: 20px;margin-bottom: 20px;border-radius: 15px;">
                    
                    <div>
                        
                        <div class="homLogin" >
                            <a href="branchRegistration.jsp">Branch Registration</a>
                        </div>
                        <div class="homLogin" >
                            <a href="registration.jsp">Vendor Registration</a>
                        </div>
                        <div class="homLogin" >
                            <a href="registrationCivil.jsp">Civil Contractor Registration</a>
                        </div>
                         <div class="homLogin">
                        <a href="pdea.pdf" download>About Portal</a>
                         </div>
                        <div class="homLogin">
                            <a href='sitecomp.jsp'>Site Compatibility</a>
                        </div>
                    </div>
                   
                </div>
        
<!--                <div class="templatemo_right_section_box">
                	<table id="simple" width="100%" border="0" cellpadding="0" cellspacing="0" class="table-data">
        <tr>
          <th align="left">Downloads</th>
        </tr>
       
        
        <tr>
          <td><ul class="points">
           <li><a href="Certificate.zip" target="_blank">Intermediatory Certificate.</a></li>
              <li><a href="http://www.winzip.com/downwz.htm" target="_blank">WinZip</a></li>
              <li><a href=" http://www.adobe.com/products/acrobat/readstep2.html" target="_blank">PDF Reader</a></li>
            </ul></td>
        </tr>
        <tr>
          <td>
          	<ul class="points">
              <li><a href="digitalCerti.jsp">Digital Certificate</a></li>
            </ul>
            <ul class="points">
              <li><a href="Signer.exe">Signer</a></li>
            </ul>
            <ul class="points">
              <li><a href="e-Token Driver.zip">eToken Driver</a></li>
              <li><a href="DocumentManual/WindowsXP.zip">SSL patch for Windowx XP</a></li>
              <li><a href="DocumentManual/WindowsServer2003.zip">SSL patch for Windows 2003</a></li>
            </ul>
            <ul class="points">
              <li><a href="e-Pass Driver.zip">ePass Driver</a></li>
            </ul>
           </td>
        </tr>
      </table>

                </div>-->
                
            </div><!-- End Of right Section -->
            
			<div class="cleaner_with_height">&nbsp;</div>
		</div><!-- End Of content area -->
                
        
        </div><!-- End Of container -->
        <div id="templatemo_footer">
        	Copyright © 2016 Pune District Education Association,Pune | Website Developed and Maintain by <a href="http://www.techdivinity.com" target="_parent">Tech Divinity ,Pune</a>
        </div>
    </div><!-- End Of Middle Background -->
</body>
<!--  Designed by www.divinityindia.in  --> 
</html>