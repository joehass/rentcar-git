<%@page import="cn.com.clm.beans.CarState"%>
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
                        <li><a style="font-family: 仿宋;color:black;font-size: 2em;" href="<%=request.getContextPath()%>/car/managerIndex?m_card=${user.m_card}">首页</a></li>
                        <li><a style="font-family: 仿宋;color:black;font-size: 2em;" href="<%=request.getContextPath()%>/manager/getManager/${user.m_card}">我的主页</a></li>
                        <li class="active"><a style="font-family: 仿宋;color:red;font-size: 2em;" href="<%=request.getContextPath()%>/car/queryCar?m_card=${user.m_card}">汽车管理</a></li>
                        <li><a style="font-family: 仿宋;color:black;font-size: 2em;" href="<%=request.getContextPath()%>/car/carRanking?m_card=${user.m_card}">汽车排行榜</a></li>
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
                            <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">汽车类型管理</a></li>
                            <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">汽车标志管理</a></li>
                       		<li role="presentation"><a href="#car" aria-controls="car" role="tab" data-toggle="tab">汽车管理</a></li>
                       		<li role="presentation"><a href="#carState" aria-controls="carState" role="tab" data-toggle="tab">汽车状态管理</a></li>
                        </ul>
                        <div class="tab-content">
                       		<!-- 排行榜 -->
                            <div role="tabpanel" class="tab-pane fade in active" id="home">
	                         

<script type="text/javascript">  

function save1(){
	var table1 = "#table1";
	var url1="addType";
 
	save(table1,url1);
}

function save2(){
	var table2 = "#table2";
	var url2="addBiaozhi";

	save(table2,url2);
}

function save3(){
	
	var table3 = "#table3";
	var url3="addCar";

	save(table3,url3);
}
	
function save(obj,url){
	debugger;
	var array = new Array();
	var Type = {};
	var tr = $(obj+" tr");
	for(var i=1;i<tr.length;i++){
		
		var params = {};
		var td = tr.eq(i).find("td");
		for(var j=0;j<td.length-1;j++){
			var input = td.eq(j).find("input");
			var img = td.eq(j).find("img");
			var select = td.eq(j).find("select");
			if(input.length!=0){
				var valueInput = input.val();
				var name1 = input.attr("name");
				params[name1] = valueInput;
			
			}
			if(img.length!=0){
				if(valueInput==''){
					var valueImg = img.attr("value");
					var name1 = img.attr("name");
					params[name1] = valueImg;
				}
			}
			if(select.length!=0){
				var valueSelect = select.val();
				var name1 = select.attr("name");
				params[name1] = valueSelect;
			}
		}
		array.push(params);
		//array.push(params);
	}

	//Type["type"]=array;
	//必须将其转换成json字符串，后台才能使用@Responsebody绑定
	var json = JSON.stringify(array);
	debugger;
	$.ajax({
	    url : "${pageContext.request.contextPath}/car/"+url,
	    type : "POST",
	    async : true,
	    data : json,
	    dataType: "json",
	    traditional: true,
	    contentType:"application/json;charset=UTF-8",
	    success : function(data) {
		   alert("操作成功")
	    },
    error:function(){
    	alert("操作失败");
        }
	});
}

function delete1(obj){
	var url="deleteType";
 
	delete5(obj,url);
}

function delete2(obj){
	var url="deleteBiaozhi";

	delete5(obj,url);
}

function delete3(obj){
	
	var url="deleteCar";

	delete5(obj,url);
}

function delete4(obj){
	
	var url="deteleCarState";

	delete5(obj,url);
}

function  delete5(obj,url){ 
	debugger;
	var params = {};
	var td = $(obj).parent().parent().parent().find("td"); 
	for(i = 0; i < td.length-1;i++){
		var input = td.eq(i).find("input");
		var img = td.eq(i).find("img");
		var select = td.eq(i).find("select");
		if(input.length!=0){
			var valueInput = input.val();
			var name1 = input.attr("name");
			params[name1] = valueInput;
		
		}
		if(select.length!=0){
			var valueSelect = select.val();
			var name1 = select.attr("name");
			params[name1] = valueSelect;
		}
	}
	
	
	$.ajax({
	    url : "${pageContext.request.contextPath}/car/"+url,
	    type : "POST",
	    async : true,
	    data : params,
	    dataType : "json",
	    ContentType : "application/json;charset=UTF-8",
	    success : function(data) {
		    if(data.status=="success"){
		    	alert("操作成功")
			 }

		    if(data.status=="fail"){
		    	alert("操作失败")
			 }
	    }
	});  
  };  

function modify1(obj){
	var url="modifyType";
 
	modify(obj,url);
}

