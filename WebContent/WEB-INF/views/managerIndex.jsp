<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=0.25"/>
    <title>汽车分页查询</title>
    
    <!-- Bootstrap -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/fore/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/fore/css/font-awesome.min.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/fore/css/owl.carousel.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/fore/style.css">
    <link rel="stylesheet" href="<%=request.getContextPath() %>/fore/css/responsive.css">
    <style type="text/css">
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
                <div class="navbar-collapse collapse"  >
                    <ul class="nav navbar-nav" style="border: 1px solid #ccc;border-radius:15px;">
                    	<li  class="active"><a style="font-family: 仿宋;color:red;font-size: 2em;" href="<%=request.getContextPath()%>/car/managerIndex?m_card=${user.m_card}">首页</a></li>
                        <li><a style="font-family: 仿宋;color:black;font-size: 2em;" href="<%=request.getContextPath()%>/manager/getManager/${user.m_card}">我的主页</a></li>
                        <li><a style="font-family: 仿宋;color:black;font-size: 2em;" href="<%=request.getContextPath()%>/car/queryCar?m_card=${user.m_card}">汽车管理</a></li>
                        <li><a style="font-family: 仿宋;color:black;font-size: 2em;" href="<%=request.getContextPath()%>/car/carRanking?m_card=${user.m_card}">汽车排行榜</a></li>
                    	<li><a style="font-family: 仿宋;color:black;font-size: 2em;" href="<%=request.getContextPath()%>/message/queryUserMessageCount?m_card=${user.m_card}">查看用户留言</a></li>
                    </ul>
                </div>  
            </div>
        </div>
    </div> 
<script type="text/javascript">
var i=0;
function funMenu(){
	if(i%2==1){
		$("#menu").hide();
		$("#kz").html("显示分类");
	}else{
		$("#menu").show();
		$("#kz").html("收起分类");
	}
	i++
}

