<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="cn.com.clm.beans.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
Map<String,Object> systemSet = (Map<String,Object>)application.getAttribute("SystemSet");
%>
<html>
  <head>
  	<meta name="viewport" content="width=device-width,initial-scale=0.25"/>
    <title>汽车租赁系统前台</title>
    <!-- Bootstrap -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/fore/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/fore/css/font-awesome.min.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/fore/css/owl.carousel.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/fore/style.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/fore/css/responsive.css">

  </head>
  <body>
    <div class="header-area">
        <div class="container">
            <div class="row">
                <div class="col-md-8">
                    <div class="user-menu">
                        <ul>
                            <li>当前用户：</li>
                        	<li><a href="#"><i class="fa fa-user"></i>${user.u_name}</a></li>
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
                </script>
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
                    <ul class="nav navbar-nav" style="border: 1px solid #ccc;border-radius:15px;background-color:transparent;">
                        <li><a style="font-family: 仿宋;color:black;font-size: 2em;" href="<%=request.getContextPath()%>/car/index/${user.u_card}">首页</a></li>
                        <li><a style="font-family: 仿宋;color:black;font-size: 2em;" href="<%=request.getContextPath()%>/user/getUser/${user.u_card}">我的主页</a></li>
                        <li><a style="font-family: 仿宋;color:black;font-size: 2em;" href="<%=request.getContextPath()%>/car/getPageCar?u_card=${user.u_card}">汽车查询</a></li>
                        <li><a style="font-family: 仿宋;color:black;font-size: 2em;" href="<%=request.getContextPath()%>/order/getOrders?u_card=${user.u_card}">我的订单</a></li>
                        <li><a style="font-family: 仿宋;color:black;font-size: 2em;" href="<%=request.getContextPath()%>/user/talk">联系客服</a></li>
                        <li style="border-radius:15px;" class="active"><a style="font-family: 仿宋;color:red;font-size: 2em;" href="<%=request.getContextPath()%>/car/getImg?u_card=${user.u_card}">车图一览</a></li>
                    	<li><a style="font-family: 仿宋;color:black;font-size: 2em;" href="<%=request.getContextPath()%>/order/baoxiu2?u_card=${user.u_card}">车辆报修</a></li>
                    </ul>
                </div>  
            </div>
        </div>
    </div> 
    <br> <br> <br>
    <div class="maincontent-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                
                	<!-- 所有品牌 -->
                	<div class="latest-product">
                	   <h3>&gt;所有品牌</h3>
                       <div style="height: 180px;border: 1px solid #ccc;" class="product-carousel">
                       <c:forEach var="m" items="${requestScope.marks}" >
                       
                        	<div style="height:130px;border-radius:15px;" class="single-product">
                                <div class="product-f-image" style="border-radius:15px;">
                                    <img style="height:130px;width: 120px;border:1px solid #ccc;border-radius:15px;margin-left: 50px;" src="<%=request.getContextPath() %>/car_img/${m.b_img}" alt="图片不见了">
                                </div>
                            </div>
                            
                          </c:forEach>
                            
                        </div>
                    </div>
                    <br> 
                    <br>
               		<!-- 所有类型 -->
                	<div class="latest-product">
                	   <h3>&gt;所有类型</h3>
                       <div style="height: 210px;border: 1px solid #ccc;" class="product-carousel">
                       <c:forEach var="t" items="${requestScope.types}" >
                        	<div style="height:200px;border-radius:15px;" class="single-product">
                                <div class="product-f-image" style="border-radius:15px;">
                                    <img style="height:130px;width: 162px;border:1px solid #ccc;border-radius:15px;margin-left: 30px;" src="<%=request.getContextPath() %>/car_img/${t.t_img}" alt="图片不见了">
                                	<h4 style="color:green;margin-left: 90px;margin-top: 15px;">${t.t_type}</h4>
                                </div>
                            </div>
                            
                          </c:forEach>
                            
                        </div>
                    </div>
                    <br> 
                    <br>
                    <!-- 所有汽车 -->
                    <div class="latest-product">
                       <h3>&gt;所有汽车</h3>
                       <div style="height: 400px;border: 1px solid #ccc;" class="product-carousel">
                       <c:forEach var="c" items="${requestScope.Cars}" >
                       
                        	<div style="height:350px;border-radius:15px;" class="single-product">
                                <div class="product-f-image" style="border-radius:15px;">
                                    <img style="height:255px;width: 220px;border:1px solid #ccc;border-radius:15px;" src="<%=request.getContextPath() %>/car_img/${c.carImage.img1}" alt="图片不见了">
                                    <div  class="product-hover">
                                        <a style="width: 170px;" href="#" onclick="yuyue('${c.b_code}')" class="add-to-cart-link"><i class="fa fa-shopping-cart"></i>预约汽车</a>
                                        <a style="width: 170px;" href="${pageContext.request.contextPath }/car/getCarInfo/${c.b_code}" class="view-details-link"><i class="fa fa-link"></i>查看详情</a>
                                    </div>
                                </div>
                                <div style="margin-top: 6px;border:1px solid #CCCCCC;padding-top: 8px;padding-left:5px;" class="product-carousel-price">
	                               <img style="height:60px;width: 75px;position: relative;float: left;" src="<%=request.getContextPath() %>/car_img/${c.type.t_img}">
								   <img style="height:60px;width: 50px;position: relative;float: left;;" src="<%=request.getContextPath() %>/car_img/${c.biaozhi.b_img}">
	                               <i style="color:blue;font-size: 1.2em;">${c.b_code}</i>
	                               <i style="color:blue;font-size: 1.2em;font-family:楷体;font-weight: 800;">${c.b_kuanshi}</i>
	                               <i style="color:red;font-size: 1.2em;">￥:${c.b_price}</i>
                                </div> 
                            </div>
                            
                          </c:forEach>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div> 

<script type="text/javascript">
function yuyue(b_code){
	var u_card='${user.u_card}';
	window.location.href='${pageContext.request.contextPath }/car/makeOrder?b_code='+b_code+'&u_card='+u_card;
}
</script>	 
    
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
    </div> <!-- End footer bottom area -->
   
   <script src="<%=request.getContextPath() %>/fore/js/min.js"></script>
   <script src="<%=request.getContextPath() %>/fore/js/min2.js"></script>
    
    <!-- jQuery sticky menu -->
    <script src="<%=request.getContextPath() %>/fore/js/owl.carousel.min.js"></script>
    <script src="<%=request.getContextPath() %>/fore/js/jquery.sticky.js"></script>
    
    <!-- jQuery easing -->
    <script src="<%=request.getContextPath() %>/fore/js/jquery.easing.1.3.min.js"></script>
    
    <!-- Main Script -->
    <script src="<%=request.getContextPath() %>/fore/js/main.js"></script>
    
    <!-- Slider -->
    <script type="text/javascript" src="<%=request.getContextPath() %>/fore/js/bxslider.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/fore/js/script.slider.js"></script>
  </body>
</html>