function modify2(obj){
	var url="modifyBiaozhi";

	modify(obj,url);
}

function modify3(obj){
	
	var url="modifyCar";

	modify(obj,url);
}

function modify4(obj){
	
	var url="modifyCarState";

	modify(obj,url);
}

function  modify(obj,url){ 
	debugger;
	var params = {};
	var td = $(obj).parent().parent().parent().find("td"); 
	for(i = 0; i < td.length-1;i++){
		var input = td.eq(i).find("input");
		var img = td.eq(i).find("img");
		var select = td.eq(i).find("select");
		if(input.length!=0){
			var valueInput = input.val();
			var name1 = input.attr("name");
			params[name1] = valueInput;
		
		}
		if(select.length!=0){
			var valueSelect = select.val();
			var name1 = select.attr("name");
			params[name1] = valueSelect;
		}
	}
	
	
	$.ajax({
	    url : "${pageContext.request.contextPath}/car/"+url,
	    type : "POST",
	    async : true,
	    data : params,
	    dataType : "json",
	    ContentType : "application/json;charset=UTF-8",
	    success : function(data) {
		    if(data.status=="success"){
		    	alert("操作成功")
			 }

		    if(data.status=="fail"){
		    	alert("操作失败")
			 }
	    }
	});  
  };  
  /* function add(){
	  var table1 = $('#table1');
	  var tr = $('<tr class="cart_item"></tr>');
	  var td = $('#table1 tr').eq(1).html();
	  $('#table1 tr').eq(1).find('td').find('input').attr("value","");
	  $('#table1 tr').eq(1).find('td').find('img').attr("value","");
	  tr.append(td);
	  table1.append(tr);

	
	}; */

	function add1(obj,model){
		var url = "addType";
		add(obj,url,model);
		}

	function add2(obj,model){
		var url = "addBiaozhi";
		add(obj,url,model);
		}

	function add3(obj,model){
		var url = "addCar";
		add(obj,url,model);
		}
	
	function add(obj,url,model){
		debugger;
		var form = $(obj);
		var input = form.find('input');
		var select = form.find('select');
		var params = {};
		for(var i=0;i<input.length;i++){
			var valueInput = input.eq(i).val();
			var name1 = input.eq(i).attr("name");
			params[name1] = valueInput;
			}
		for(var i=0;i<select.length;i++){
			var valueSelect = select.eq(i).val();
			var name1 = select.eq(i).attr("name");
			params[name1] = valueSelect;
			}

		$.ajax({
		    url : "${pageContext.request.contextPath}/car/"+url,
		    type : "POST",
		    async : true,
		    data : params,
		    dataType : "json",
		    ContentType : "application/json;charset=UTF-8",
		    success : function(data) {
			    if(data.status=="success"){
			    	alert("操作成功")
			    	
				 }

			    if(data.status=="fail"){
			    	alert("操作失败")
				 }
		    }
		});  
		}
</script>  
                            
								<table cellspacing="0" class="shop_table cart" id="table1">
                                	<tr class="cart_item">
                                        <td class="product-thumbnail">汽车类型</td>
                                        <td class="product-thumbnail">类型介绍</td>
                                     	<td class="product-thumbnail">类型图片</td>
                                     	<td class="product-thumbnail">操作</td>
                                    </tr>
                                    <c:forEach var="o" items="${Type.type}">
                                    	<tr class="cart_item" id="ttr">
	                                        <td class="product-thumbnail"><input type="text" name="t_type" value="${o.t_type }"/></td>
	                                     	<td class="product-thumbnail"><input type="text" name="t_introduce" value="${o.t_introduce }"/></td>
	                                     	<td class="product-thumbnail">
	                                     	
	                                     	<img style="height: 100px;width: 100px;float: left;border-radius:5px;border:1px solid #ccc;" id="img" alt="图片暂时无法加载" name="t_img" value="${o.t_img }"  src="<%=request.getContextPath() %>/car_img/${o.t_img }" >
			   								<input style="opacity:0; float:left; height:100px;width:50px;font-size: 0.8em;" id="filgo" type="file" name="t_img" onchange="changeToop('filgo','img')"/>
	                                     	</td>
											
											<td class="product-thumbnail">
											<span
										style="border-radius: 5px; border: 1px solid #99CCFF; background-color: #FFFF99; font-family: 仿宋; font-size: 1.2em; color: #9933FF; font-weight: 900;">
											<a class="xq" onclick="modify1(this)"
											href="#"
											style="text-decoration: none; border-radius: 5px; border: 1px solid #99CCFF; background-color: #99CC99; font-family: 楷体; font-size: 1.3em; color: blue; font-weight: 900;">修改</a>
									</span>
									<span
										style="border-radius: 5px; border: 1px solid #99CCFF; background-color: #FFFF99; font-family: 仿宋; font-size: 1.2em; color: #9933FF; font-weight: 900;">
											<a class="xq" onclick="delete1(this)"
											href="javascript:;"
											style="text-decoration: none; border-radius: 5px; border: 1px solid #99CCFF; background-color: #99CC99; font-family: 楷体; font-size: 1.3em; color: blue; font-weight: 900;">删除</a>
									</span>
									</td>
	                                      </tr>
                                    </c:forEach>
                                </table>
                              <div class="fenye" style="margin-left:80px;margin-right:100px ;width:1500;height:70px;border:1px solid #CCCCCC;">
									<ul>
										<li><a href="#" data-toggle="modal" data-target="#myModal">添加</a></li>
										<li><a href="#" id="frist1">首页</a></li>
										<li><a href="#" id="forw1">上一页</a></li>
										<li>第${Type.page}/${Type.totalPage}页</li>
										<li><a href="#" id="next1">下一页</a></li>
										<li><a href="#" id="end1">尾页</a></li>
									</ul>
								</div>
				            </div>
				            
