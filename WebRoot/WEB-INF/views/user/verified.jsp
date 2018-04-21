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
		<link rel="stylesheet" type="text/css" href="<%=path%>/easyui/themes/gray/easyui.css">
		<link rel="stylesheet" type="text/css" href="<%=path%>/easyui/themes/icon.css">
		
		<style type="text/css">
			.verified_content{
				width:200px;
				border:1px;
				margin-left:20px;
				
			}
			input{
				width:100px;
				height:20px;
				margin-bottom:10px;
				
			}
			#verified_form{
				float:right;
				
			}
		</style>
	</head>
	<body>
		<!--boxed layout-->
		
			<header role="banner">
		
            <%@ include file="../head.jsp"%>

			</header>
			<div class="verified_content">
				<form id="verified_form">
					<div class="user_type">
					<input type="checkbox" name="userType" value="1">个人 &emsp
					<input type="checkbox" name="userType" value="2">企业
					</div>
					<div class="emp_info">
						姓名：<input type="text" name="realname" id="real_name" value="${emp.realname}">
						手机号：<input type="text" name="tel" id="real_tel" value="${emp.tel}">
						身份证：<input type="text" name="idCard" id="real_id" >
					</div>
					<div class="company_info">
						公司名称：<input type="text" name="fullname" id="" value="company.fullname">
						公司地址：<input type="text" name="address" id="" value="company.address">
						统一社会信用代码：<input type="text" name="uscCode" id="" >
					</div>
					<div>
						<input type="button" value="验证" onclick="check();">
					</div>
					
				</form>
			</div>

			<footer id="footer">
           <%@ include file="../foot.jsp"%>
			</footer>
	    	<%@ include file="../right.jsp"%>
	</body>
</html>