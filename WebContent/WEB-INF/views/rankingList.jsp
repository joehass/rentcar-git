<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=0.25"/>
    <title>租车排行榜</title>
    
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
   
   <style type="text/css">
    	.fenye ul li a{
    		text-decoration: none;
    		display: block;
    	}
    	.fenye ul li{
    		list-style-type:none;
    		display: block;
    		height: 45px;
    		width: 120px;
    		border: 1px solid #CCCCCC;
    		float:left;
    		border-radius: 20px;
    		text-align: center;
    		font-family: 楷体;
    		font-size: 1.8em;
    		font-weight: 900;
    		margin-left: 57px;
    		margin-top: 10px;
    	}
    	.fenye ul li:HOVER{
    		background-color: #99CC99;
    		font-size: 2.0em;
    	}
    	input,select,option{
    		font-size: 1.3em;
    	}
    	#menu{
    		display: none;
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
                        <li><a style="font-family: 仿宋;color:black;font-size: 2em;" href="<%=request.getContextPath()%>/car/index/${user.m_card}">首页</a></li>
                        <li><a style="font-family: 仿宋;color:black;font-size: 2em;" href="<%=request.getContextPath()%>/car/managerIndex?m_card=${user.m_card}">我的主页</a></li>
                        <li><a style="font-family: 仿宋;color:black;font-size: 2em;" href="<%=request.getContextPath()%>/car/queryCar?m_card=${user.m_card}">汽车管理</a></li>
                        <li class="active"><a style="font-family: 仿宋;color:red;font-size: 2em;" href="<%=request.getContextPath()%>/car/carRanking?m_card=${user.m_card}">汽车排行榜</a></li>
                    	<li><a style="font-family: 仿宋;color:black;font-size: 2em;" href="<%=request.getContextPath()%>/message/queryUserMessageCount?m_card=${user.m_card}">查看用户留言</a></li>
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
                            <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">汽车使用排行榜</a></li>
                            <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">使用品牌排行</a></li>
                        </ul>
                        <div class="tab-content">
                       		<!-- 排行榜 -->
                            <div role="tabpanel" class="tab-pane fade in active" id="home">
	                            <div id="zt">
	                       			<span id="lll" onclick="cxc()">畅销汽车排行榜</span>
	                       			<input style="margin-left:40px; " type="button" value="导出数据"
	                       			onClick ="$('#table1').tableExport({type: 'excel', escape: 'false'});">
	                       			<label>租车时间：</label> 
                					<input name="start_date" id="b_date" type="date" style="width: 250px;height: 42px;">
                					至<label>租车时间：</label> 
                					<input name="end_date" id="b_date1" type="date" style="width: 250px;height: 42px;">
                					<input type="button" onclick="queryTj()" value="查询" style="margin-left:530px; width: 192px;height: 42px;border-radius:10px; ">
	                       		</div>

                            
								<table cellspacing="0" class="shop_table cart" id="table1">
                                	<tr class="cart_item">
                                        <td class="product-thumbnail">车牌号</td>
                                        <td class="product-thumbnail">使用次数</td>
                                     
                                    </tr>
                                    <c:forEach var="o" items="${pageDate.list}">
                                    	<tr class="cart_item" id="ttr">
	                                        <td class="product-thumbnail">${o.b_code }</td>
	                                        <c:if test="${o.count>0 }">
	                                     	<td class="product-thumbnail">${o.count }</td>
	                                     	</c:if>
                                   	    </tr>
                                    </c:forEach>
                                </table>
                                <div class="fenye" style="margin-left:100px;margin-right:100px ;width:1000;height:70px;border:1px solid #CCCCCC;">
									<ul>
										<li><a href="#" id="frist">首页</a></li>
										<li><a href="#" id="forw">上一页</a></li>
										<li>第${pageDate.page}/${pageDate.totalPage}页</li>
										<li><a href="#" id="next">下一页</a></li>
										<li><a href="#" id="end">尾页</a></li>
									</ul>
								</div>
				            </div>

<script type="text/javascript">
/* 分页 */
var page=${pageDate.page};
var totalPage=${pageDate.totalPage};
function queryTj(){
    debugger;
	var start_date = $("#b_date").val();
	var end_date = $("#b_date1").val();
	window.location.href='<%=request.getContextPath()%>/car/carRankingBydate/?m_card=${user.m_card}&page='+page+'&start_date='+start_date+'&end_date='+end_date;
    }
function queryTj1(){
    debugger;
	var start_date = $("#b_date2").val();
	var end_date = $("#b_date3").val();
	window.location.href='<%=request.getContextPath()%>/car/carRankingQpBydate/?m_card=${user.m_card}&page='+page+'&start_date='+start_date+'&end_date='+end_date;
    }
$(function(){
    $("#frist").click(function(){
    	if(page!=1){
    		page=1;
        	window.location.href='<%=request.getContextPath()%>/car/carRanking/?m_card=${user.m_card}&page='+page;
    	}else{
    		alert("本页就是第一页！");
    	}
    	
	});
	$("#forw").click(function(){
		if(page>1){
			page--;
			window.location.href='<%=request.getContextPath()%>/car/carRanking/?m_card=${user.m_card}&page='+page;
		}else{
			alert("已经是第一页了！");
		}
	});
 	$("#next").click(function(){
 		if(page<totalPage){
			page++;
			window.location.href='<%=request.getContextPath()%>/car/carRanking/?m_card=${user.m_card}&page='+page;
		}else{
			alert("已经是最后一页了！");
		}
	});
 	$("#end").click(function(){
 		if(page!=totalPage){
 			page=totalPage;
			window.location.href='<%=request.getContextPath()%>/car/carRanking/?m_card=${user.m_card}&page='+page;
 		}else{
 			alert("本页就是最后一页！");
 		}
	});
});
</script>

