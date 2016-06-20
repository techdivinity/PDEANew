<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Welcome To PDEA E Tender Portal</title>
<meta name="keywords" content="free etendering  by pdea  " />
<meta name="description" content="Maintain and developed by divinity technologies,pune" />
<link href="../style.css" rel="stylesheet" type="text/css" />
<link href="../style/table.css" rel="stylesheet" type="text/css" />

<link rel="stylesheet" href="../style/slimbox2.css" type="text/css" media="screen" />
<link rel="stylesheet" href="../style/login.css" type="text/css" media="screen" />
<script type="text/javascript" src="../style/jquery.min.js"></script>
<script type="text/javascript" src="../style/slimbox2.js"></script>
<script type="text/javascript" src="../sliding.js"></script>
<script type="text/javascript" src="../js/jquery.blockUI.js"></script>
<script language="javascript" type="text/javascript">
    window.onload = function ()
    {
        jQuery('#two').hide();
        jQuery('#one').show();
    };
    function toggleDiv1() 
    {   
        jQuery('#one').hide();
        $("#two").toggle('slide', { direction: 'right' }, 300);
    }
    function toggleDiv2() 
    {
        jQuery('#two').hide();
        $("#one").toggle('slide', { direction: 'left' }, 300);
    }
    
    function selectAll()
    {
        var box=document.getElementsByName("selectCollege");
        for (var i=0; i < box.length; i++)
        { box[i].checked = true; }
    }
    function UnselectAll()
    {
        var box=document.getElementsByName("selectCollege");
        for (var i=0; i < box.length; i++)
        { box[i].checked = false; }
    }
    function chkAtLiatOneTick()
    {
        var msg=document.getElementById("msg");msg.innerHTML=null;
        var ticked=false;
        var box=document.getElementsByName("selectCollege");
        for (var i=0; i < box.length; i++)
        {
            if(box[i].checked)
            {
                ticked=true;
            }
        }
        if(ticked==false)
        {
            msg.innerHTML='<div class="alert-box error"><font color="red">\n\
                        <b>NO college / school selected.</b></font></div>';
            return false;
        }
    }
    function selectGroup(group)
    {
        var items=document.getElementsByClassName(group);
        var titleChkBox=document.getElementById(group);
        if(titleChkBox.checked)
        { 
            for(var i=0;i<items.length;i++)
            {
                items[i].checked=true;
            }
        }
        else
        {
            for(var i=0;i<items.length;i++)
            {
                items[i].checked=false;
            }
        }
    }
    
