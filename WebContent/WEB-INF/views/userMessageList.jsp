<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=0.25"/>
    <title>我的订单</title>
    
    <!-- Bootstrap -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/fore/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/fore/css/font-awesome.min.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/fore/css/owl.carousel.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/fore/style.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/fore/css/responsive.css">
    <script src="<%=request.getContextPath() %>/fore/js/jquery-1.8.2.min.js"></script>
    <style type="text/css">
    	#zt{
    		margin: 10px;
    		font-family: 楷体;
    		font-size: 1.5em;
    		font-weight: 900;
    	}
    	#zt span{
    		margin-left: 22px;
    		border:1px solid #ccc;
    		border-radius:6px;
    		padding: 8px;
    	}
    	#ttr:HOVER{
    		background-color: #ccc;
    	}
    </style>
    
<!-- 订单详情隐藏框 -->
<style>
#dydd:HOVER{
	color:red;
}
.login-body .xx{
	font-family: 仿宋;
	font-size: 1.2em;
	font-weight: 900px;
}
.login-body .xx p label{
	color:#000000;
}
.login-body .xx p span{
	color:green;
	font-weight: 900;
}
.login-body {
	padding: 60px 15px;
	height: 148px;
}

.hide-body {
	z-index: 9999;
	position: fixed;
	top: 30%;
	left: 40%;
	width: 900px;
	height: 600px;
	margin: -180px 0 0 -330px;
	border-radius: 10px;
	border: solid 2px #666;
	background-color: #fff;
	display: none;
	box-shadow: 0 0 10px #666;
}

.close-window {
	border-bottom: 1px solid #ddd;
	padding: 22px;
	position: relative;
}

.bottom {
	margin-top: 250px;
}

.close-window .close {
	float: right;
	color: #999;
	padding: 5px;
	margin: -2px -5px -5px;
	font: bold 14px/14px simsun;
	text-shadow: 0 1px 0 #ddd
}
#outer{z-index: 9999;
	position: fixed;
	top: 30%;
	left: 40%;
	background-color: #fff;
	width: 900px;
	height: 600px;
	margin: -180px 0 0 -330px;
	border-radius: 10px;
	border: solid 2px #666;
	
	}
.close-window .close:hover {
	color: #444;
}
</style>
<!-- 订单详情隐藏框 -->

  </head>
  <body>
   <div class="header-area">
        <div class="container">
            <div class="row">
                <div class="col-md-8">
                    <div class="col-md-8">
                    <div class="user-menu">
                        <ul>
                            <li>当前用户：</li>
                        	<li><a href="#"><i class="fa fa-user"></i>${user.m_name}</a></li>
                            <li><a href="javascript:exitFun()"><i class="fa fa-user"></i> 退出</a></li>
                        </ul>
                    </div>
                    <script type="text/javascript">
	                	function exitFun(){
	                		var b = confirm("你确定退出？");
	                		if(b){
	                			window.location.href='<%=request.getContextPath() %>/fore/exit.jsp';
	                		}else{}
	                	}
                	</script>
                </div>
                </div>
            </div>
        </div>
    </div> <!-- End header area -->
    
    <div class="site-branding-area">
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    <div class="logo">
                        <h1><a href="#">
                        	<img id="myLogoImg" style="height: 140px;width: 170px;position: absolute;top: 0px;left:930px;">
                        	</a>
						</h1>
                    </div>
                </div>
            </div>
        </div>
    </div> 