<script type="text/javascript">
/*打印订单*/
function dydd(o_code,u_name){
	$.post("${pageContext.request.contextPath}/order/dyOrderInfo?o_code="+o_code,function(data){
		if("1"==data){
			alert("你好:【 "+u_name+" 】,你的订单与合同下载成功，在D盘下打开！");
		}else{
			alert("你好:【 "+u_name+" 】,你的订单与合同下载失败，请联系公司！");
		}
	});
}

/*支付订单：只能支付未支付订单*/
/* function payOrder(o_state,o_code){
	if("未支付"==o_state){
		var b = confirm("你确定支付订单？");
		if(b){
			window.location.href='${pageContext.request.contextPath}/order/pay?o_code='+o_code+'&m_card=${user.m_card}';
		}else{}
	}else{
		alert("你的操作有误，请查看你的订单状态!");
	}
} */

/* 查询汽车详情 */
/* function queryCarInfo(b_code) {
	window.location.href='${pageContext.request.contextPath }/car/getCarInfo/'+b_code;
} */

/*取消订单：只能取消未支付订单*/
/* function qxdd(o_code,o_state){
	if("未支付"==o_state){
		var b = confirm("订单："+o_code+"，你确定取消订单？");
		if(b){
			window.location.href='${pageContext.request.contextPath}/order/qxOrder?o_code='+o_code+'&m_card=${user.m_card}';
		}else{}
	}else{
		alert("你的操作有误，请查看你的订单状态!");
	}
} */

</script>
			                
                            <!-- 订单统计 -->
                            <div role="tabpanel" class="tab-pane fade" id="profile">
                                <table cellspacing="0" class="shop_table cart" id="table1">
                                	<tr class="cart_item">
                                        <td class="product-thumbnail">类型</td>
                                        <td class="product-thumbnail">使用次数</td>
                                        <label>租车时间：</label> 
                						<input name="start_date" id="b_date2" type="date" style="width: 250px;height: 42px;">
                						至<label>租车时间：</label> 
                						<input name="end_date" id="b_date3" type="date" style="width: 250px;height: 42px;">
                						<input type="button" onclick="queryTj1()" value="查询" style="margin-left:530px; width: 192px;height: 42px;border-radius:10px; ">
                                     
                                    </tr>
                                    <c:forEach var="o" items="${type}">
                                    	<tr class="cart_item" id="ttr">
	                                        <td class="product-thumbnail">${o.t_type }</td>
	                                     	<td class="product-thumbnail">${o.count }</td>
                                   	    </tr>
                                    </c:forEach>
                                </table>
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

  </body>
</html>


<script type="text/javascript" src="<%=request.getContextPath() %>/fore/js/html2canvas.js"></script>  
<script type="text/javascript" src="<%=request.getContextPath() %>/fore/js/swfobject.js"></script>  
<script type="text/javascript" src="<%=request.getContextPath() %>/fore/js/jquery.base64.js"></script>  
<script type="text/javascript" src="<%=request.getContextPath() %>/fore/js/tableExport.js"></script>  
<script type="text/javascript" src="<%=request.getContextPath() %>/fore/js/webtoolkit.sprintf.js"></script>  
<script type="text/javascript" src="<%=request.getContextPath() %>/fore/js/jspdf.js"></script>  
<script type="text/javascript" src="<%=request.getContextPath() %>/fore/js/Base64.js"></script>  
<script>
function funXq(o_code){
	/* Ajax实现异步加载订单，并给表单设置值 */
	$.post("${pageContext.request.contextPath}/order/orderInfo?o_code="+o_code,function(data){
		$("#o_code").text(o_code)
		$("#b_code").html(data.b_code);
		$("#b_price").html(data.b_price);
		$("#start_date").html(data.start_date);
		$("#end_date").html(data.end_date);
		$("#days").html(data.days);
		$("#allMoney").html("￥"+(data.allMoney));
		$("#o_bx").html(data.o_bx);
		$("#o_state").html(data.o_state);
		$("#d_pname").html(data.diqu.d_pname); 

		$("#type").attr("src","<%=request.getContextPath() %>/car_img/"+data.type.t_img); 
		$("#biaozhi").attr("src","<%=request.getContextPath() %>/car_img/"+data.biaozhi.b_img); 

		$("#car_img1").attr("src","<%=request.getContextPath() %>/car_img/"+data.carImage.img1); 
		$("#car_img2").attr("src","<%=request.getContextPath() %>/car_img/"+data.carImage.img2); 
		$("#car_img3").attr("src","<%=request.getContextPath() %>/car_img/"+data.carImage.img3); 
		$("#car_img4").attr("src","<%=request.getContextPath() %>/car_img/"+data.carImage.img4); 
		
	});
}
jQuery(document).ready(function($) {
	$('.xq').click(function() { //jquery的点击事件 
		$('.hide-body').slideDown(200);//将隐藏的窗口div显示出来 
	});
	$('.close-window .close').click(function() {
		$('.hide-body').slideUp(200);//将显示的窗口隐藏起来 
	});
});
</script>
