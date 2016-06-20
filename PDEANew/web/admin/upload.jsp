<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Welcome To PDEA E Tender Portal</title>
<meta name="keywords" content="free etendering  by pdea  " />
<meta name="description" content="Maintain and developed by divinity technologies,pune" />
<link href="../style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="../style/slimbox2.css" type="text/css" media="screen" />
<link rel="stylesheet" href="../style/login.css" type="text/css" media="screen" />
<link rel="stylesheet" href="../style/table.css" type="text/css" media="screen" />
<script type="text/javascript" src="../style/jquery.min.js"></script>
<script type="text/javascript" src="../js/jquery.blockUI.js"></script>
<script type="text/javascript" src="../style/slimbox2.js"></script>
<script type="text/javascript">
//    $(function() {
//    $('#theForm').submit(function() {
//    $.blockUI({ message: '<h1> Just a moment...</h1>' });
//    });
//});
</script>

</head>
<body>
    <%
//        response.setHeader("Pragma","no-cache");response.setHeader("Cache-Control","no-store");response.setDateHeader("Expires", 0);
    %>
    <div id="templatemo_background_section_top">
        <div class="templatemo_container">
            <jsp:include page="header.jsp"/>
            <jsp:include page="menu.html"/>   
        </div>
    </div>
<div class="site_content">
    <div class="alert-box info">
        <span>important</span><br>
            &#10148; Upload excel sheet.<br>
                &#10148; <font color="brown">First three rows of sheet should be blank, fourth row content header of columns and fifth onwards content data. </font><br>
                    &#10148; <font color="brown">Excel sheet <b><font color="red">should not content ' or " </font></b>(key near to enter key). </font>
    </div>    
    <div style="background: #ccffcc;border: 1px solid #AAA;border-radius: 10px;padding: 10px">
        <c:if test="${requestScope.temp!=null}">
            <div class="alert-box error">
                <font color="red"><b>${requestScope.temp}</b></font>
            </div>
        </c:if>
            <p style="margin: 10px"></p>
        <b>Upload File : </b>
        <form id="theForm" action="UploadList"  method="post" enctype="multipart/form-data">
            <input type="file" id="fileUpload"   name="file" style="width: 400px;   " required/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="red">(Excel file having extention .xls or .xlsx)</font>
            <p style="margin: 10px"></p>
                <input type="submit" class="colorbutton" value="   Submit   "/>
        </form>  
    </div>   
    <div id="someHiddenDiv" style="display: none;">Working...</div>
                        
</div>
                <p></p>
        <div id="templatemo_footer">
        	Copyright © 2016 Pune District Education Association,Pune | Website Developed and Maintain by <a href="http://www.techdivinity.com" target="_parent">Tech Divinity ,Pune</a>
        </div>
        <!--</div> End Of container -->
    <!--</div> End Of Middle Background -->
</body>
<!--  Designed by www.divinity india.in --> 
</html>