</script>    
    <div class="single-product-area">
        <div class="zigzag-bottom"></div>
       	 <div class="container">
       	 
       	 <div style="margin-left:100px;margin-right:100px ;height:50px; width:1000;font-size: 1.4em;font-weight: 900;">
       	 		<p><label>>所有分类</label><a id="kz" style="margin-left: 800px;" onclick="funMenu()">显示分类</a> </p>
       	 </div>
       	 
       	 <div id="menu">
	       	<form style="margin-left:100px;margin-right:100px ;width:1000;" action="#">
	       		<p>
		       		<label>车牌号码：</label> <input style="width: 192;height: 42px;" name="b_code" id="b_code" type="text">
		       		<label>有无天窗：</label> 
		       		<select name="iswindow" id="iswindow" style="width: 192;height: 42px;border-color: #CCCCCC;">
		       			<option value="">请选择...</option>
		       			<option value="有">有</option>
						<option value="无">无</option>
		       		</select>
		       		<label>汽车品牌：</label> 
		       		<select name="b_name" id="b_name" onchange="XsFun()" style="width: 192;height: 42px;border-color: #CCCCCC;">
		       			<option value="">请选择...</option>
		       			<c:forEach  var="m" items="${marks}">
		       				<option value="${m.b_id}">${m.b_name}</option>
		       			</c:forEach>
		       		</select>
		       		<img alt="显示品牌" id="xspp"
		       		style="border:1px solid #ccc;position:absolute;left: 1030px;top:260px;width:140px;height: 95px;">
                <p>

                	<label>汽车款式：</label> 
		       		<select name="kuanshi" id="kuanshi" style="width: 192;height: 42px;border-color: #CCCCCC;">
		       			<option value="">请选择...</option>
		       			<option value="高配">高配</option>
						<option value="低配">低配</option>
						<option value="典雅款">典雅款</option>
						<option value="悦动款">悦动款</option>
						<option value="运动款">运动款</option>
		       		</select>
		       		<label>燃料类型：</label> 
		       		<select name="ranliao" id="ranliao" style="width: 192;height: 42px;border-color: #CCCCCC;">
		       			<option value="">请选择...</option>
		       			<option value="汽油">汽油</option>
						<option value="CNG">CNG</option>
						<option value="柴油">柴油</option>
						<option value="电力">电力</option>
						<option value="混动">混动</option>
		       		</select>
		       		<label>变速类型：</label> 
		       		<select name="biansu" id="biansu" style="width: 192;height: 42px;border-color: #CCCCCC;">
		       			<option value="">请选择...</option>
		       			<option value="手动">手动</option>
						<option value="自动">自动</option>
						<option value="手自一体">手自一体</option>
						<option value="其他">其他</option>
		       		</select>
                </p>
                <p>
                	<label>座椅材质：</label> 
		       		<select name="zuoyi" id="zuoyi" style="width: 192;height: 42px;border-color: #CCCCCC;">
		       			<option value="">请选择...</option>
		       			<option value="皮质">皮质</option>
						<option value="皮革">皮革</option>
						<option value="织物">织物</option>
						<option value="皮布结合">皮布结合</option>
						<option value="其他">其他</option>
		       		</select>
		       		<label>有无导航：</label> 
		       		<select name="isdao" id="isdao" style="width: 192;height: 42px;border-color: #CCCCCC;">
		       			<option value="">请选择...</option>
		       			<option value="有">有</option>
						<option value="无">无</option>
		       		</select>
		       		<label>汽车类型：</label>
		       		<select name="t_type" id="t_type" onchange="TyFun()" style="width: 192;height: 42px;border-color: #CCCCCC;">
		       			<option value="">请选择...</option>
		       			<c:forEach  var="t" items="${types}">
		       				<option value="${t.t_id}">${t.t_type}</option>
		       			</c:forEach>
		       		</select>
		       		<img alt="显示类型" id="xslx"
		       		style="border:1px solid #ccc;position:absolute;left: 1030px;top:366px;width:140px;height: 95px;">
                </p>
                <p>
                	<label>购车日期：</label> 
                	<input name="date" id="b_date" type="date" style="width: 192;height: 42px;">
		       		<label>座位数量：</label> 
		       		<select name="zuowei" id="zuowei" style="width: 192;height: 42px;border-color: #CCCCCC;">
		       			<option value="">请选择...</option>
		       			<option value="2">2</option>
						<option value="4">4</option>
						<option value="6">6</option>
						<option value="8">8</option>
						<option value="10">10</option>
		       		</select>
		       		<label>车门数量：</label> 
		       		<select name="chemen" id="chemen" style="width: 192;height: 42px;border-color: #CCCCCC;">
		       			<option value="">请选择...</option>
		       			<option value="2">2</option>
						<option value="4">4</option>
						<option value="6">6</option>
						<option value="8">8</option>
		       		</select>
                </p>
                <p>
                	<label>价格区间：</label> 
                	<input name="price1" id="price1" type="text" style="width: 89px;height: 42px;">--
                	<input name="price2" id="price2" type="text" style="width: 89px;height: 42px;">
                	<input type="button" onclick="queryTj()" value="条件查询" style="margin-left:530px; width: 192px;height: 42px;border-radius:10px; ">
                </p>
	       	</form>
       	 </div>

<script type="text/javascript">
/* 页面加载进来，条件框隐藏 */
/* $(document).ready(function(){
	$("#menu").hide();
}); */
$(function(){
	$("#menu").hide();
});

function XsFun(){
	var b_id = $("#b_name").val(); 
	if(""==b_id||null==b_id){
		return;
	}
	$.post("${pageContext.request.contextPath}/car/getMarkImg?b_id="+b_id,function(data){
		 $("#xspp").attr("src","<%=request.getContextPath() %>/car_img/"+data);
	});
}
function TyFun(){
	var t_id = $("#t_type").val(); 
	if(""==t_id||null==t_id){
		return;
	}
	$.post("${pageContext.request.contextPath}/car/getTypeImg?t_id="+t_id,function(data){
		 $("#xslx").attr("src","<%=request.getContextPath() %>/car_img/"+data);
	});
}
</script> 
       	
