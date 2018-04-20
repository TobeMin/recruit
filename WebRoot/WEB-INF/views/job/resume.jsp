<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="../base.jsp"%>
<!doctype html>
<!--[if IE 9 ]><html class="ie9" lang="en"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html lang="en">
<!--<![endif]-->

<head>
<title>校园招聘</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<!--meta info-->
<meta name="author" content="">
<meta name="keywords" content="">
<meta name="description" content="">
<link type="text/css" rel="stylesheet"
	href="<%=path%>/css/validator.css"></link>
<script src="<%=path%>/js/formValidator-4.0.1.js" type="text/javascript"
	charset="UTF-8"></script>
<script src="<%=path%>/js/formValidatorRegex.js" type="text/javascript"
	charset="UTF-8"></script>
<link rel="stylesheet" type="text/css"
	href="<%=path%>/common/css/jcDate.css" media="all" />
<script src="<%=path%>/common/date/laydate.js"></script>

<script type="text/javascript" src="<%=path%>/common/js/format.js"></script>
<script src="<%=path%>/common/sweet/sweet-alert.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=path%>/common/sweet/sweet-alert.css">

<style type="text/css">
.dataTables_scroll {
	margin-bottom: 20px;
}

.xz input {
	margin-left: 20px;
	margin-top: 10px;
}

.detail {
	width: 580px;
	text-align: center;
	padding-left: 20px;
	border-bottom: 1px dashed #ebebeb;
	height: 60px;
	line-height: 60px;
	font-size: 14px;
}

.display_a a {
	font-size: 14px;
}

.dataTables_info {
	font-size: 14px;
	color: #666;
}

.paging_full_numbers {
	font-size: 14px;
	color: #666;
	margin-right: 10px;
}

table.display td {
	min-height: 24px;
	vertical-align: middle;
	height: 30px;
}
/* table.display .status{
	color:#3968AE;
} */
.detail-header {
	width: 100%;
	background-color: gray;
	height: 60px;
	line-height: 60px;
}
</style>
<style>
table {
	border-top: 1px #CCC solid;
	border-right: 1px #CCC solid;
	background: #fff;
}

table td {
	border-left: 1px #CCC solid;
	border-bottom: 1px #CCC solid;
	text-align: center;
	font-size: 12px;
	height: 40px;
}

.input_01 {
	width: 75%;
	height: 30px;
	font-size: 12px;
	border: 0;
}

.input_02 {
	width: 90%;
	height: 30px;
	font-size: 12px;
	border: 0;
}

.bk1 {
	border: 1px #e7cbca solid;
	background: #fdeee9;
}

input {
	background-color: none;
}
#detail_image {
	filter: progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=image);
}
.c1{
vertical-align: middle;
}
</style>
</head>

<script type="text/javascript" charset="utf-8">

$(document).ready(function() {
$.ajax({
	          url:"<%=path%>/job/goResumeInfo",
	          type:"get",
	          dataType:"json",
	          success:function(data){
	          		$.each(data,function(i,v){
	          			if(i=='image'){
							
	          				$("#detail_image").attr("src", v); 	          			
	          			}else{
	          				$("#detail_"+i).val(v);
	          			}
	          		});
	          	
	          },
	          error:function(){
	           	 	swal("简历信息异常!");
	          }
	   });
});

	

</script>

