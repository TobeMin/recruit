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
		<script type="text/javascript">
var $obj;  
$(function() { 
  var param=$('#param').val();
  var resumeurl='<%=path%>/job/findResumeList';
  if(param==""||(typeof(param) == undefined) ) {

  }else{
	resumeurl+="?resumeName="+param;
  	alert(resumeurl);
  	console(resumeurl);
  }
    $obj = $("#tt");  
    $obj.datagrid({  
        loadMsg : '数据加载中请稍后……',  
        url : resumeurl,  
        //url : root + 'js/app/sysManagement/sysConfig.json',  
        fitColumns : true,  //设置为true将自动使列适应表格宽度以防止出现水平滚动。
        autoRowHeight : true,  //定义设置行的高度，根据该行的内容。设置为false可以提高负载性能。
        pagination : true,  //设置true将在数据表格底部显示分页工具栏。
        pagePosition : 'bottom',  //定义的分页栏的位置。可用的值有 'top','bottom','both'。
        pageSize : 10,  //当设置分页属性时，初始化每页记录数。
        toolbar: '#tb',  //数据表格顶部面板的工具栏。可能的值：1）数组，每个工具选项和链接按钮相同。2）选择显示的工具栏。
        pageList : [ 10, 20, 30 ],  //当设置分页属性时，初始化每页记录数列表。
        //border : false,  
        singleSelect:true,  //设置为true将只允许选择一行。
        idField:'jobId',	//表明该列是一个唯一列。
        iconCls: 'icon-edit',	//?
		//pagination:true,
		collapsible:true,	//?
		rownumbers:true,	//	设置为true将显示行数。
		remoteSort : false,	//定义是否通过远程服务器对数据排序。
        striped: true, //行背景交换
        nowrap: true, //设置为true，当数据长度超出列宽时将会自动截取。
        border: false,  
        columns : [ [ {  
                field : 'resumeId',  
                title : 'resumeId',  
                hidden : true  
            },{  
                field : 'empId',  
                title : 'empId',  
                hidden : true  
            },{  
                field : 'resumeName',  //列标题
                title : "应聘岗位",   //列字段
                width : 200,  
                editor : 'text',   //表明编辑类型
                sortable : true    //设置为true允许对该列排序。
            },{  
                field : 'realName',  //列标题
                title : "应聘者",   //列字段
                width : 200,  
                editor : 'text',   //表明编辑类型
                sortable : true    //设置为true允许对该列排序。
            }, {  
                field : 'opt',  
                title : "详情",  
                width : 150,  
                align : 'center',  
                formatter:function(value,row,index){  
                 var s = '<a href="<%=path%>/job/goResume?empId='+row.empId+'&resumeId='+row.resumeId+'" class="ope-save" >查看详情</a> ';      
             		return s;        
                }  
        	}, {  
                field : 'look',  
                title : "状态",  
                width : 150,  
                align : 'center',  
                formatter:function(value,row,index){ //value:字段值，row：行数据，index：行索引
                	if(row.look==0){
                		console.log(value+","+row+","+index);
                		return "未查阅";
                	}else{
                		console.log(value+","+row+","+index);
                		return "已查阅";
                	}
                },
        		styler:function(value,row,index){
        			if(row.look==0){
        				return "color:red";
        			}
        		}
                
        	} ] ],  
        onLoadSuccess : function(data) {  //当数据载入成功时触发
  
        },  
        onBeforeEdit:function(index,row){  
            row.editing = true;  
            $obj.datagrid('refreshRow', index);  
        },  
        onAfterEdit:function(index,row){  
            row.editing = false;  
            $obj.datagrid('refreshRow', index);  
        },  
        onCancelEdit:function(index,row){  
            row.editing = false;  
            $obj.datagrid('refreshRow', index);  
        }  
    });  
  
});  
  
    function selectCurRow(obj){  
        var $a = $(obj);  
        var $tr = $a.parent().parent().parent();  
        var tmpId = $tr.find("td:eq(0)").text();  
        $obj.datagrid('selectRecord', tmpId);  
    }  
      
    function getIndexAfterDel(){  
        var selected = $obj.datagrid('getSelected');  
        var index = $obj.datagrid('getRowIndex', selected);  
        return index;  
    }  
    function findrow(index,obj){  
             selectCurRow(obj);  
    } 
    function editrow(index,obj){  
        selectCurRow(obj);  
          
        var tmpIndex = getIndexAfterDel();    
        $obj.datagrid('beginEdit', tmpIndex);  
    }  
      
    function deleterow(index,obj){  
        $.messager.confirm('Confirm','确认删除?',function(r){  
            if (r){               
                selectCurRow(obj);  
                var index = getIndexAfterDel();  
                var node = $obj.datagrid('getSelected');  
                var id = node.id;   
                $.ajax({  
                    url : root + 'esbService/removeSysConfig.do?id='+id,  
                    type : 'GET',                     
                    timeout : 60000,  
                    success : function(data, textStatus, jqXHR) {     
                        var msg = '删除';  
                        if(data == 'pageData') {  
                            $obj.datagrid('deleteRow', index);  
                            return;  
                        }else if (data == "success") {  
                            $obj.datagrid('deleteRow', index);  
                            //$obj.datagrid('reload');  
                            $.messager.alert('提示', msg + '成功！', 'info', function() {  
                                //window.location.href = root + 'esbService/initSysConfig.do';  
                            });  
                        } else {  
                            $.messager.alert('提示', msg + '失败！', 'error', function() {  
                                //window.location.href = root + 'esbService/initSysConfig.do';  
                            });  
                        }  
                    }  
                });   
                  
            }  
        });  
    }  
    function saverow(index,obj){  
        selectCurRow(obj);  
        var tmpIndex = getIndexAfterDel();    
        $obj.datagrid('endEdit', tmpIndex);  
        var node = $obj.datagrid('getSelected');  
        //var data = JSON.stringify(node);  
        var json = {};  
        json.jobId = node.jobId;  
        json.jobName = node.jobName;  
        json.jobPersoncount = node.jobPersoncount;  
        json.salary   = node.salary;  
        json.jobStatus  = node.jobStatus;
          json.degree = node.degree;  
        json.address = node.address;  
        json.description = node.description;  
        json.language   = node.language;  
        json.startDate   = node.startDate;  
        json.endDate  = node.endDate;    
        $.ajax({  
            url : '<%=path%>/job/editOrSaveComJob',  
            type : 'POST',  
            data : json,  
            timeout : 60000,  
            success : function(data, textStatus, jqXHR) {     
                var msg = '';  
                if (data == 1) {  
                    $.messager.alert('提示', '保存成功！', 'info', function() {  
                        $obj.datagrid('refreshRow', tmpIndex);  
                    });  
                } else{  
                      msg = "保存失败！";  
                    $.messager.alert('提示', msg , 'error', function() {  
                        $obj.datagrid('beginEdit', tmpIndex);  
                    });  
                }                     
  
            }  
        });  
          
    }  
    function cancelrow(index,obj){  
        selectCurRow(obj);  
        var tmpIndex = getIndexAfterDel();    
        $obj.datagrid('cancelEdit', tmpIndex);  
    }  
      
    function appendRow(){  
        $obj.datagrid('appendRow',{  
            id: new Date().getTime(),  
            configName: '',  
            configNameCn: "",  
            configType: "",  
            configValue:"",  
            opt:""  
        });  
          
        var length = $obj.datagrid("getRows").length;  
        if(length > 0){  
            editIndex = length - 1;  
        }else{  
            editIndex = 0;  
        }         
        //$obj.datagrid("selectRow", editIndex);  
        $obj.datagrid("beginEdit", editIndex);  
    }  
      
		</script>
	</head>
	<body>
		<!--boxed layout-->
		<div class="boxed_layout relative w_xs_auto">
			<!--[if (lt IE 9) | IE 9]>
				<div style="background:#fff;padding:8px 0 10px;">
				<div class="container" style="width:1170px;"><div class="row wrapper"><div class="clearfix" style="padding:9px 0 0;float:left;width:83%;"><i class="fa fa-exclamation-triangle scheme_color f_left m_right_10" style="font-size:25px;color:#e74c3c;"></i><b style="color:#e74c3c;">Attention! This page may not display correctly.</b> <b>You are using an outdated version of Internet Explorer. For a faster, safer browsing experience.</b></div><div class="t_align_r" style="float:left;width:16%;"><a href="http://windows.microsoft.com/en-US/internet-explorer/products/ie/home?ocid=ie6_countdown_bannercode" class="button_type_4 r_corners bg_scheme_color color_light d_inline_b t_align_c" target="_blank" style="margin-bottom:2px;">Update Now!</a></div></div></div></div>
			<![endif]-->
			<!--markup header-->
			<header role="banner">
		
            <%@ include file="../head.jsp"%>

			</header>
		
			<!--content-->
		<!--content-->
			<div class="page_content_offset">
				<div class="container">
<!-- 			   <table id="jobManagerGrid"></table> -->

					<table id="tt" ></table>
					<input type="hidden" value="${param.param}" id="param" >	
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