<script type="text/javascript">
/* 条件查询 */
function queryTj() {
	/* 拼接字符串 */
	var b_code = $("#b_code").val();if(""==b_code){b_code=null;}
	var t_type = $("#t_type").val();if(""==t_type){t_type=null;}
	var b_name = $("#b_name").val();if(""==b_name){b_name=null;}
	var kuanshi = $("#kuanshi").val();if(""==kuanshi){kuanshi=null;}
	var ranliao = $("#ranliao").val();if(""==ranliao){ranliao=null;}
	var biansu = $("#biansu").val();if(""==biansu){biansu=null;}
	var zuoyi = $("#zuoyi").val();if(""==zuoyi){zuoyi=null;}
	var isdao = $("#isdao").val();if(""==isdao){isdao=null;}
	var iswindow = $("#iswindow").val();if(""==iswindow){iswindow=null;}
	var b_date = $("#b_date").val();if(""==b_date){b_date=null;}
	var zuowei = $("#zuowei").val();if(""==zuowei){zuowei=null;}
	var chemen = $("#chemen").val();if(""==chemen){chemen=null;}
	var price1 = $("#price1").val();if(""==price1){price1=null;}
	var price2 = $("#price2").val();if(""==price2){price2=null;}
	
	if((price1!=null&&price2==null)||(price1==null&&price2!=null)){
		alert("请输入价格区间！");
		return;
	}
	if((price1!=null&&price2!=null)&&(price1>=price2)){
		alert("价格一必须小于价格二！");
		return;
	}
	
	var tj = t_type+"!"+b_code+"!"+b_name+"!"+kuanshi+"!"+ranliao+"!"+biansu
	+"!"+zuoyi+"!"+isdao+"!"+iswindow+"!"+b_date+"!"+zuowei
	+"!"+price1+"!"+chemen+"!"+price2;
	
	window.location.href='<%=request.getContextPath()%>/car/getPageCarByTj/?m_card=${user.m_card}&tj='+tj;
	
}


/* 查询汽车详情 */
function queryCarInfo(b_code) {
	window.location.href='${pageContext.request.contextPath }/car/getManagerCarInfo/'+b_code;
}
</script>
            <!-- 遍历没有租出的汽车 -->
			<div style="margin-left:100px;margin-right:100px ;width:1003px;;height:600px;border:3px solid #CCCCCC;border-radius:10px;">
				<c:choose>
					 <c:when test="${empty pageDate.date}">  
					      <h1 style="color:red;text-align: center;">数据库中还没有此条件的汽车！</h1>      
					 </c:when>
					 <c:otherwise> 
					 	<c:forEach var="car" items="${pageDate.date}">				
							<div onclick="funXq('${car.b_code}')" style="margin:10px; width: 312px;height: 280px;border:1px solid #CCCCCC;float:left;">
								<div>
									<img style="padding:1px; margin:5px; width: 301px;height: 190px;border:1px solid #CCCCCC;" alt="" src="<%=request.getContextPath() %>/car_img/${car.carImage.img1 }">
									<img style="padding:1px; margin:5px; width: 80px;height: 70px;border:1px solid #CCCCCC;" alt="" src="<%=request.getContextPath() %>/car_img/${car.type.t_img }">
									<img style="padding:1px; margin:5px; width: 75px;height: 70px;border:1px solid #CCCCCC;" alt="" src="<%=request.getContextPath() %>/car_img/${car.biaozhi.b_img }">
									<label style="color:red;font-size: 1.4em;font-weight: 900;"><i>${car.carState.stateName }</i></label>
								</div>
							</div>
						</c:forEach>
					 </c:otherwise>
				</c:choose>
				
				
			</div> 
			<br>
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
	</div>
