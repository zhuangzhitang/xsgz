// JavaScript Document
$(function(){
		$('#number_out').linkbutton({    
    				iconCls: 'icon-remove'   
			}); 
		$('#add_in').linkbutton({    
    				iconCls: 'icon-redo'   
			});
		    
		 $('#add_out').linkbutton({    
    				iconCls: 'icon-remove'   
			});
		  $('#info_sure').linkbutton({    
    				iconCls: 'icon-search'   
			});
		  $('#btn').linkbutton({    
	    		iconCls: 'icon-save'   
		  });  
		 
    	 
    	 
		  $('#academy').combobox({    
				 editable:false,
				 missingMessage:'请选择学院',
				 required:true,
	             valueField: 'academyId', 
	             textField:  'academyName',
	             url:adminPath+'conductpoints/conduct_getAcademy.gdou',
				 onSelect: function(rec){   
		            var url = 'conductpoints/conduct_getMajor.gdou?academyId='+rec.academyId;  
		            $('#major').combobox('clear');    
		            $('#major').combobox('reload', url);   
				 }
			 });
			 
			 $('#major').combobox({    
				 editable:false,
				 missingMessage:'请选择专业',
				 required:true,
	             valueField: 'majorId', 
	             textField:  'majorName',   
				 onSelect: function(rec){   
		            var url = 'conductpoints/conduct_getClassWithMajor.gdou?majorId='+rec.majorId;  
		            $('#cla').combobox('clear');    
		            $('#cla').combobox('reload', url);   
				 }
			 });
			 
			 $('#cla').combobox({
				 editable:false,
				 missingMessage:'请选择班级',
				 required:true,
	             valueField: 'classId', 
	             textField:  'className',
	             onSelect: function(rec){   
			            var url = 'conductpoints/conduct_getSchooltyear.gdou';  
			            $('#schoolyear').combobox('clear');    
			            $('#schoolyear').combobox('reload', url);   
			    }
			 });
			 
			 $('#schoolyear').combobox({
				 editable:false,
				 missingMessage:'请选择学年', 
				 required:true,
				 valueField:'schoolYear',
				 textField:'schoolYear',
			     onSelect: function(rec){ 
			    	 $('#form1').form('submit',{
			    			url: adminPath+'scholarships/scholarships_showjiangxuejingByClass.gdou',
			    			onSubmit:function(){
			    				return $(this).form('validate');
			    			},
			    			success:function(result){
			    				var result=eval('('+result+')');
			    				if(result=='1'){
			    					 $('#dg_academy').datagrid('loadData', { total: 0, rows: [] });  
			    					 $.messager.alert("提示信息","对不起，该班级或者相邻的班级没有导入相应学年的成绩，无法获取统计结果","info");
			    				}else{
			    					 $('#dg_academy').datagrid({  
			    			    	     data:result,
			    		                 title:'班级奖学金以及挂科情况表',
			    		                 pagination:true,
			    		                 rownumbers:true,
			    		                 fitColumns:true,
			    		                 singleSelect:false,
			    		                 pageList:[40],
			    		                 columns:[[       
			    					      {field:'studentNum',title:'学号',width:20},  
			    					      {field:'studentName',title:'学生姓名',width:20},
			    					      {field:'schoolYear',title:'学年',width:20},
			    					      {field:'sumScore',title:'总评分数', width:18},
			    					      {field:'filedClassCount',title:'挂科数目', width:15},
			    					      {field:'failedClassCredit',title:'挂科学分', width:15},
			    					      {field:'levelString',title:'奖学金等级', width:15}   
			    					    ]]  
			    					 }); 
			    				}
			    				 
			    			}
			    		});
			    	
			     }
			 });
		
			 $('#dg_academy').datagrid({  
                 title:'班级奖学金以及挂科情况表',
                 pagination:true,
                 rownumbers:true,
                 fitColumns:true,
                 singleSelect:false,
                 pageList:[40],
                 columns:[[       
			      {field:'studentNum',title:'学号',width:20},  
			      {field:'studentName',title:'学生姓名',width:20},
			      {field:'schoolYear',title:'学年',width:20},
			      {field:'sumScore',title:'总评分数', width:18},
			      {field:'filedClassCount',title:'挂科数目', width:15},
			      {field:'failedClassCredit',title:'挂科学分', width:15},
			      {field:'levelString',title:'奖学金等级', width:15}   
			    ]]  
			 }); 
			 
			 $('#academy0').combobox({    
				 editable:false,
				 missingMessage:'请选择学院',
				 required:true,
	             valueField: 'academyId', 
	             textField:  'academyName',
	             url:adminPath+'conductpoints/conduct_getAcademy.gdou',
				 onSelect: function(rec){   
		            var url = 'conductpoints/conduct_getMajor.gdou?academyId='+rec.academyId;  
		            $('#major0').combobox('clear');    
		            $('#major0').combobox('reload', url);   
				 }
			 });
			 
			 $('#major0').combobox({    
				 editable:false,
				 missingMessage:'请选择专业',
				 required:true,
	             valueField: 'majorId', 
	             textField:  'majorName',   
	             onSelect: function(rec){   
			            var url = 'conductpoints/conduct_getSchooltyear.gdou';  
			            $('#year0').combobox('clear');    
			            $('#year0').combobox('reload', url);   
			    }
			 });
			 
			 $('#year0').combobox({
				 editable:false,
				 missingMessage:'请选择学年', 
				 required:true,
				 valueField:'schoolYear',
				 textField:'schoolYear'
			 });
			 
});

function openDialog(){
	  $('#add1_dlg').dialog('open').dialog('setTitle','重新评定奖学金获得者');
}

function shuaxin(){
	$('#add1_fm').form('submit',{
		url: adminPath+'scholarships/scholarships_refresh.gdou',
		onSubmit:function(){
			return $(this).form('validate');
		},
		success:function(result){
			$('#add1_dlg').dialog('close');
			var result=eval('('+result+')');
		    $.messager.alert("提示信息",result.message,"info");
		}
	});
}
