<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="../base.jsp"%>
<!doctype html>
<!--[if IE 9 ]><html class="ie9" lang="en"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--><html lang="en"><!--<![endif]-->

	<head>
		<title>校园招聘</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<!--meta info-->
		<meta name="author" content="">
		<meta name="keywords" content="">
		<meta name="description" content="">
		<link type="text/css" rel="stylesheet" href="<%=path%>/css/validator.css"></link>
		<script src="<%=path%>/js/formValidator-4.0.1.js" type="text/javascript" charset="UTF-8"></script>
		<script src="<%=path%>/js/formValidatorRegex.js" type="text/javascript" charset="UTF-8"></script>
		<script type="text/javascript" src="<%=path%>/easyui/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="<%=path%>/easyui/locale/easyui-lang-zh_CN.js" ></script>
		<script type="text/javascript" src="<%=path%>/js/jquery-2.1.0.min.js" ></script>
		<link rel="stylesheet" type="text/css" href="<%=path%>/easyui/themes/gray/easyui.css">
		<link rel="stylesheet" type="text/css" href="<%=path%>/easyui/themes/icon.css">
		
		<style type="text/css">
			.verified_content{
				width:800px;
				height:400px;
				border:1px;
				margin-left:20px;
				
			}
			.emp_info>input,.company_info>input{
				width:300px;
				height:15px;
				margin-bottom:10px;
				border-radius:7px;
			}
			.company_info{
				display:none;
			}
			select{
				margin-buttom:10px;
				
		</style>
		<script type="text/javascript">
			$(function(){
				

			$("#user_type_select").change(function(){
				if($(this).val()=="emp"){
					console.log($(this).val());
					$(".company_info").hide();
					$(".emp_info").show();
				}else{
					$(".emp_info").hide();
					$(".company_info").show();
				}
				})
				
				
			})
			
			function check(){
				var realname = $("#real_name").val();
				var mobile = $("#real_tel").val();
				var idcard = $("#real_id").val();
				var url='http://api.jisuapi.com/mobileverify/verify?appkey=b3d65d180b16602c&realname='+realname+'&idcard='+idcard+'&typeid=1&mobile='+mobile;
				console.log(url);
				$.ajax({
		             type: "get",
		             async: false,
		             url: url,
		             dataType: "jsonp",
		             jsonp: "callback",//传递给请求处理程序或页面的，用以获得jsonp回调函数名的参数名(一般默认为:callback)
		             //jsonpCallback:"flightHandler",//自定义的jsonp回调函数名称，默认为jQuery自动生成的随机函数名，也可以写"?"，jQuery会自动为你处理数据
		             success: function(json){
		            	 
		            	var result = json.result;
		            	console.log(result.verifymsg);
		                
		                if(json.msg!="ok"){
		                	swal(json.msg);
		                }else{
		                	swal(result.verifymsg);
			                $.ajax({
			                	type:"get",
			                	url:"<%=path%>/user/updateVerified",
			                	dataType:"json",
			                	success:function(data){
			                		console.log(data);
			                		if(data==true){
			                			
			                		}
			                	}
			                })
		                }
		            	 //alert('您查询到航班信息：票价： ' + json.price + ' 元，余票： ' + json.tickets + ' 张。');
		             },
		             error: function(jsop){
		                 alert(json.msg);
		             }
		         }); 
				
				}
		</script>
	</head>
	<body>
		<!--boxed layout-->
		<div class="boxed_layout relative w_xs_auto">
			<header role="banner">
		
            <%@ include file="../head.jsp"%>

			</header>
			<div class="page_content_offset">
				<div class="container">
					<div class="verified_content">
					<form id="verified_form">
					<div class="user_type">
					<!-- <input class="radio" type="radio" name="userType" value="1">个人 
					<input class="radio" type="radio" name="userType" value="2">企业 -->
					<select id="user_type_select">
						<option value="emp">个人</option>
						<option value="com">企业</option>
					</select>
					</div>
					<div class="emp_info">
						姓名：<input type="text" name="realname" id="real_name" value="${emp.realname}" readonly="readonly"><br>
						手机号：<input type="text" name="tel" id="real_tel" value="${emp.tel}" readonly="readonly"><br>
						身份证：<input type="text" name="idCard" id="real_id" >
					</div>
					<div class="company_info">
						公司名称：<input type="text" name="fullname" id="" value="${company.fullname}"><br>
						公司地址：<input type="text" name="address" id="" value="${company.address }"><br>
						统一社会信用代码：<input type="text" name="uscCode" id="" >
					</div>
					<div>
						<input type="button" value="验证" onclick="check();">
					</div>
					
				</form>
				</div>
				</div>
			</div>
			

			<footer id="footer">
           <%@ include file="../foot.jsp"%>
			</footer>
	    	<%@ include file="../right.jsp"%>
	    	</div>
	</body>
</html>