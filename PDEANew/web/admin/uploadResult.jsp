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
<script type="text/javascript" src="../style/slimbox2.js"></script>

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
    <c:choose>
        <c:when test= "${sessionScope.msg=='SUCCESS'}">
            <div class="alert-box success">
                <span>Success</span><br>
                    List has been uploaded successfully.
            </div>
        </c:when>
        <c:when test= "${sessionScope.msg=='ERROR'}">
            <div class="alert-box error">
                <span>Error</span><br>
                    Something Went wrong.<br>
                        Please <b><a href="UploadList">Try Again</a>.</b>
            </div>
        </c:when>
        <c:otherwise>
            <jsp:forward page="admin.jsp"/>
        </c:otherwise>
    </c:choose>
            <c:remove var="msg" scope="session" />            
                        
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