<script type="text/javascript">


                //图片上传预览    IE是用了滤镜。
        function previewImage(file)
        {
    
          var MAXWIDTH  = 140;
          var MAXHEIGHT = 160;
          if (file.files && file.files[0])
          {
              var img = document.getElementById('detail_image');
              img.onload = function(){
                var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
                img.width  =  rect.width;
                img.height =  rect.height;
//                 img.style.marginLeft = rect.left+'px';
                img.style.marginTop = rect.top+'px';
              }
              var reader = new FileReader();
              reader.onload = function(evt){img.src = evt.target.result;};
              reader.readAsDataURL(file.files[0]);
          }
          else //兼容IE
          {
            var sFilter='filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src="';
            file.select();
            var src = document.selection.createRange().text;
            div.innerHTML = '<img id=imghead>';
            var img = document.getElementById('imghead');
            img.filters.item('DXImageTransform.Microsoft.AlphaImageLoader').src = src;
            var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
            status =('rect:'+rect.top+','+rect.left+','+rect.width+','+rect.height);
            div.innerHTML = "<div id=divhead style='width:"+rect.width+"px;height:"+rect.height+"px;margin-top:"+rect.top+"px;"+sFilter+src+"\"'></div>";
          }
        
        }
        function clacImgZoomParam( maxWidth, maxHeight, width, height ){
            var param = {top:0, left:0, width:width, height:height};
            if( width>maxWidth || height>maxHeight )
            {
                rateWidth = width / maxWidth;
                rateHeight = height / maxHeight;
                
                if( rateWidth > rateHeight )
                {
                    param.width =  maxWidth;
                    param.height = Math.round(height / rateWidth);
                }else
                {
                    param.width = Math.round(width / rateHeight);
                    param.height = maxHeight;
                }
            }
            
            param.left = Math.round((maxWidth - param.width) / 2);
            param.top = Math.round((maxHeight - param.height) / 2);
            return param;
        }
        
      
        
    
