<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=0.25"/>
    <title>个人详情</title>
    
    <!-- Bootstrap -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/fore/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/fore/css/font-awesome.min.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/fore/css/owl.carousel.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/fore/style.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/fore/css/responsive.css">
  	<script type="text/javascript" src="<%=request.getContextPath() %>/fore/js/jquery-1.8.2.min.js"></script>
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
                		}else{
                			
                		}
                	}
                </script>                </div>
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
                <div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav" style="border: 1px solid #ccc;border-radius:15px;">
                        <li><a style="font-family: 仿宋;color:black;font-size: 2em;" href="<%=request.getContextPath()%>/car/managerIndex?m_card=${user.m_card}">首页</a></li>
                        <li class="active"><a style="font-family: 仿宋;color:red;font-size: 2em;" href="<%=request.getContextPath()%>/manager/getManager/${user.m_card}">我的主页</a></li>
                        <li><a style="font-family: 仿宋;color:block;font-size: 2em;" href="<%=request.getContextPath()%>/car/queryCar?m_card=${user.m_card}">汽车管理</a></li>
                        <li><a style="font-family: 仿宋;color:black;font-size: 2em;" href="<%=request.getContextPath()%>/car/carRanking?m_card=${user.m_card}">汽车排行榜</a></li>
                    	<li><a style="font-family: 仿宋;color:block;font-size: 2em;" href="<%=request.getContextPath()%>/message/queryUserMessageCount?m_card=${user.m_card}">查看用户留言</a></li>
                </div>  
            </div>
        </div>
    </div> 

    <div class="single-product-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
            <div style="position:relative; ;top:-35px;" class="row">
            	<hr>
            	<marquee>
                <h2 style="height: 10px;" class="sidebar-title">*提示：各位员工紧收员工手册，认真工作！</h2>
                </marquee>
                <hr>
                <div class="col-md-8">
                    <div class="product-content-right">
                        <div class="woocommerce">
                            <form method="post" action="" name="form1" style="width:500px;">
                                <table cellspacing="0" class="shop_table cart" style="width:500px;">
                                    
                                    <!-- 个人详情*********************************************************** -->
                                    	<tr class="cart_item">
                                   	        <%-- <td colspan="2" rowspan="2"><img style="height:120px;width:100px; " alt="头像不见了" src="<%=request.getContextPath() %>/car_img/${user.m_img}"></td> --%>
                                            <td class="product-thumbnail">身份证号</td>
                                            <td class="product-thumbnail">${user.m_card}</td>
                                        </tr>
                                        <tr class="cart_item">
                                            <td class="product-thumbnail" style="width: 150px;" >性别</td>
                                            <td class="product-thumbnail">${user.m_sex}</td>
                                            <td class="product-thumbnail">电话</td>
                                            <td class="product-thumbnail">${user.m_phone}</td>
                                        </tr>
                                        <tr class="cart_item">
                                            <td class="product-thumbnail" style="width: 150px;">年龄</td>
                                        	<td class="product-thumbnail">${user.m_age}</td>
                                        	<td class="product-thumbnail">住址</td>
                                        	<td class="product-thumbnail">${user.m_address}</td>
                                        </tr>
                                        <tr class="cart_item">
                                            
                                            <td class="product-thumbnail">注册日期</td>
                                            <td class="product-thumbnail">${user.m_date}</td>
                                        	
                                        </tr>
                                        <tr class="cart_item">
                                           	<td class="product-thumbnail">
                                        		<input style="width: 130px;" type="text" id="nPs" placeholder="请输入旧密码！">
											</td>
                                        	<td class="product-thumbnail">
                                           	 	<input style="border-radius:10px;background-color: #ccc;height: 42px;width: 86px;padding: 0;" type="button" onclick="upFun()" value="修改密码">
                                           	</td>
                                        </tr>
                                        
                                    <!-- 购物车*********************************************************** -->
                                        
                                    </tbody>
                                </table>
                                <input id="ops" type="hidden" value="${user.m_psw}">
                            </form>

<script>
	
	function upFun(){
		var Ps = document.getElementById("nPs").value;
		var oldPs = $("#ops").val();
		if(Ps==null || Ps==""){
			alert("请先输入你的原密码!");
			return;
		}
		if(Ps!=oldPs){
			alert("请输入的密码有误，修改失败!");
			return;
		}else{
			var newPs = prompt("请输入新密码（6位数字）！", "例如：123456");
			if(newPs){
				if("例如：123456"==newPs){
					alert("你要设定的密码格式有误！");
				}else{
					window.location.href='<%=request.getContextPath()%>/manager/updateUserPs?u_card=${user.m_card}&newPs='+newPs;
					var b = confirm("恭喜你，密码修改成功!是否重新登录？");
			   		if(b){
			   			window.location.href='<%=request.getContextPath() %>/fore/exit.jsp';
			   		}else{}
					}
			}else{}
			
		}
		
		
	}
</script>
					
					

                            </div>
                            
                        </div>    
                                            
                    </div>               
                </div>
                
                
                
            </div>
        </div>


    
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
  </body>
</html>