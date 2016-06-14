function marq(val,obj)
    { 
        var isOpera = !!window.opera || navigator.userAgent.indexOf(' OPR/') >= 0;
        // Opera 8.0+ (UA detection to detect Blink/v8-powered Opera)
        var isFirefox = typeof InstallTrigger !== 'undefined';   // Firefox 1.0+
        var isSafari = Object.prototype.toString.call(window.HTMLElement).indexOf('Constructor') > 0;
        // At least Safari 3+: "[object HTMLElementConstructor]"
        var isChrome = !!window.chrome && !isOpera;   // Chrome 1+
        var isIE = /*@cc_on!@*/false || !!document.documentMode;   // At least IE6
//        function MarqueStart() {
        if(val==2)
        { 
            if (isChrome) { 
                obj.start();

            }
            else {
                obj.setAttribute('scrollamount', 3, 0);

            }
        }
//        }
//        function MarqueStop() {
        if(val==1)
        { 
            if (isChrome) { 
                obj.stop();
            }
            else {
                obj.setAttribute('scrollamount', 0, 0);
            }
        }
    }

function toggleLogin(val)
{
    document.getElementById("1").style.display='none';
    document.getElementById("2").style.display='none';
    document.getElementById("3").style.display='none';
    document.getElementById("4").style.display='none';
    document.getElementById("T1").style.borderRadius = "10px";
    document.getElementById("T2").style.borderRadius = "10px";
    document.getElementById("T3").style.borderRadius = "10px";
    document.getElementById("T4").style.borderRadius = "10px";
    
    var tblID="T"+val;
    document.getElementById(val).style.display = "block";
    document.getElementById(tblID).style.borderBottomLeftRadius = "0px";
    document.getElementById(tblID).style.borderBottomRightRadius = "0px";
}

function logcat(val)
{
//    alert(val);
    window.location.replace("login.jsp?cat="+val);
//    window.location.reload();
}
function hideDiv()
{
    document.getElementById("login").style.visibility = 'hidden';
}