<script type="text/javascript">
 //定义id选择器
function Id(id){
return document.getElementById(id);
}
//入口函数，两个参数分别为<input type='file'/>的id，还有一个就是图片的id，然后会自动根据文件id得到图片，然后把图片放到指定id的图片标签中
function changeToop(fileid,imgid){
	
    var file = Id(fileid);
    /* if(file.value==''){
        //设置默认图片
    Id("myimg").src='http://sandbox.runjs.cn/uploads/rs/72/huvtowwn/zanwu.png';
    }else{ */
        preImg(fileid,imgid);
    //}
}
//获取input[file]图片的url Important
function getFileUrl(fileId) { 
    var url; 
    var file = Id(fileId);
    var agent = navigator.userAgent;
    if (agent.indexOf("MSIE")>=1) {
    url = file.value; 
    } else if(agent.indexOf("Firefox")>0) { 
    url = window.URL.createObjectURL(file.files.item(0)); 
    } else if(agent.indexOf("Chrome")>0) {
    url = window.URL.createObjectURL(file.files.item(0)); 
    } 
    return url; 
} 
//读取图片后预览
function preImg(fileId,imgId) { 
var imgPre =Id(imgId);
imgPre.src = getFileUrl(fileId); 
}


</script>
				            
<script type="text/javascript">
/* 分页 */
var page1=${Type.page};
var totalPage1=${Type.totalPage};
$(function(){
    $("#frist1").click(function(){
        debugger;
    	if(page1!=1){
    		page1=1;
        	window.location.href='<%=request.getContextPath()%>/car/queryCar/?m_card=${user.m_card}&page='+page1;
    	}else{
    		alert("本页就是第一页！");
    	}
    	
	});
	$("#forw1").click(function(){
		debugger;
		if(page1>1){
			page1--;
			window.location.href='<%=request.getContextPath()%>/car/queryCar/?m_card=${user.m_card}&page='+page1;
		}else{
			alert("已经是第一页了！");
		}
	});
 	$("#next1").click(function(){
 	 	debugger;
 		if(page1<totalPage1){
			page1++;
			window.location.href='<%=request.getContextPath()%>/car/queryCar/?m_card=${user.m_card}&page='+page1;
		}else{
			alert("已经是最后一页了！");
		}
	});
 	$("#end1").click(function(){
 		if(page1!=totalPage){
 			page1=totalPage1;
			window.location.href='<%=request.getContextPath()%>/car/queryCar/?m_card=${user.m_card}&page='+page1;
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
			                
                            <!-- 标志管理 -->
                            <div role="tabpanel" class="tab-pane fade" id="profile">
                            	
                                <table cellspacing="0" class="shop_table cart" id="table2">
                                	<tr class="cart_item">
                                        <td class="product-thumbnail">标志名称</td>
                                        <td class="product-thumbnail">介绍</td>
                                     	<td class="product-thumbnail">标志图片</td>
                                    </tr>
                                    <c:forEach var="o" items="${Biaozhi.biaozhi}">
                                    	<tr class="cart_item" id="ttr">
	                                        <td class="product-thumbnail"><input type="text" name="b_name" value="${o.b_name }" /></td>
	                                     	<td class="product-thumbnail"><input type="text" name="b_introduce" value="${o.b_introduce }" /></td>
                                   	    	<td class="product-thumbnail">
                                   	    	<img style="height: 100px;width: 100px;float: left;border-radius:5px;border:1px solid #ccc;" id="img1" alt="图片暂时无法加载" name="b_img" value="v${o.b_img }"  src="<%=request.getContextPath() %>/car_img/${o.b_img }" >
			   								<input style="opacity:0; float:left; height:100px;width:50px;font-size: 0.8em;" id="filgo1" type="file" name="b_img" onchange="changeToop('filgo1','img1')"/>
                                   	    	</td>
                                   	    	<td class="product-thumbnail">
											<span
										style="border-radius: 5px; border: 1px solid #99CCFF; background-color: #FFFF99; font-family: 仿宋; font-size: 1.2em; color: #9933FF; font-weight: 900;">
											<a class="xq" onclick="modify2(this)"
											href="#"
											style="text-decoration: none; border-radius: 5px; border: 1px solid #99CCFF; background-color: #99CC99; font-family: 楷体; font-size: 1.3em; color: blue; font-weight: 900;">修改</a>
									</span>
									<span
										style="border-radius: 5px; border: 1px solid #99CCFF; background-color: #FFFF99; font-family: 仿宋; font-size: 1.2em; color: #9933FF; font-weight: 900;">
											<a class="xq" onclick="delete2(this)"
											href="javascript:;"
											style="text-decoration: none; border-radius: 5px; border: 1px solid #99CCFF; background-color: #99CC99; font-family: 楷体; font-size: 1.3em; color: blue; font-weight: 900;">删除</a>
									</span>
									</td>
                                   	    </tr>
                                    </c:forEach>
                                </table>
                                <div class="fenye" style="margin-left:80px;margin-right:100px ;width:1500;height:70px;border:1px solid #CCCCCC;">
									<ul>
										<li><a href="#" data-toggle="modal" data-target="#myModal1" id="add1">添加</a></li>
										<li><a href="#" id="frist2">首页</a></li>
										<li><a href="#" id="forw2">上一页</a></li>
										<li>第${Biaozhi.page}/${Biaozhi.totalPage}页</li>
										<li><a href="#" id="next2">下一页</a></li>
										<li><a href="#" id="end2">尾页</a></li>
									</ul>
								</div>
                            </div>
                            
                            <script type="text/javascript">

function kzc(){
	var o_state = "Y";
	window.location.href='${pageContext.request.contextPath}/car/getCarByState?o_state='+o_state+'&m_card=${user.m_card}';
}
function yzc(){
	var o_state = "N";
	window.location.href='${pageContext.request.contextPath}/car/getCarByState?o_state='+o_state+'&m_card=${user.m_card}';
}
function yyy(){
	var o_state = "Z";
	window.location.href='${pageContext.request.contextPath}/car/getCarByState?o_state='+o_state+'&m_card=${user.m_card}';
}
function yxj(){
	var o_state = "L";
	window.location.href='${pageContext.request.contextPath}/car/getCarByState?o_state='+o_state+'&m_card=${user.m_card}';
}
function xlz(){
	var o_state = "X";
	window.location.href='${pageContext.request.contextPath}/car/getCarByState?o_state='+o_state+'&m_card=${user.m_card}';
}

</script> 


                            <!-- 状态管理 -->
                            <div role="tabpanel" class="tab-pane fade" id="carState">
                        		<div id="zt">
	                       			<span id="rrr" onclick="yzf()">已支付 </span>
	                       			<span onclick="kzc()">可租出</span>
	                       			<span onclick="yzc()">已租出</span>
	                       			<span onclick="yyy()">已预约</span>
	                       			<span onclick="yxj()">已下架</span>
	                       			<span onclick="xlz()">修理中</span>
	                       		</div>
                                <table cellspacing="0" class="shop_table cart" id="table2">
                                	<tr class="cart_item">
                                        <td class="product-thumbnail">车牌号</td>
                                        <td class="product-thumbnail">汽车状态</td>
                                        <td class="product-thumbnail">操作</td>
                                    </tr>
                                    <c:forEach var="o" items="${Car1.date}">
                                    	<tr class="cart_item" id="ttr">
	                                        <td class="product-thumbnail"><input type="text" name="b_code" value="${o.b_code }" /></td>
											<td class="product-thumbnail"><select class="read" id="carStateSelect" name="state" >
											<c:forEach var="k" items="${CarState}">
											${o.state }
											<c:choose>
												<c:when test="${k.state==o.state}">
													<option value="${k.state}" selected="selected">${k.stateName }</option>
												</c:when>
												<c:otherwise> 
												${o.state }
													<option value="${k.state}" >${k.stateName }</option>
												</c:otherwise>
											</c:choose>
											</c:forEach>
										</select></td>                             
										
                                   	    	<td class="product-thumbnail">
											<span
										style="border-radius: 5px; border: 1px solid #99CCFF; background-color: #FFFF99; font-family: 仿宋; font-size: 1.2em; color: #9933FF; font-weight: 900;">
											<a class="xq" onclick="modify4(this)"
											href="#"
											style="text-decoration: none; border-radius: 5px; border: 1px solid #99CCFF; background-color: #99CC99; font-family: 楷体; font-size: 1.3em; color: blue; font-weight: 900;">修改</a>
									</span>
							
									</td>
                                   	    </tr>
                                    </c:forEach>
                                </table>
                                <div class="fenye" style="margin-left:100px;margin-right:100px ;width:1000;height:70px;border:1px solid #CCCCCC;">
									<ul>
										<li><a href="#" id="frist3">首页</a></li>
										<li><a href="#" id="forw3">上一页</a></li>
										<li>第${Car1.page}/${Car1.totalPage}页</li>
										<li><a href="#" id="next3">下一页</a></li>
										<li><a href="#" id="end3">尾页</a></li>
									</ul>
								</div>
                            </div>
       
 
                            
<script type="text/javascript">

/* 分页 */
var page2=${Biaozhi.page};
var totalPage2=${Biaozhi.totalPage};
$(function(){
    $("#frist2").click(function(){
    	if(page2!=1){
    		page2=1;
        	window.location.href='<%=request.getContextPath()%>/car/queryCar/?m_card=${user.m_card}&page='+page2;
    	}else{
    		alert("本页就是第一页！");
    	}
    	
	});
	$("#forw2").click(function(){
		if(page2>1){
			page2--;
			window.location.href='<%=request.getContextPath()%>/car/queryCar/?m_card=${user.m_card}&page='+page2;
		}else{
			alert("已经是第一页了！");
		}
	});
 	$("#next2").click(function(){
 	 	debugger;
 		if(page2<totalPage2){
			page2++;
			window.location.href='<%=request.getContextPath()%>/car/queryCar/?m_card=${user.m_card}&page='+page2;
		}else{
			alert("已经是最后一页了！");
		}
	});
 	$("#end2").click(function(){
 		if(page2!=totalPage2){
 			page2=totalPage2;
			window.location.href='<%=request.getContextPath()%>/car/queryCar/?m_card=${user.m_card}&page='+page2;
 		}else{
 			alert("本页就是最后一页！");
 		}
	});
});
</script>
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
                            
                            <!-- 汽车管理 -->
                            <div role="tabpanel" class="tab-pane fade" id="car">
                            	<div id="zt2">
	                       			<span id="lll" onclick="cxc()">畅销汽车排行榜</span>
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
	var price1 = null;
	var price2 = null;
	
	
	
	var tj = t_type+"!"+b_code+"!"+b_name+"!"+kuanshi+"!"+ranliao+"!"+biansu
	+"!"+zuoyi+"!"+isdao+"!"+iswindow+"!"+b_date+"!"+zuowei
	+"!"+price1+"!"+chemen+"!"+price2;
	
	window.location.href='<%=request.getContextPath()%>/car/queryCarByTj1/?m_card=${user.m_card}&tj='+tj;
	
}


/* 查询汽车详情 */
function queryCarInfo(b_code) {
	window.location.href='${pageContext.request.contextPath }/car/getCarInfo/'+b_code;
}
</script>
	                       			
	                       		</div>
                                <table cellspacing="0" class="shop_table cart" id="table3">
                                	<tr class="cart_item">
                                        <td class="product-thumbnail">汽车车牌</td>
                                        <td class="product-thumbnail">汽车类型</td>
                                        <td class="product-thumbnail">汽车标志</td>
                                        <td class="product-thumbnail">燃料类型</td>
										<td class="product-thumbnail">汽车成本</td>
										<td class="product-thumbnail">汽车款式</td>
										<td class="product-thumbnail">购车年份</td>
										<td class="product-thumbnail">座位数</td>
										<td class="product-thumbnail">车门数</td>
										<td class="product-thumbnail">变速箱类型</td>
										<td class="product-thumbnail">座椅材质</td>
										<td class="product-thumbnail">有无导航</td>
										<td class="product-thumbnail">有无天窗</td>
										<td class="product-thumbnail">简介</td>
										<td class="product-thumbnail">状态</td>
										<td class="product-thumbnail">日租价</td>
										<td class="product-thumbnail">车辆操作</td>
                                    </tr>
                                    <c:forEach var="o" items="${Car.date}">
                                    	<tr class="cart_item" id="ttr">
	                                      <td class="product-thumbnail"><input class="read" type="text" name="b_code"  value="${o.b_code }"></input></td>
			                             <td class="product-thumbnail"><select class="read" name="t_id" >
											<c:forEach var="i" items="${type}">
											<c:choose>
												<c:when test="${i.t_id==o.type.t_id}">
													<option value="${i.t_id}" selected="selected">${i.t_type }</option>
												</c:when>
												<c:otherwise> 
													<option value="${i.t_id}">${i.t_type }</option>
												</c:otherwise>
											</c:choose>
											</c:forEach>
										</selec></td>
										<td class="product-thumbnail"><select class="read" name="b_id" >${o.biaozhi.b_name}
											<c:forEach var="j" items="${biaozhi}">
											<c:choose>
												<c:when test="${j.b_id==o.biaozhi.b_id}">
													<option value="${j.b_id}" selected="selected">${j.b_name }</option>
												</c:when>
												<c:otherwise> 
													<option value="${j.b_id}">${j.b_name }</option>
												</c:otherwise>
											</c:choose>
												
											</c:forEach>
										</selec></td>
									
									<td class="product-thumbnail"><select class="read" name="b_ranliao" >${o.b_ranliao}
										<c:choose>
												<c:when test="${o.b_ranliao=='汽油'}">
													<option value="汽油" selected="selected">汽油</option>
												</c:when>
												<c:when test="${o.b_ranliao=='电力'}">
													<option value="电力" selected="selected">电力</option>
												</c:when>
												<c:when test="${o.b_ranliao=='柴油'}">
													<option value="柴油" selected="selected">柴油</option>
												</c:when>
												<c:when test="${o.b_ranliao=='混动'}">
													<option value="混动" selected="selected">混动</option>
												</c:when>
												<c:otherwise> 
													<option value="电力">电力</option>
													<option value="柴油">柴油</option>
													<option value="混动">混动</option>
												</c:otherwise>
											</c:choose>
						
										
									</select></td>
			                             <td class="product-thumbnail"><input class="read" type="text" name="cost"  value="${o.cost }"></input></td>
									<td onclick="queryCarInfo('${o.b_kuanshi}')"
										class="product-thumbnail"><input class="read" type="text" name="b_kuanshi"  value="${o.b_kuanshi}"></td>
									<td class="product-thumbnail"><input class="read" type="text" name="b_buydate"  value="${o.b_buydate}"></td>
									<td class="product-thumbnail"><select class="read" name="b_zuowei" >${o.b_zuowei}
									<c:choose>
												<c:when test="${o.b_zuowei==2}">
													<option value="2"selected="selected">2</option>
												</c:when>
												<c:when test="${o.b_zuowei==4}">
													<option value="4"selected="selected">4</option>
												</c:when>
												<c:when test="${o.b_zuowei==6}">
													<option value="6"selected="selected">6</option>
												</c:when>
												<c:when test="${o.b_zuowei==8}">
													<option value="8"selected="selected">8</option>
												</c:when>
												<c:otherwise> 
													<option value="2">2</option>
													<option value="4">4</option>
													<option value="6">6</option>
													<option value="8">8</option>
												</c:otherwise>
											</c:choose>
										
									</selec></td>
									<td class="product-thumbnail"
										style="color: red; font-size: 1.3em; font-weight: 900;"><select class="read" name="b_chemen" >${o.b_chemen}
										<c:choose>
												<c:when test="${o.b_chemen==2}">
													<option value="2"selected="selected">2</option>
												</c:when>
												<c:when test="${o.b_zuowei==4}">
													<option value="4"selected="selected">4</option>
												</c:when>
												<c:when test="${o.b_zuowei==6}">
													<option value="6"selected="selected">6</option>
												</c:when>
												
												<c:otherwise> 
													<option value="2">2</option>
													<option value="4">4</option>
													<option value="6">6</option>
													
												</c:otherwise>
											</c:choose>
										</select></td>
									<td class="product-thumbnail"><select class="read" name="b_biansu" >${o.b_biansu}
									<c:choose>
										<c:when test="${o.b_biansu=='手自一体'}">
											<option value="手自一体"selected="selected">手自一体</option>
										</c:when>
										<c:when test="${o.b_biansu=='手动'}">
											<option value="手动"selected="selected">手动</option>
										</c:when>
										<c:otherwise> 
											<option value="手自一体">手自一体</option>
											<option value="手动">手动</option>
										</c:otherwise>
									</c:choose>
										
									</select></td>
									<td class="product-thumbnail"><select class="read" name="b_zuoyi" >${o.b_zuoyi}
									<c:choose>
										<c:when test="${o.b_zuoyi=='皮布结合'}">
											<option value="皮布结合"selected="selected">皮布结合</option>
										</c:when>
										<c:when test="${o.b_zuoyi=='皮质'}">
											<option value="皮质"selected="selected">手动</option>
										</c:when>
										<c:otherwise> 
											<option value="皮布结合">皮布结合</option>
											<option value="皮质">皮质</option>
										</c:otherwise>
									</c:choose>
										
									</select></td>
									<td class="product-thumbnail"><select class="read" name="b_isdao" >${o.b_isdao}
									<c:choose>
										<c:when test="${o.b_isdao=='有'}">
											<option value="有"selected="selected">有</option>
										</c:when>
										<c:when test="${o.b_isdao=='没'}">
											<option value="没"selected="selected">手动</option>
										</c:when>
										<c:otherwise> 
											<option value="有">有</option>
											<option value="没">没</option>
										</c:otherwise>
									</c:choose>
										
									</select></td>
									<td class="product-thumbnail"><select class="read" name="b_iswindow" >${o.b_iswindow}
										<c:choose>
										<c:when test="${o.b_iswindow=='有'}">
											<option value="有"selected="selected">有</option>
										</c:when>
										<c:when test="${o.b_iswindow=='没'}">
											<option value="没"selected="selected">手动</option>
										</c:when>
										<c:otherwise> 
											<option value="有">有</option>
											<option value="没">没</option>
										</c:otherwise>
									</c:choose>
									</select></td>
									<td class="product-thumbnail"><input class="read" type="text" name="stateName"  value="${o.carState.stateName}"></td>
									<td class="product-thumbnail"><input class="read" type="text" name="b_introduce"  value="${o.b_introduce}"></td>
									<td class="product-thumbnail"><input class="read" type="text" name="b_price"  value="${o.b_price}"></td>

									<td class="product-thumbnail"><span
										style="border-radius: 5px; border: 1px solid #99CCFF; background-color: #FFFF99; font-family: 仿宋; font-size: 1.2em; color: #9933FF; font-weight: 900;">
											<a class="xq" onclick="modify3(this)"
											href="javascript:;"
											style="text-decoration: none; border-radius: 5px; border: 1px solid #99CCFF; background-color: #99CC99; font-family: 楷体; font-size: 1.3em; color: blue; font-weight: 900;">修改</a>
									</span>
									<span
										style="border-radius: 5px; border: 1px solid #99CCFF; background-color: #FFFF99; font-family: 仿宋; font-size: 1.2em; color: #9933FF; font-weight: 900;">
											<a class="xq" onclick="delete3(this)"
											href="javascript:;"
											style="text-decoration: none; border-radius: 5px; border: 1px solid #99CCFF; background-color: #99CC99; font-family: 楷体; font-size: 1.3em; color: blue; font-weight: 900;">删除</a>
									</span>
									</td>
									</tr>
                                    </c:forEach>
                                </table>
                                <div class="fenye" style="margin-left:80px;margin-right:100px ;width:1500;height:70px;border:1px solid #CCCCCC;">
									<ul>
										<li><a href="#" data-toggle="modal" data-target="#myModal2" id="add1">添加</a></li>
										<li><a href="#" id="frist4">首页</a></li>
										<li><a href="#" id="forw4">上一页</a></li>
										<li>第${Car.page}/${Car.totalPage}页</li>
										<li><a href="#" id="next4">下一页</a></li>
										<li><a href="#" id="end4">尾页</a></li>
									</ul>
								</div>	
                            </div>
                            
                        </div>
                      </div>
                      
            </div>
        </div>
        
<script type="text/javascript">
/* 分页 */
var page3=${Car1.page};
var totalPage3=${Car1.totalPage};
$(function(){
    $("#frist3").click(function(){
    	if(page3!=1){
    		page3=1;
        	window.location.href='<%=request.getContextPath()%>/car/queryCar/?m_card=${user.m_card}&page='+page3;
    	}else{
    		alert("本页就是第一页！");
    	}
    	
	});
	$("#forw3").click(function(){
		if(page3>1){
			page3--;
			window.location.href='<%=request.getContextPath()%>/car/queryCar/?m_card=${user.m_card}&page='+page3;
		}else{
			alert("已经是第一页了！");
		}
	});
 	$("#next3").click(function(){
 	 	debugger;
 		if(page3<totalPage3){
			page3++;
			window.location.href='<%=request.getContextPath()%>/car/queryCar/?m_card=${user.m_card}&page='+page3;
		}else{
			alert("已经是最后一页了！");
		}
	});
 	$("#end3").click(function(){
 		if(page3!=totalPage3){
 			page3=totalPage3;
			window.location.href='<%=request.getContextPath()%>/car/queryCar/?m_card=${user.m_card}&page='+page3;
 		}else{
 			alert("本页就是最后一页！");
 		}
	});
});
</script>

<script type="text/javascript">
/* 分页 */
var page4=${Car.page};
var totalPage4=${Car.totalPage};
$(function(){
    $("#frist4").click(function(){
    	if(page4!=1){
    		page4=1;
        	window.location.href='<%=request.getContextPath()%>/car/queryCar/?m_card=${user.m_card}&page='+page4;
    	}else{
    		alert("本页就是第一页！");
    	}
    	
	});
	$("#forw4").click(function(){
		if(page4>1){
			page4--;
			window.location.href='<%=request.getContextPath()%>/car/queryCar/?m_card=${user.m_card}&page='+page4;
		}else{
			alert("已经是第一页了！");
		}
	});
 	$("#next4").click(function(){
 	 	debugger;
 		if(page4<totalPage4){
			page4++;
			window.location.href='<%=request.getContextPath()%>/car/queryCar/?m_card=${user.m_card}&page='+page4;
		}else{
			alert("已经是最后一页了！");
		}
	});
 	$("#end4").click(function(){
 		if(page4!=totalPage4){
 			page4=totalPage4;
			window.location.href='<%=request.getContextPath()%>/car/queryCar/?m_card=${user.m_card}&page='+page4;
 		}else{
 			alert("本页就是最后一页！");
 		}
	});
});
</script>

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


<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- 按钮触发模态框 -->
<!-- type模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					添加汽车类型
				</h4>
			</div>
		<form id="formType">
			<div class="modal-body">
	            	汽车类型：<input type="text" name="t_type"/><br/>
	            	类型介绍：<input type="text" name="t_introduce"/><br/>
					类型图片：<input type="file" id="filgo" name="t_img" />

			
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
				<button type="button" onclick="add1('#formType','#myModal')" class="btn btn-primary">
					提交更改 
				</button>
			</div>
			</form>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>

<!-- biaozhi模态框（Modal） -->
<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					添加汽车类型
				</h4>
			</div>
		<form id="formType1">
			<div class="modal-body">
	            	标志名称：<input type="text" name="b_name" value="${o.b_name }" /><br/>
	                                          标志介绍：<input type="text" name="b_introduce" value="${o.b_introduce }" /><br/>
			   		 标志图片：<input id="filgo1" type="file" name="b_img"/><br/>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
				<button type="button" onclick="add2('#formType1','#myModal1')" class="btn btn-primary">
					提交更改 
				</button>
			</div>
			</form>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>


<!-- car模态框（Modal） -->
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					添加汽车
				</h4>
			</div>
		<form id="formType2">
			<div class="modal-body">
			
	            	 汽车车牌:<input class="read" type="text" name="b_code">
	            	 </input><br/>
			         	汽车类型:<select class="read" name="t_id" >
							<c:forEach var="i" items="${Type.type}">
								<option value="${i.t_id}">${i.t_type }</option>
							</c:forEach>
					</select>
					汽车标志:<select class="read" name="b_id" >
							<c:forEach var="j" items="${Biaozhi.biaozhi}">
									<option value="${j.b_id}">${j.b_name }</option>
							</c:forEach>
						</select><br/>
									
					燃料类型:<select class="read" name="b_ranliao" >
									<option value="汽油">汽油</option>
									<option value="电力">电力</option>
									<option value="柴油">柴油</option>
									<option value="混动">混动</option>
					</select>
			       汽车成本: <input class="read" type="text" name="cost" ></input><br>
					汽车款式:<input class="read" type="text" name="b_kuanshi" >
					座位数:<select class="read" name="b_zuowei" >
							<option value="2">2</option>
							<option value="4">4</option>
							<option value="6">6</option>
						</select>
					车门数:<select class="read" name="b_chemen" >
							<option value="2">2</option>
							<option value="4">4</option>
							<option value="6">6</option>
						</select><br>
					变速箱类型:<select class="read" name="b_biansu" >
								<option value="手自一体">手自一体</option>
								<option value="手动">手动</option>
							</select>
					座椅材质:<select class="read" name="b_zuoyi" >
								<option value="皮布结合">皮布结合</option>
								<option value="皮质">皮质</option>
							</select><br/>
					有无导航:<select class="read" name="b_isdao" >
								<option value="有">有</option>
								<option value="没">没</option>
							</select>
					有无天窗:<select class="read" name="b_iswindow" >
								<option value="有">有</option>
								<option value="没">没</option>
							</select><br/>
					简介:<input class="read" type="text" name="b_introduce" >
					日租价:<input class="read" type="text" name="b_price"><br/>
					选择汽车图片：<input type="file" name="carImage.img1"/>
								<input type="file" name="carImage.img2"/><br/>
								<input type="file" name="carImage.img3"/>
								<input type="file" name="carImage.img4"/>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
				<button type="button" onclick="add3('#formType2','#myModal2')" class="btn btn-primary">
					提交更改 
				</button>
			</div>
			</form>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>

</html>
