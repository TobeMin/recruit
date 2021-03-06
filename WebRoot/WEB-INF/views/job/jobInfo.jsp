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
		<script type="text/javascript">


function save(){
	var userVerified = ${user.verified};
	//console.log(userVerified);
	if(userVerified==1){
	
		$.ajax({
	          url:"<%=path%>/job/applyJob",
	          type:"post",
	          dataType:"json",
	          data:$("#jobform").serialize(),
	          success:function(data, textStatus, jqXHR){
	          		if(data == 1){
	          			swal("申请成功!");
	          		}else if(data == 2){
	          			swal("请先登入或者该用户不是求职用户");
	          		}else if(data == 3){
	          	    	swal("求职用户没有简历,请完善个人信息之后再申请!");
	          		}else{
	          		swal("申请失败!!!");
	          		}
	          },
	          error:function(){
	           	 	swal("异常信息!");
	          }
	   });	
		
	}else{
		swal("请先进行实名认证");
	}
	}
		</script>
	</head>
	<body>
		<!--wide layout-->
		<div class="wide_layout relative">
			<!--[if (lt IE 9) | IE 9]>
				<div style="background:#fff;padding:8px 0 10px;">
				<div class="container" style="width:1170px;"><div class="row wrapper"><div class="clearfix" style="padding:9px 0 0;float:left;width:83%;"><i class="fa fa-exclamation-triangle scheme_color f_left m_right_10" style="font-size:25px;color:#e74c3c;"></i><b style="color:#e74c3c;">Attention! This page may not display correctly.</b> <b>You are using an outdated version of Internet Explorer. For a faster, safer browsing experience.</b></div><div class="t_align_r" style="float:left;width:16%;"><a href="http://windows.microsoft.com/en-US/internet-explorer/products/ie/home?ocid=ie6_countdown_bannercode" class="button_type_4 r_corners bg_scheme_color color_light d_inline_b t_align_c" target="_blank" style="margin-bottom:2px;">Update Now!</a></div></div></div></div>
			<![endif]-->
			<!--markup header-->
	<!--boxed layout-->
		<div class="boxed_layout relative w_xs_auto">
			<!--[if (lt IE 9) | IE 9]>
				<div style="background:#fff;padding:8px 0 10px;">
				<div class="container" style="width:1170px;"><div class="row wrapper"><div class="clearfix" style="padding:9px 0 0;float:left;width:83%;"><i class="fa fa-exclamation-triangle scheme_color f_left m_right_10" style="font-size:25px;color:#e74c3c;"></i><b style="color:#e74c3c;">Attention! This page may not display correctly.</b> <b>You are using an outdated version of Internet Explorer. For a faster, safer browsing experience.</b></div><div class="t_align_r" style="float:left;width:16%;"><a href="http://windows.microsoft.com/en-US/internet-explorer/products/ie/home?ocid=ie6_countdown_bannercode" class="button_type_4 r_corners bg_scheme_color color_light d_inline_b t_align_c" target="_blank" style="margin-bottom:2px;">Update Now!</a></div></div></div></div>
			<![endif]-->
			<!--markup header-->
			<header>
            <%@ include file="../head.jsp"%>
			</header>
		
			<!--content-->
			
		<!--content-->
			<div class="page_content_offset">
				<div class="container">
					<div class="row clearfix">
						<!--left content column-->
						<section class="col-lg-9 col-md-9 col-sm-9">
							<div class="row clearfix">
							 <%@ include file="../contact.jsp"%>
								<div class="col-lg-8 col-md-8 col-sm-8 m_xs_bottom_30">
									<h2 class="tt_uppercase color_dark m_bottom_25"></h2>
									<p class="m_bottom_10"> <span class="scheme_color"></span> </p>
									<ul id="errorlist"></ul>
									<form id="jobform" >
									<input type="hidden"  id="jobId" name="jobId" class="full_width r_corners" value="${job.jobId}" readonly="true" >
										<input type="hidden"  id="comId" name="comId" class="full_width r_corners" value="${job.comId}" readonly="true" >
										<ul>
											<li class="clearfix m_bottom_15">
												<div class="f_left half_column">
													<label for="jobName" class="required d_inline_b m_bottom_5">职位名称:</label>
													<input type="text"  id="jobName" name="jobName" class="full_width r_corners" value="${job.jobName}" readonly="true" >
												</div>
											</li>
											<li class="m_bottom_15">
												<label for="cf_message" class="d_inline_b m_bottom_5 required">工作类型</label>
													<input type="text"  id="jobStatus" name="jobStatus" class="full_width r_corners" value="${job.jobStatus}" readonly="true" >
											</li>
									     <li class="m_bottom_15">
												<label for="jobPersoncount" class="d_inline_b m_bottom_5">招聘(人数):</label>
												<input type="text" id="jobPersoncount" name="jobPersoncount" class="full_width r_corners" value="1" value="${job.jobPersoncount}" readonly="true">
											</li>
	                                     <li class="m_bottom_15">
												<label for="description" class="d_inline_b m_bottom_5 required">岗位介绍</label>
												<input id="description" type="text" name="description" class="full_width r_corners" value="${job.description}" readonly="true"></input>
												<div id="descriptionTip" style="width:250px">
											</li>
										<li class="m_bottom_15">
												<label for="degree" class="d_inline_b m_bottom_5">学历要求:</label>
												<input type="text" id="degree" name="degree" class="full_width r_corners" value="${job.degree}" readonly="true">
											    <div id="degreeTip" style="width:250px">
											</li>
											<li class="m_bottom_15">
												<label for="language" class="d_inline_b m_bottom_5">语言要求:</label>
												<input type="text" id="language" name="language" class="full_width r_corners" value="${job.language}" readonly="true">
											    <div id="languageTip" style="width:250px">
											</li>
											<li class="m_bottom_15">
												<label for="salary" class="d_inline_b m_bottom_5">薪资:</label>
												<input type="text" id="salary" name="salary" class="full_width r_corners" value="${job.salary}" readonly="true">
											    <div id="salaryTip" style="width:250px">
											</li>
											<li class="m_bottom_15">
												<label for="address" class="d_inline_b m_bottom_5">工作地点:</label>
												<input type="text" id="address" name="address" class="full_width r_corners" value="${job.address}" readonly="true">
											    <div id="addressTip" style="width:250px">
											</li>
								         <li class="m_bottom_15">
												<label for="startDate" class="d_inline_b m_bottom_5">起始日期:</label>
												<input type="text" id="startDate" name="startDate" class="full_width r_corners" value="${job.startDate}" readonly="true">
											    <div id="startDateTip" style="width:250px">
											</li>
											<li class="m_bottom_15">
												<label for="endDate" class="d_inline_b m_bottom_5">截止日期:</label>
												<input type="text" id="endDate" name="endDate" class="full_width r_corners" value="${job.endDate}" readonly="true">
											    <div id="endDateTip" style="width:250px">
											</li>
											<ul>
											<li class="clearfix m_bottom_15">
												<div class="f_left half_column">
													<label for="fullname" class="required d_inline_b m_bottom_5">公司名称:</label>
													<input type="text"  id="fullname" name="fullname" class="full_width r_corners" value="${job.fullname}" readonly="true">

												</div>
											</li>
											<li class="m_bottom_15">
												<label for="cf_message" class="d_inline_b m_bottom_5 required">公司类型</label>
												<input type="text"  id="comtype" name="comtype" class="full_width r_corners" value="${job.comtype}" readonly="true" >
		
											</li>
									     <li class="m_bottom_15">
												<label for="empcount" class="d_inline_b m_bottom_5">公司规模(人数):</label>
												<input type="text" id="empcount" name="empcount" class="full_width r_corners" value="${job.empcount}" readonly="true">
											    <div id="empcountTip" style="width:250px">
											</li>
	                                     <li class="m_bottom_15">
												<label for="description" class="d_inline_b m_bottom_5 required">公司介绍</label>
												<input  type="text" id="description" name="description" class="full_width r_corners" value="${job.comDescription}" readonly="true"></input>
												<div id="descriptionTip" style="width:250px">
											</li>
										<li class="m_bottom_15">
												<label for="address" class="d_inline_b m_bottom_5">地址:</label>
												<input type="text" id="address" name="address" class="full_width r_corners" value="${job.comAddress}" readonly="true">
					
											</li>
											<li class="m_bottom_15">
												<label for="email" class="d_inline_b m_bottom_5">邮箱:</label>
												<input type="text" id="email" name="email" class="full_width r_corners" value="${job.email}" readonly="true">
							
											</li>
											<li class="m_bottom_15">
												<label for="tel" class="d_inline_b m_bottom_5">公司电话:</label>
												<input type="text" id="tel" name="tel" class="full_width r_corners" value="${job.tel}" readonly="true">
											    <div id="telTip" style="width:250px">
											</li>
								         <li class="m_bottom_15">
												<label for="manager" class="d_inline_b m_bottom_5">联系人:</label>
												<input type="text" id="manager" name="manager" class="full_width r_corners" value="${job.manager}" readonly="true">
											    <div id="managerTip" style="width:250px">
											</li>
											<li class="m_bottom_15">
												<label for="m_tel" class="d_inline_b m_bottom_5">联系人电话:</label>
												<input type="text" id="mTel" name="mTel" class="full_width r_corners" value="${job.mTel}" readonly="true">
											    <div id="mTelTip" style="width:250px">
											</li>

											<li class="m_bottom_15">
												<button class="button_type_4 bg_light_color_2 r_corners mw_0 tr_all_hover color_dark" type="button" onclick="save();">申请职位</button>
											</li>
										</ul>
									</form>
								</div>
							</div>
						</section>
					

					</div>
				</div>
			</div>
			<!--markup footer-->
			<footer id="footer">
           <%@ include file="../foot.jsp"%>
			</footer>
					<!--social widgets-->
	    <%@ include file="../right.jsp"%>
	</body>
</html>