</script>
</head>
<body>
	<!--wide layout-->
	<div class="wide_layout relative">
		
		<div class="boxed_layout relative w_xs_auto">
			
			<div class="page_content_offset">
				<div class="container">
					<h2 class="tt_uppercase color_dark m_bottom_25">简历</h2>
					<p class="m_bottom_10">
						<span class="scheme_color"></span>
					</p>
					<ul id="errorlist"></ul>
					<div class="subject">

						<div id="" class="" style="">
							<form id="dpform">
								<table width="100%" cellpadding="0" cellspacing="0" border="1"
									style="margin-top: 10px;">
									<input type="hidden"
										style="width: 95%; height: 35px; border: none;" name="empId"
										id="detail_empId">
									<tr>
										<td width="91"><font class="c1"><a
												style="color: red">*</a> 姓名：</font></td>
										<td width="237"><font class="c2"><input
												type="text" style="width: 95%; height: 35px; border: none;"
												name="realname" id="detail_realname" ></font></td>
										<td width="120"><font class="c1">性别：</font></td>
										<td width="289"><font class="c2"><input
												name="sex" style="width: 95%; height: 35px; border: none;"
												id="detail_sex" ></font></td>
										<td width="140" rowspan="4"><img id="detail_image"
											name="image" width="140px" height="160px" border=0
											onclick="change(); "
											src="${emp.image}" /> <input
											type="file" name="file" id="imageFile"
											style="display: none;" /></td>
									</tr>
									<tr>
										<td><font class="c1">学历：</font></td>
										<td><font class="c2"><input type="text"
												style="width: 95%; height: 35px; border: none;"
												name="degree" id="detail_degree" ></font></td>
										<td><font class="c1">是否结婚：</font></td>
										<td><font class="c2"><input name="marry"
												style="width: 95%; height: 35px; border: none;"
												id="detail_marry"></font></td>
									</tr>
									<tr>
										<td><font class="c1">国籍：</font></td>
										<td><font class="c2"><input type="text"
												name="country"
												style="width: 95%; height: 35px; border: none;"
												id="detail_country"></font></td>
										<td><font class="c1">是否在职：</font></td>
										<td><font class="c2"><input name="jobstatus"
												style="width: 95%; height: 35px; border: none;"
												id="detail_jobstatus"></font></td>
									</tr>
									<tr>
										<td><font class="c1">出生日期：</font></td>
										<td><font class="c2"><input class="laydate-icon"
												type="text" style="width: 85%; height: 35px; border: none;"
												name="birthday" id="detail_birthday"> <script>
													;
													!function() {
														laydate({
															elem : '#detail_birthday',
															format : 'YYYY-MM-DD',
															istime : false,
															istoday : true
														})
													}();
												</script> </font></td>
										<td><font class="c1">外语等级：</font></td>
										<td><font class="c2"><input type="text"
												style="width: 95%; height: 35px; border: none;"
												name="language" id="detail_language"></font></td>
									</tr>
									<tr>
										<td><font class="c1"><a style="color: red">*</a>
												应聘岗位：</font></td>
										<td><font class="c2"><input type="text"
												style="width: 95%; height: 35px; border: none;"
												name="resumeName" id="detail_resumeName"></font></td>
										<td><font class="c1">QQ号码：</font></td>
										<td id="check3"><font class="c2"><input
												type="text" style="width: 95%; height: 35px; border: none;"
												name="qq" id="detail_qq" onblur="checkData(this.value)"></font></td>

									</tr>
									<tr>
										<td><font class="c1">邮箱地址：</font></td>
										<td id="check1"><font class="c2"><input
												type="text" style="width: 95%; height: 35px; border: none;"
												name="email" id="detail_email"></font></td>
										<td><font class="c1 ">电话号码：</font></td>
										<td id="check2" colspan="2"><font class="c2"><input
												type="text" style="width: 95%; height: 35px; border: none;"
												name="tel" id="detail_tel" onblur="isMobile(this.value)"></font></td>
									</tr>
									<tr>
										<td><font class="c1">户籍：</font></td>
										<td><font class="c2"><input type="text"
												style="padding-left: 2%; width: 95%; height: 35px; border: none;"
												name="hj" id="detail_hj"></font></td>
										<td><font class="c1">暂住地：</font></td>
										<td colspan="2"><font class="c2"><input
												type="text"
												style="padding-left: 2%; width: 95%; height: 35px; border: none;"
												name="address" id="detail_address"></font></td>
									</tr>
								</table>


								<table width="100%" cellpadding="0" cellspacing="0"
									align="center">
									<tr>
										<td width="171"><font class="c1">自我评价：</font></td>
										<td width="568"><font class="c2"><input
												type="text"
												style="padding-left: 2%; width: 95%; height: 35px; border: none;"
												name="description" id="detail_description"></font></td>
									</tr>
									<tr>
										<td><font class="c1">得奖情况：</font></td>
										<td><font class="c2"><input type="text"
												style="padding-left: 2%; width: 95%; height: 35px; border: none;"
												name="study" id="detail_study"></font></td>
									</tr>
									<tr>
										<td><font class="c1">期望工作类型：</font></td>
										<td><font class="c2"><input type="text"
												style="padding-left: 2%; width: 95%; height: 35px; border: none;"
												name="jobtype" id="detail_jobtype"></font></td>
									</tr>
									<tr>
										<td><font class="c1">期望工作地点：</font></td>
										<td><font class="c2"><input type="text"
												style="padding-left: 2%; width: 95%; height: 38px; border: none;"
												name="waddress" id="detail_waddress"></font></td>
									</tr>
									<tr>
										<td><font class="c1"><a style="color: red">*</a>
												期望薪资：</font></td>
										<td><font class="c2"><input type="text"
												style="padding-left: 2%; width: 95%; height: 38px; border: none;"
												name="salary" id="detail_salary"></font></td>
									</tr>
									<tr>
										<td><font class="c1">工作经历：</font></td>
										<td><font class="c2"><textarea
													style="padding-left: 2%; width: 95%; height: 50px; border: none;"
													rows="300" cols="50" name="work" id="detail_work"></textarea></font></td>
										<!--  <td ><font class="c2"><input type="text" style="padding-left:2%; width:95%;height:38px;border: none; " name="work" id="detail_work"></font></td>
            	-->
									</tr>
									<tr>
										<td><font class="c1">家庭成员：</font></td>
										<td><font class="c2"><input type="text"
												style="padding-left: 2%; width: 95%; height: 38px; border: none;"
												name="family" id="detail_family"></font></td>
									</tr>
									<tr>
										<td><font class="c1">项目经验：</font></td>
										<td><font class="c2"><textarea
													style="padding-left: 2%; width: 95%; height: 100px; border: none;"
													rows="300" cols="50" name="experience"
													id="detail_experience"></textarea></font></td>
										<!-- <td><font class="c2"><input type="text" style="padding-left:2%; width:95%;height:38px;border: none; "  name="experience" id="detail_experience"></font></td>
            	 -->
									</tr>
								</table>
							</form>
							<!-- <div class="details-footer">
								<input value="保存" type="button"
									style="width: 60px; margin-right: 20px; height: 30px; line-height: 30px; background: #fff; border: 1px #999 solid;"
									onclick="saveEmp();"> <input value="返回" type="button"
									style="width: 60px; height: 30px; line-height: 30px; background: #fff; border: 1px #999 solid;"
									onclick="javascript:window.history.go(-1);">
							</div> -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>	
</body>
</html>