<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
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
<script type="text/javascript" src="validationVenderSignUp.js"></script>
<!--<script type="text/javascript" src="stopBack.js"></script>-->
<script language="javascript" type="text/javascript">
function disHideDiv()
{
//    alert(1);
     if(document.getElementById("existing").checked == true)
     {
     document.getElementById("reciptDiv").style.display='block';
    }
     else
     {
     document.getElementById("reciptDiv").style.display='none';
    }
}
</script>
        <script>  
var request;  
window.x="Try it";
function sendInfoVendor()  
{  
    document.getElementById('mail').innerHTML="";
    var v=document.signup.mailID.value; 
    var url="ChkIsVendorPresent?val="+v+"&cat=vender";  

    if(window.XMLHttpRequest){  
    request=new XMLHttpRequest();  
    }  
    else if(window.ActiveXObject){  
    request=new ActiveXObject("Microsoft.XMLHTTP");  
    }  

    try{  
    request.onreadystatechange=getInfoVendor; 

    request.open("GET",url,true);  
    request.send();  
    }catch(e){alert("Unable to connect to server");} 
    return true;
}  
  
function getInfoVendor()
{  
    if(request.readyState==4)
    {  
        var val=request.responseText;
        var t=val.trim();

        if(t=="NOTPRESENT")
        {
         window.x="false";
        }
        else{
            window.x="true";
         document.getElementById('mail').innerHTML="<font color='red'> User already Present</font>";
         
        }
    }  
}  
function cal(){ document.getElementById("catDiv").style.border='';
    if(window.x=="true")
    {
                document.getElementById('mail').innerHTML="<font color='red'> User already Present</font>"
    return false;
    }
    else
    {
        return true;
    }
} 
  
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
    <jsp:include page="chkbrowser.jsp"/>
    <div class="site_content1">
        <center>
            <table id="simple" width="840px" style="">
                <td style="text-align: right"><a href="login.jsp">Other Registrations and Logins</a></td>
            </table>
            <div class="alert-box warning" style="background: #fff8c4;padding: auto;width: 780px">
                <span style="color: brown">Vendor Registration</span>
            </div>
            <form action="AddNewVendor" method="post" name="signup" enctype="multipart/form-data" onsubmit=" return ((cal() & chkCategry() & uplodVendor() & isGo())==1)">
        <table id="simple3">
            <tr>
                <td class="regular" style="background: #0e99c7"><font color="#FFF"> Login ID Details</font></td>
                <td class="regular" style="background: #0e99c7;border-left: none;border-right: 1px solid #AAA" colspan="2"><span id="loginMsg"></span></td>
                <!--<td class="right" colspan="2"><span id="loginMsg"></span></td>-->
            </tr>
            <tr>
                <td class="regular">Email id <span style="color:red;">*</span></td>
                <td class="regular"><span id="mail"></span><input type="email" name="mailID" placeHolder="Login ID" maxlength="50" autocomplete="off" onblur="sendInfoVendor()" required/></td>
                <td class="right"></td>
            </tr>
            <tr>
                <td class="regular">Confirm Email <span style="color:red;">*</span></td>
                <td class="regular"><input type="email" name="email2" autocomplete="off" onblur="chkRepetMailVendor()" required/><br><span id="repetMailMsg"></span></td>
                <td class="right"></td>
            </tr>
            <tr>
                <td class="regular">PassWord <span style="color:red;">*</span></td>
                <td class="regular"><span id="passMsg"></span><input type="password" name="pass" onblur="chkPassLengthVendor()"  required/></td>
                <td class="right">Length should be 6 to 12</td>
            </tr>
            <tr>
                <td class="regular">Confirm PassWord <span style="color:red;">*</span></td>
                <td class="regular"><input type="password" name="pass2" onblur="chkRepetPassVendor()"  required/><br><span id="repetPassMsg"></span></td>
                <td class="right"></td>
            </tr>
            <tr>
                <td class="regular">Security Question <span style="color:red;">*</span><font color="brown" style="font-weight: normal;font-size: 10px"> (For recovery of password)</font></td>
                <td class="regular" colspan="2" style="border-right: 1px solid #AAA">
                    <select name="questions" style="width: 300px">
                        <option>In what city were you born?</option>
                        <option>What was your favorite place to visit?</option>
                        <option>which year you join your first job?</option>
                        <option>What is the name of your first school?</option>
                        <option>What is the name of your pet?</option>
                        <option>What is your favorite color?</option>
                        <option>What is your father's middle name?</option>
                    </select> 
                </td>
                <!--<td class="right">Length should be 6 to 12</td>-->
            </tr>
            <tr>
                <td class="bottom">Answer <span style="color:red;">*</span></td>
                <td class="bottom" colspan="2"style="border-right: 1px solid #AAA;white-space: nowrap"><input type="text" name="ans" onblur="" style="width: 300px" maxlength="30"  required/>
                    <font color="brown" style="font-weight: bold;font-size: 11px">Answer is case and space sensitive.</font>
                </td>
               
            </tr>
        </table>
            <p style="margin: 5px"></p>
        <table id="simple3">
            <tr>
                <td class="regular" style="background: #0e99c7"><font color="#FFF"> Company Details</font></td>
                <td class="regular" style="background: #0e99c7;border-left: none;border-right: 1px solid #AAA" colspan="2"><span id="cmpnyMsg"></span></td>
                
            </tr>
            <tr>
                <td class="regular">Name of Firm / Vendor <span style="color:red;">*</span></td>
                <td class="regular"><input type="text" name="firmName" maxlength="50"  required/></td>
                <td class="right"></td>
            </tr>
            <tr>
                <td class="regular">Contact No. <span style="color:red;">*</span></td>
                <td class="regular"><span id="phnoMsg"></span>
                    <input type="text" name="phno" placeHolder="First" maxlength="20" onblur="chkPhnoVendor()"  required/><br><p style="margin: 3px"></p>
                        <input type="text" name="phno2" placeHolder="Second" maxlength="20" onblur="chkPhnoVendor()" />
                </td>
                <td class="right"> At list one contact number is necessary </td>
            </tr>
            <tr>
                <td class="regular">Address <span style="color:red;">*</span></td>
                <td class="regular"><textarea name="address" rows="4" cols="50" maxlength="200" style="resize: none"  required></textarea></td>
                <td class="right"></td>
            </tr>
            <tr>
                <td class="regular">Shop Act Number <span style="color:red;">*</span></td>
                <td class="regular"><input type="text"   id="SAN" name="SAN"  required/></td>
                <td class="right"></td>
            </tr>
            <tr>
                <td class="regular">CST Number <span style="color:red;">*</span></td>
                <td class="regular"><input type="text"   id="CST" name="CST"  required/></td>
                <td class="right"></td>
            </tr>
            <tr>
                <td class="regular">VAT/TIN Number <span style="color:red;">*</span></td>
                <td class="regular"><input type="text"  id="VAT" name="VAT"  required/></td>
                <td class="right"></td>
            </tr>
            <tr>
                <td class="regular">PAN Number <span style="color:red;">*</span></td>
                <td class="regular"><input type="text"  id="PAN" name="PAN"  required/></td>
                <td class="right"></td>
            </tr>
            <tr>
                <td class="regular">TAN Number <span style="color:red;">*</span></td>
                <td class="regular"><input type="text"  id="TAN" name="TAN"  required/></td>
                <td class="right"></td>
            </tr>
            <tr>
                <td class="regular">Website</td>
                <td class="regular"><input class="long" type="text"   name="web"  /></td>
                <td class="right"></td>
            </tr>
            <tr>
                <td class="bottom">Income Tax Certificate <span style="color:red;">*</span></td>
                <td class="bottom"><span id="f2Span"></span><input type="file" name="IT"  id="IT"  required/></td>
                <td class="bottomRight">pdf/jpg upto 1MB</td>
            </tr>
        </table>
            <p style="margin: 5px"></p>
        <table id="simple3">
            <tr>
                <td class="regular" style="background: #0e99c7"><font color="#FFF">Other Details</font></td>
                <td class="regular" style="background: #0e99c7;border-left: none;border-right: 1px solid #AAA" colspan="2"><span id="otherMsg"></span></td>
                <!--<td class="right"></td>-->
            </tr>
            <tr>
                <td class="regular">Category <span style="color:red;">*</span><br>
                        <font style="font-weight: normal;color: brown">Please tick(&#10003;) the boxes in which you deal.</font>
                </td>
                <td class="regular">
                    <div id="catDiv">
                    <table id="simple" style="font-size: 11px;">
                        <tr>
                            <td style="font-weight: normal;color: black"><input type="checkbox" name="category" value="Benches" />Benches</td>
                            <td><input type="checkbox" name="category" value="Black Board"  />Black Board</td>
                        </tr>
                        <tr>
                            <td style="font-weight: normal;color: black"><input type="checkbox" name="category" value="Books" />Books</td>
                            <td><input type="checkbox" name="category" value="Chemical Material" />Chemical Material</td>
                        </tr>
                        <tr>
                            <td style="font-weight: normal;color: black"><input type="checkbox" name="category" value="Glassware Material" />Glassware Material</td>
                            <td><input type="checkbox" name="category" value="I-card & material" />I-card & material</td>
                        </tr>
                        <tr>
                            <td style="font-weight: normal;color: black"><input type="checkbox" name="category" value="Sports Material" />Sports Material</td>
                            <td><input type="checkbox" name="category" value="Steal Furniture" />Steel Furniture</td>
                        </tr>
                        <tr>
                            <td style="font-weight: normal;color: black"><input type="checkbox" name="category" value="Wooden Furniture" />Wooden Furniture</td>
                            <td></td>
                        </tr>
                        <tr>
                            <td colspan="2" style="font-weight: normal;color: black"><input type="checkbox" name="category" value="Science Instruments" />Science Instruments / Equipments / Machinery</td>
                        </tr>
                    </table>
                    </div>
                </td>
                <td class="right"></td>
            </tr>
            <tr>
                <td class="regular">Skilled employees <span style="color:red;">*</span></td>
                <td class="regular"><input type="number"  id="skilled" name="skilled"  required/></textarea></td>
                <td class="right"></td>
            </tr>
            <tr>
                <td class="bottom">Unskilled employees <span style="color:red;">*</span></td>
                <td class="bottom"><input type="number"  id="nonSkilled" name="nonSkilled"  required/></td>
                <td class="bottomRight"></td>
            </tr>
        </table>
                <br>
                    <input type="submit" class="colorbutton" value="   Submit   "/>
                    <input type="reset" class="colorbutton" value="   Reset   "/>
                    
        </form>
        </center>
                        
    </div>
               
                <p></p>
        <div id="templatemo_footer">
        	Copyright © 2016 Pune District Education Association,Pune | <a href="http://www.etenderingpdeapune.org" target="_parent">Website Developed and Maintain</a> by <a href="http://www.divinityindia.in" target="_parent">Divinity Technologies,Pune</a>
        </div>
        </div><!-- End Of container -->
    </div><!-- End Of Middle Background -->
</body>
<!--  Designed by www.divinityindia.in  --> 
</html>