//    $(function() {
//        $('#theForm').submit(function() {
////            if(chkAtLiatOneTick()==true){
//        $.blockUI({ message: '<h1> Just a moment...</h1>' });
////    }
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
            <c:if test="${sessionScope.category==null || sessionScope.category!='account' }"> 
                ${sessionScope.category=null}
                ${sessionScope.user=null}
                ${sessionScope.id=null}
                <jsp:forward page="error.html" />
            </c:if>
            
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
            <jsp:include page="menu.html"/>   
        </div>
    </div>
    <div class="site_content">
        
        <form id="theForm" action="UploadListSuccess"  method="post" onsubmit="return chkAtLiatOneTick()">
              
            <div id="one">
                <b>${requestScope.fileName}</b>
                <input type="hidden" value="${requestScope.fileName}" name="file"/>
                <div style="overflow-y: scroll;">
                    <table border="1" style="font-size: 11px;table-layout: fixed" width="">
                        <tr ><th style="width: 25px">S.N.</th>
                            <c:set var="arr" value="${requestScope.itemList[0]}" />
                            <c:forEach var="item" items="${arr}" varStatus="status">
                                <th style="width: 230px;">
                                    ${item} <input type="hidden" value="${item}" name="header"/>
                                </th>
                            </c:forEach>
                        </tr>
                    </table>
                </div>
                <div style="height: 350px;overflow-y: scroll;" >
                    <table border="1" style="font-size: 11px;table-layout: fixed" >
                        <c:forEach var="arrs" items="${requestScope.itemList}" varStatus="i" begin="1" >
                            <tr>
                                <td width="25px" style="">${i.count}</td>
                                <c:forEach var="val" items="${arrs}" varStatus="j">
                                    <td style="width: 230px;">
                                        <input type="text" size="33" value="${val}" name="${j.count-1}" style="font-size: 11px"/>    
                                    </td>
                                </c:forEach>
                            </tr>
                        </c:forEach>
                        
                    </table>
                </div><br>
            <button type="button" class="colorbutton" onclick="toggleDiv1()" id="butn">&nbsp;&nbsp;&nbsp; Proceed &nbsp;&nbsp;&nbsp;</button><br>
                
            </div>
        
            <div id="two">
                <div style="border: 2px solid #AAA;padding: 5px;padding-left: 20px; margin-bottom: 2px;background: #EEE">
                    <b>List Type : <select name="listType" style="border: 2px solid #0e99c7;margin:0px 25px 0px 15px;padding: 2px 15px 2px 15px;background:#eeffee">
                        <option value="1">Blackboard</option>
                        <option value="2">Books-Publishing</option>
                        <option value="3">Books-Vikasmala</option>
                        <option value="4">Chemical Materials</option>
                        <option value="5">Glassware Materials</option>
                        <option value="6">I-Card</option>
                        <option value="7">Science Instruments</option>
                        <option value="8">Sports Materials</option>
                        <option value="9">Steel-Furniture</option>
                        <option value="10">Wooden-Furniture</option>
                    </select></b>
                </div>
                <div id="msg"></div>
                <div style="height: 350px; overflow-y: scroll;border: 1px solid #AAA;">
                    <table width="100%" >
                        <tr><td colspan="2"><b><input type="checkbox" onchange="selectGroup('pri')"  id="pri"/>PRIMARY</b></td></tr>
                        <c:forEach var="clg" items="${requestScope.collegeList}" varStatus="i"  >
                            <c:if test="${clg.isPrimry()}" >
                                <tr><td><input type="checkbox" name="selectCollege" value="${clg.getCID()}" class="pri"/></td>
                                    <td style="text-align: left">${clg.getCollegeName()}</td>    
                                </tr>
                            </c:if>
                        </c:forEach>
                        <tr><td colspan="2"><b><input type="checkbox" onchange="selectGroup('second')"  id="second"/>SECONDARY</b></td></tr>
                        <c:forEach var="clg" items="${requestScope.collegeList}" varStatus="i"  >
                            <c:if test="${clg.isSecondary()}" >
                                <tr><td><input type="checkbox" name="selectCollege" value="${clg.getCID()}" class="second"/></td>
                                    <td style="text-align: left">${clg.getCollegeName()}</td>    
                                </tr>
                            </c:if>
                        </c:forEach>
                        <tr><td colspan="2"><b><input type="checkbox" onchange="selectGroup('juni')"  id="juni"/>JUNIOR</b></td></tr>
                        <c:forEach var="clg" items="${requestScope.collegeList}" varStatus="i"  >
                            <c:if test="${clg.isJunior()}" >
                                <tr><td><input type="checkbox" name="selectCollege" value="${clg.getCID()}" class="juni"/></td>
                                    <td style="text-align: left">${clg.getCollegeName()}</td>    
                                </tr>
                            </c:if>
                        </c:forEach>
                        <tr><td colspan="2"><b><input type="checkbox" onchange="selectGroup('ug')"  id="ug"/>UG</b></td></tr>
                        <c:forEach var="clg" items="${requestScope.collegeList}" varStatus="i"  >
                            <c:if test="${clg.isUG()}" >
                                <tr><td><input type="checkbox" name="selectCollege" value="${clg.getCID()}" class="ug"/></td>
                                    <td style="text-align: left">${clg.getCollegeName()}</td>    
                                </tr>
                            </c:if>
                        </c:forEach>
                        <tr><td colspan="2"><b><input type="checkbox" onchange="selectGroup('pg')"  id="pg"/>PG</b></td></tr>
                        <c:forEach var="clg" items="${requestScope.collegeList}" varStatus="i"  >
                            <c:if test="${clg.isPG()}" >
                                <tr><td><input type="checkbox" name="selectCollege" value="${clg.getCID()}" class="pg"/></td>
                                    <td style="text-align: left">${clg.getCollegeName()}</td>    
                                </tr>
                            </c:if>
                        </c:forEach>
                        <tr><td colspan="2"><b><input type="checkbox" onchange="selectGroup('voc')"  id="voc"/>VOCATIONAL</b></td></tr>
                        <c:forEach var="clg" items="${requestScope.collegeList}" varStatus="i"  >
                            <c:if test="${clg.isVocational()}" >
                                <tr><td><input type="checkbox" name="selectCollege" value="${clg.getCID()}" class="voc"/></td>
                                    <td style="text-align: left">${clg.getCollegeName()}</td>    
                                </tr>
                            </c:if>
                        </c:forEach>
                        <tr><td colspan="2"><b><input type="checkbox" onchange="selectGroup('pharm')"  id="pharm"/>PHARMACY</b></td></tr>
                        <c:forEach var="clg" items="${requestScope.collegeList}" varStatus="i"  >
                            <c:if test="${clg.isPharmacy()}" >
                                <tr><td><input type="checkbox" name="selectCollege" value="${clg.getCID()}" class="pharm"/></td>
                                    <td style="text-align: left">${clg.getCollegeName()}</td>    
                                </tr>
                            </c:if>
                        </c:forEach>
                        <tr><td colspan="2"><b><input type="checkbox" onchange="selectGroup('aur')"  id="aur"/>Ayurveda</b></td></tr>
                        <c:forEach var="clg" items="${requestScope.collegeList}" varStatus="i"  >
                            <c:if test="${clg.isAyurved()}" >
                                <tr><td><input type="checkbox" name="selectCollege" value="${clg.getCID()}" class="aur"/></td>
                                    <td style="text-align: left">${clg.getCollegeName()}</td>    
                                </tr>
                            </c:if>
                        </c:forEach>
                        <tr><td colspan="2"><b><input type="checkbox" onchange="selectGroup('poly')"  id="poly"/>Polytechnic</b></td></tr>
                        <c:forEach var="clg" items="${requestScope.collegeList}" varStatus="i"  >
                            <c:if test="${clg.isPolytech()}" >
                                <tr><td><input type="checkbox" name="selectCollege" value="${clg.getCID()}" class="poly"/></td>
                                    <td style="text-align: left">${clg.getCollegeName()}</td>    
                                </tr>
                            </c:if>
                        </c:forEach>
                        <tr><td colspan="2"><b><input type="checkbox" onchange="selectGroup('eng')"  id="eng"/>Engineering</b></td></tr>
                        <c:forEach var="clg" items="${requestScope.collegeList}" varStatus="i"  >
                            <c:if test="${clg.isEngg()}" >
                                <tr><td><input type="checkbox" name="selectCollege" value="${clg.getCID()}" class="eng"/></td>
                                    <td style="text-align: left">${clg.getCollegeName()}</td>    
                                </tr>
                            </c:if>
                        </c:forEach>
                        <tr><td colspan="2"><b><input type="checkbox" onchange="selectGroup('mb')"  id="mb"/>MBA</b></td></tr>
                        <c:forEach var="clg" items="${requestScope.collegeList}" varStatus="i"  >
                            <c:if test="${clg.isMba()}" >
                                <tr><td><input type="checkbox" name="selectCollege" value="${clg.getCID()}" class="mb"/></td>
                                    <td style="text-align: left">${clg.getCollegeName()}</td>    
                                </tr>
                            </c:if>
                        </c:forEach>
                        <tr><td colspan="2"><b><input type="checkbox" onchange="selectGroup('arch')"  id="arch"/>Architecture</b></td></tr>
                        <c:forEach var="clg" items="${requestScope.collegeList}" varStatus="i"  >
                            <c:if test="${clg.isArchitech()}" >
                                <tr><td><input type="checkbox" name="selectCollege" value="${clg.getCID()}" class="arch"/></td>
                                    <td style="text-align: left">${clg.getCollegeName()}</td>    
                                </tr>
                            </c:if>
                        </c:forEach>
                    </table>
                </div>
                        
                <p style="margin: 5px"></p><input type="button" onclick="selectAll()" value="Select All"/>
                <input type="button" onclick="UnselectAll()" value="Unselect All"/>
                <br><br>
                <input type="submit" class="colorbutton" value="   Upload List   " />
                
                <br><br>
                <a style="cursor:pointer;" onclick="toggleDiv2()">&#10096;&#10096; Back</a><br><br>
                
            </div>
            
        </form>    
                        
                        
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