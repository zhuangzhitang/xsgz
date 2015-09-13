// JavaScript Document
$(function(){
		$('#add_in').linkbutton({    
    				iconCls: 'icon-redo'   
			});
		    
		 $('#add_out').linkbutton({    
    				iconCls: 'icon-remove'   
			});
		  $('#info_sure').linkbutton({    
    				iconCls: 'icon-search'   
			});
		 
		  $('.info_s').combobox({    
    
			});
		  
		  //点击搜索事件
		  $('#ss').searchbox({ 
			searcher:function(value,name){
				var value =encodeURI(encodeURI(value));
				$('#dg_studentInfo').datagrid({ 
	    			url:adminPath+"base/studentInfo_queryStudentInfo.gdou?value=" + value
				});  
				$('#dg_studentInfo').datagrid('reload'); 
				}
			});

		  //点击确定按钮事件
		  $('#sure').bind('click', function(){    
        		$("#main_table").css("display","block");
				$("#table").datagrid({
					rownumbers:true,	   
					columns:[[ 
					{field:"ck",checkbox:true},
        			{field:'code',title:'学号',width:300, align:'center'},    
        			{field:'name',title:'姓名',width:300, align:'center'},    
        			{field:'price',title:'班级',width:700,align:'center'}    
    				]]    			   
			});
		}); 
		  
		  //表格双击事件
		   $('#dg_studentInfo').datagrid({
			   onDblClickRow: function(rowIndex,rowData){
				
				parent.window.$('#tabs').tabs('add', {
	    			title:' '+ rowData.studentName+'  ',
	    			content: createFrame(rowData.studentNum),
	    			closable: true,
	    			width: 1000,
	    			height: 1200
	    		});
			
			}
		});
		   
	   function createFrame(studentNum) {
		  
	    	var s = '<iframe name="mainFrame" scrolling="yes" frameborder="0"  src="' + adminPath+'base/studentInfo_forwardShowStudentpage.gdou?studentNum=' +studentNum + '"  style="width:100%;height:100%;"></iframe>';
	    	return s;
	    }
});

function exportData(){
	$('#exportData_dlg').dialog('open').dialog('setTitle','导出信息');
	 $('#exportData_fm').form('clear');
}

function sureToexportData(){
	$('#exportData_dlg').dialog('close');
	$('#exportData_fm').form('submit',{
		url:adminPath + 'base/studentInfo_exportData.gdou',
		onSubmit:function(){
			return $(this).form('validate');
		}
	});
}
function upload(){
	$('#myform').form('submit',{
		url:adminPath + 'base/studentInfo_uploadFile.gdou',
		onSubmit:function(){
			return $(this).form('validate');
		},
		success:function(result){
			  var result = eval('('+result+')');
		      if (result.errorMsg){
	              $.messager.show({
	                  title: '错误信息',
	                  msg: result.errorMsg
	              });
	         } else {
	              $.messager.show({
	                  title: '提示信息',
	                  msg: result.success
	              });
	          }
	      }
	});
}

$(document).ready(function () {
	// 绑定cbx_class的change事件
	$('#cbx_class').combobox({
		onSelect: function(record){  
		    	var className =encodeURI(encodeURI(record.className));
		    	
				if(className!=null && className!=""){
					$('#dg_studentInfo').datagrid({ 
    	    			url:adminPath+"base/studentInfo_getStudentInfoByClassName.gdou?className=" + className
    				});  
    				$('#dg_studentInfo').datagrid('reload');   
    			}
		}
	});
});