<script src="<%=request.getContextPath() %>/fore/js/jquery-1.8.2.min.js"></script>\

<script type="text/javascript">
/* 分页 */
var page=${pageDate.page};
var totalPage=${pageDate.totalPage};
$(function(){
    $("#frist").click(function(){
    	if(page!=1){
    		page=1;
        	window.location.href='<%=request.getContextPath()%>/car/getPageCar/?u_card=${user.m_card}&page='+page;
    	}else{
    		alert("本页就是第一页！");
    	}
    	
	});
	$("#forw").click(function(){
		if(page>1){
			page--;
			window.location.href='<%=request.getContextPath()%>/car/getPageCar/?u_card=${user.m_card}&page='+page;
		}else{
			alert("已经是第一页了！");
		}
	});
 	$("#next").click(function(){
 		if(page<totalPage){
			page++;
			window.location.href='<%=request.getContextPath()%>/car/getPageCar/?u_card=${user.m_card}&page='+page;
		}else{
			alert("已经是最后一页了！");
		}
	});
 	$("#end").click(function(){
 		if(page!=totalPage){
 			page=totalPage;
			window.location.href='<%=request.getContextPath()%>/car/getPageCar/?u_card=${user.m_card}&page='+page;
 		}else{
 			alert("本页就是最后一页！");
 		}
	});
});
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
    </div>
    
    
    <!-- 汽车详情隐藏框 -->
<div class="hide-body" id="jietu">
	<div class="close-window">
<%-- 		<img alt="" src="<%=request.getContextPath() %>/fore/img/qczl.jpg">
 --%>		<a href="javascript:;" title="关闭" class="close">×</a>
		<h3 align="center">汽车详情<span id="o_code"></span></h3>
	</div>
	<div class="login-body" style="background: url('../fore/img/qczl.jpg') no-repeat right bottom;">
		<div style="float: left;margin-left: 50px;">
			<img alt="" src="<%=request.getContextPath() %>/car_img/${user.m_img}" style="width:120px; height: 150px;border: 1px solid #CCCCCC;border-radius:5px; ">
		</div>
		<div class="xx" style="float: left;margin-left: 30px;">
			<p><label>车牌号:</label><span id="b_code1"></span></p>
			<p><label>汽车类型:</label><span id="t_type1"></span></p>
			<p><label>汽车标志:</label><span id="b_biaozhi"></span></p>
			<p><label>汽车款式:</label><span id="b_kuanshi"></span>
		</div>
		<div class="xx" style="float: left;margin-left: 30px;">
			<p><label>购买日期:</label><span id="b_buydate"></span></p>
			<p><label>座椅数:</label><span id="b_zuowei"></span></p>
			<p><label>车门数:</label><span id="b_chemen"></span>
			<p><label>燃料类型:</label><span id="b_ranliao"></span>
		</div>
		<div class="xx" style="float: left;margin-left: 30px;">
			<p><label>有无导航</label><span id="b_isdao"></span></p>
			<p><label>汽车介绍:</label><span id="b_introduce"></span></p>
			<p><label>日租金:</label><span style="color:red;font-weight:900;" id="b_price"></span></p>
			<p><label>汽车状态:</label><span style="color:red;font-weight:900;" id="state"></span></p>
		</div>
		<div>
			<div style="margin-top:15px; margin-left: 60px;">
				<img id="biaozhi" alt="" src="" style="width:90px;height:90px;border: 1px solid #CCCCCC;border-radius:5px; ">
			</div>
			<div style="margin-top:15px; margin-left: 60px;">
				<img id="type" alt="" src="" style="width:90px;height: 90px;border: 1px solid #CCCCCC;border-radius:5px; ">
			</div>
		</div>
		<div style="position:absolute;top:300px;left:222px; width:600px;height:200px;border: 1px solid #CCCCCC;border-radius:5px; ">
			<marquee  behavior="alternate" onmouseover="this.stop();" onmouseout="this.start();">
				<img id="car_img1" alt="" src="" style="margin:7px; width:210px;height: 180px;border: 1px solid #CCCCCC;border-radius:5px; ">
				<img id="car_img2" alt="" src="" style="margin:7px; width:210px;height: 180px;border: 1px solid #CCCCCC;border-radius:5px; ">
				<img id="car_img3" alt="" src="" style="margin:7px; width:210px;height: 180px;border: 1px solid #CCCCCC;border-radius:5px; ">
				<img id="car_img4" alt="" src="" style="margin:7px; width:210px;height: 180px;border: 1px solid #CCCCCC;border-radius:5px; ">
			</marquee>
		</div>
	</div>
	<div class="bottom">
	<br>
		<hr>
		<h3 align="center">风行天下汽车租赁系统欢迎你！ 
			<span style="position:absolute;right:10px;border:1px solid #ccc;font-weight:900;
			border-radius:6px;padding:4px; font-family: 楷体;font-size:0.9em;" 
			onClick ="$('#jietu').tableExport({type: 'png', escape: 'false'});">保存截图</span>
		</h3>
		<input type="hidden" name="uploadfileRealPath">
	</div>