<script src='<%=request.getContextPath() %>/fore/js/jquery-1.7.2.min.js'></script>
<script type="text/javascript">
$.post("${pageContext.request.contextPath}/car/getLogoImg",function(data){
	 $("#myLogoImg").attr("src","<%=request.getContextPath() %>/car_img/"+data);
});
</script>
    
    <div class="mainmenu-area" style="position: absolute;top: 80px;left:110px;margin: 0;">
        <div class="container">
            <div class="row">
                <div class="navbar-collapse collapse" >
                    <ul class="nav navbar-nav" style="border: 1px solid #ccc;border-radius:15px;">
                        <li><a style="font-family: 仿宋;color:black;font-size: 2em;" href="<%=request.getContextPath()%>/car/managerIndex?m_card=${user.m_card}">首页</a></li>
                        <li><a style="font-family: 仿宋;color:black;font-size: 2em;" href="<%=request.getContextPath()%>/manager/getManager/${user.m_card}">我的主页</a></li>
                        <li><a style="font-family: 仿宋;color:block;font-size: 2em;" href="<%=request.getContextPath()%>/car/queryCar?m_card=${user.m_card}">汽车管理</a></li>
                        <li><a style="font-family: 仿宋;color:black;font-size: 2em;" href="<%=request.getContextPath()%>/car/carRanking?m_card=${user.m_card}">汽车排行榜</a></li>
                    	<li class="active"><a style="font-family: 仿宋;color:red;font-size: 2em;" href="<%=request.getContextPath()%>/message/queryUserMessageCount?m_card=${user.m_card}">查看用户留言</a></li>
                    </ul>
                </div>  
            </div>
        </div>
    </div> 
    
    <div class="single-product-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
					<div style="width: 100%;" role="tabpanel">
                        <ul class="product-tab" role="tablist">
                            <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">留言用户列表</a></li>
                        </ul>
                        <div class="tab-content">
                       		<!-- 所有订单 -->
                            <div role="tabpanel" class="tab-pane fade in active" id="home">
	                            

                            
								<table cellspacing="0" class="shop_table cart" id="table1">
                                	<tr class="cart_item">
                                        <td class="product-thumbnail">用户名</td>
                                        <td class="product-thumbnail">留言数</td>
                                 
                                    </tr>
                                    <c:forEach var="o" items="${messageCount}">
                                    	<tr class="cart_item" id="ttr">
	                                        <td class="product-thumbnail"><a class="xq" href="javascript:;" onclick="queryMessageInfo('${o.u_card}')">${o.u_name }</a></td>
	                                        <td class="product-thumbnail">${o.count}</td>
	                                        
                                   	    </tr>
                                    </c:forEach>
                                </table>
				            </div>

<script type="text/javascript">
/* var sysBBS = "<span style='font-size:14px; line-height:30px;'>欢迎光临聊天室，请遵守聊天室规则，不要使用不文明用语。</span><br><span style='line-height:22px;'>";
window.setInterval("showContent();",1000);
// Jquery:JS框架.
// 相当于window.onload
$(function(){
	showContent();
}); */

function queryMessageInfo(card){
	debugger;
	
		$.post("${pageContext.request.contextPath}/message/queryUserMessageCount?u_card="+card+"&m_card=${user.m_card}",function(data){
			alert("111");
			$('#outer').attr("style","display:block;");	//将隐藏的窗口div显示出来 
		});
}
	/* var talk = document.getElementById('talk');
	var newLi2 = document.createElement('li');
    newLi2.className = '小风';
    var message = ${message};
    var currentDate = 1900+now.getYear()+"-"+(now.getMonth()+1)+"-"+now.getDate()+" "+now.getHours()+":"+now.getMinutes()+":"+now.getSeconds();
    newLi2.innerHTML = '['+currentDate +']'+ '小风:'+str.text;
    talk.appendChild(newLi2); */
    
	/* $.post("${pageContext.request.contextPath}/message/queryUserMessage?u_card="+card,function(data){
		jQuery(document).ready(function($) {
			debugger;
			$('.xq').click(function() { //jquery的点击事件 
				$('.hide-body').slideDown(200);//将隐藏的窗口div显示出来 
			});
			$('.close-window .close').click(function() {
				$('.hide-body').slideUp(200);//将显示的窗口隐藏起来 
			});
	}); */
/* }
	) */


