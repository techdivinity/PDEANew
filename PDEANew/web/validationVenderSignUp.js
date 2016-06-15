window.mail;
window.passwd;
window.phonNo;
function chkRepetMailVendor()
{
    
    var mailMsg=document.getElementById("repetMailMsg");
        mailMsg.innerHTML=null;
    var mail1=document.getElementsByName("mailID")[0].value;
    var mail2=document.getElementsByName("email2")[0].value;

    if(mail1!==mail2)
    {
        
        mailMsg.innerHTML="<font color='red'>Both mail IDs should be same</font>";
        window.mail=false;
    }
    else
    {
        window.mail=true;
    }
}
function chkPassLengthVendor()
{
    var passMsg=document.getElementById("passMsg");
        passMsg.innerHTML=null;
    var pass=document.getElementsByName("pass")[0];
    if((pass.value.length<6) || (pass.value.length>12))
    {
        passMsg.innerHTML="<font color='red'>Password length should be 6 to 12</font>";
        pass.value=null;
        window.passwd=false;
    }
    else
    {
        window.passwd=true;
    }
}
function chkRepetPassVendor()
{
    var passMsg=document.getElementById("repetPassMsg");
        passMsg.innerHTML=null;
    var pass=document.getElementsByName("pass")[0];
    var pass2=document.getElementsByName("pass2")[0];
    if(pass.value !== pass2.value)
    {
        passMsg.innerHTML="<font color='red'>Both passwords should be same</font>";
        pass2.value=null;
        window.passwd=false;
    }
    else
    {
        window.pass=true;
    }
}
function chkEmptyLoginVendor()
{
    var loginMsg=document.getElementById("loginMsg");
        loginMsg.innerHTML=null;
    var mail1=document.getElementsByName("mailID")[0].value;
    var mail2=document.getElementsByName("email2")[0].value;
    var pass1=document.getElementsByName("pass")[0].value;
    var pass2=document.getElementsByName("pass2")[0].value;
    var ans=document.getElementsByName("ans")[0].value;
    
    if(mail1=="" || mail2=="" || pass1=="" || pass2=="" ||ans=="")
    {
        loginMsg.innerHTML="<b><font color='yellow'>Some fields are missing</font></b>";
        loginMsg.scrollIntoView();
        return false;
    }
    return true;
}
function chkPhnoVendor()
{
    var numbers = /^[\s\d]*$/;
    var phnoMsg=document.getElementById("phnoMsg");
        phnoMsg.innerHTML=null;
    var phno=document.getElementsByName("phno")[0].value;
    var phno2=document.getElementsByName("phno2")[0].value;
    
    if(!phno.match(numbers) || !phno2.match(numbers))  
    {  
        phnoMsg.innerHTML="<font color='red'>Enter Proper Phone Number</font>"; 
        window.phonNo=false;
    }
    else
    {
        window.phonNo=true;
    }
}
function chkCategry() 
{
    var ticked=false;
    var chkbox=document.getElementsByName("category");
    for(var i=0;i<chkbox.length;i++)
    {
        if(chkbox[i].checked)
        {
            ticked=true;;
        }
    }
    if(ticked==false)
    {
        document.getElementById("catDiv").style.border='2px solid red';
    }
    return ticked;
}

function uplodVendor()   //called from same file
{
    var f2Span=document.getElementById("f2Span");
    f2Span.innerHTML=null;
    
    var IT= document.getElementById("IT");
    var val2=IT.value;
    
    if(val2!="")
    {
        var f2=IT.files[0]; 
        if(f2.size/1024/1024<1.0)
        {
            var ex2=f2.name.split('.').reverse()[0];
            if((ex2.toUpperCase()=="PDF" || ex2.toUpperCase()=="JPG" ))
            {
                return true;
            }
            else
            {
                f2Span.innerHTML="<font color='red'>Wrong file format. It should be jpg/pdf.</font>";
                return false;
            }
            
        }
        else
        {   
            f2Span.innerHTML="<font color='red'>File size is too large. It should be less than 1MB.</font>";
            return false;
        }
        
    }
    else
    {
        f2Span.innerHTML="<font color='red'>IncomeTax copy required.</font>";
        return false;
    }

    return false;    
}

function isGo()
{   
    if(window.mail==true && window.passwd==true && window.phonNo==true)
    {
        return true;
    }
    else
    {
        return false;
    }
}