</div>

<script>
function funXq(b_code){
	debugger;
	var page=${pageDate.page};
	/* Ajax实现异步加载订单，并给表单设置值 */
	$.post("${pageContext.request.contextPath}/car/managerIndexXq?b_code="+b_code+"&m_card=${user.m_card}"+"&page="+page,function(data){
		$("#b_code1").html(data.b_code);
		$("#t_type1").html(data.type.t_type);
		$("#b_biaozhi").html(data.biaozhi.b_name);
		$("#b_kuanshi").html(data.b_kuanshi);
		$("#b_buydate").html(data.b_buydate);
		$("#b_zuowei").html(data.b_zuowei);
		$("#b_chemen").html(data.b_chemen);
		$("#b_ranliao").html(data.b_ranliao);
		$("#b_isdao").html(data.b_isdao);
		$("#b_introduce").html(data.b_introduce); 
		$("#state").html(data.state); 
		$("#b_price").html(data.b_price); 
		$("#state").html(data.carState.stateName); 

		$("#type").attr("src","<%=request.getContextPath() %>/car_img/"+data.type.t_img); 
		$("#biaozhi").attr("src","<%=request.getContextPath() %>/car_img/"+data.biaozhi.b_img); 

		$("#car_img1").attr("src","<%=request.getContextPath() %>/car_img/"+data.carImage.img1); 
		$("#car_img2").attr("src","<%=request.getContextPath() %>/car_img/"+data.carImage.img2); 
		$("#car_img3").attr("src","<%=request.getContextPath() %>/car_img/"+data.carImage.img3); 
		$("#car_img4").attr("src","<%=request.getContextPath() %>/car_img/"+data.carImage.img4); 
		$('.hide-body').slideDown(200);//将隐藏的窗口div显示出来 
	});
}
jQuery(document).ready(function($) {
	$('.close-window .close').click(function() {
		$('.hide-body').slideUp(200);//将显示的窗口隐藏起来 
	});
});
</script>
<!-- 订单详情隐藏框 -->
    
    
   
   <script src="<%=request.getContextPath() %>/fore/js/min.js"></script>
   <script src="<%=request.getContextPath() %>/fore/js/min2.js"></script>
    
    <!-- jQuery sticky menu -->
    <script src="<%=request.getContextPath() %>/fore/js/owl.carousel.min.js"></script>
    <script src="<%=request.getContextPath() %>/fore/js/jquery.sticky.js"></script>
    
    <!-- jQuery easing -->
    <script src="<%=request.getContextPath() %>/fore/js/jquery.easing.1.3.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/fore/js/tableExport.js"></script>
    <!-- Main Script -->
    <script src="<%=request.getContextPath() %>/fore/js/main.js"></script>
  </body>
  
  
  
</html>