var url="/carRental_back/";
function sendMessage() {
	var textarea= $("#textarea").val();
	if(textarea==""||textarea==null){
		alert("请输入内容后发送！");
		return;
	}
	$.post("${pageContext.request.contextPath}"+url+"userServlet?"+new Date().getTime(),$("#form1").serialize(),function(data){
		$("#list").html(sysBBS+data+"</span>");
	});
	//fmusic1(); 
	$("#textarea").val("");
	$("#textarea").focus();
}

//显示聊天的内容
function showContent(){
	debugger;
	$.post("${pageContext.request.contextPath}"+url+"userServlet?"+new Date().getTime(),{'method':'getMessage'},function(data){
		$("#list").html(sysBBS+data+"</span>");
	});
}

</script>
			                
                            <!-- 订单统计 -->
                            <div role="tabpanel" class="tab-pane fade" id="profile">
                                <div id="xs">
                               		<span id="tj1"></span>
                               		<span id="tj2"></span>
                               		<div style="position:absolute;top:380px;left:900px; font-family:楷体;font-size: 1.5em;font-weight: 900;">
                               			<label><input type="radio" checked="checked" name="radio" onclick="fun1()">支付状态</label>
                               			<br>
                               			<br>
                               			<br>
                               			<label><input type="radio" name="radio" onclick="fun2()">购买保险</label>
                               		</div>
                                </div>
                            </div>
                        </div>
                      </div>
                      
            </div>
        </div>
<script type="text/javascript" src="<%=request.getContextPath() %>/fore/js/tjJS/jscharts.js"></script>

    <div class="footer-bottom-area">
        <div class="container">
            <div class="row">
                <div class="col-md-8">
                    <div class="copyright">
                        <p>南昌航空大学.clm&nbsp;&nbsp;&nbsp;<a target="_blank" href="#">登录QQ</a></p>
                    </div>
                </div>
                
                <div class="col-md-4">
                    <div class="footer-card-icon">
                        <i class="fa fa-cc-discover"></i>
                        <i class="fa fa-cc-mastercard"></i>
                        <i class="fa fa-cc-paypal"></i>
                        <i class="fa fa-cc-visa"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>
   
   <script src="<%=request.getContextPath() %>/fore/js/min.js"></script>
   <script src="<%=request.getContextPath() %>/fore/js/min2.js"></script>
    
    <!-- jQuery sticky menu -->
    <script src="<%=request.getContextPath() %>/fore/js/owl.carousel.min.js"></script>
    <script src="<%=request.getContextPath() %>/fore/js/jquery.sticky.js"></script>
    
    <!-- jQuery easing -->
    <script src="<%=request.getContextPath() %>/fore/js/jquery.easing.1.3.min.js"></script>
    
    <!-- Main Script -->
    <script src="<%=request.getContextPath() %>/fore/js/main.js"></script>

				<c:forEach var="j" items="${message1}">
             		<li>${j.m_date}${j.m_info} </li>
             	</c:forEach>
<!-- 留言详情隐藏框 -->
		<div id="outer" style="border:1px solid #CCCCCC; height: 250px; display:none;">
             <ul id="talk">
             	<c:forEach var="o" items="${message1}">
	                 <li>${o.m_date}${o.m_info} </li>
                </c:forEach>
             </ul>
       	</div>
<!-- 留言详情隐藏框 -->

  </body>
</html>


<script type="text/javascript" src="<%=request.getContextPath()%>/fore/js/html2canvas.js"></script>  
<script type="text/javascript" src="<%=request.getContextPath()%>/fore/js/swfobject.js"></script>  
<script type="text/javascript" src="<%=request.getContextPath() %>/fore/js/jquery.base64.js"></script>  
<script type="text/javascript" src="<%=request.getContextPath() %>/fore/js/tableExport.js"></script>  
<script type="text/javascript" src="<%=request.getContextPath() %>/fore/js/jspdf.js"></script>  
<script type="text/javascript" src="<%=request.getContextPath() %>/fore/js/Base64.js"></script>  

</script>
