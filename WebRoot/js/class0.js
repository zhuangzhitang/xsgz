$(document).ready(function () {
	// 绑定cbx_major的change事件
	$('#cbx_major').combobox({
		onSelect: function(record){  
		    	var majorId = record.majorId;
		    	$('#dg_class').datagrid({ 
	    			url:adminPath+"base/class_getClasssByMajorId.gdou?majorId=" + majorId
				});  
				$('#dg_class').datagrid('reload'); 
		}
	});
});


function addClass(){
	$('#addclass_dlg').dialog('open').dialog('setTitle','添加班级');
	 $('#addclass_dlg').form('clear');
}

function saveClass(){
	$('#addclass_fm').form('submit',{
		url:adminPath + 'base/class_role0AddClass.gdou',
		onSubmit:function(){
			return $(this).form('validate');
		},
		success:function(result){
			  var result = eval('('+result+')');
		      if (result.errorMsg){
		    	  if(result.errorMsg=="1"){
		    		  alert("班级已经存在,不需要再创建");
		    	  }else{
		    		  $.messager.show({
		                    title: '错误信息',
		                    msg: result.errorMsg
		    		  });
		    	  }
	               /*
	               */
	           } else {
	                $('#addclass_dlg').dialog('close');
	                $('#dg_class').datagrid('reload');   
	                $.messager.show({
	                    title: '提示',
	                    msg: result.success
	                });
	            }
	        }
	});
}

function editClass(){
	 var row = $('#dg_class').datagrid('getSelected');
	 if(row){
		 $('#editclass_dlg').dialog('open').dialog('setTitle','编辑班级');
		 $('#editclass_fm').form('load',row);// 将选中的行的数据加载到弹窗
	 }
}

function saveClass1(){
	$('#editclass_fm').form('submit',{
		url:adminPath + 'base/class_role0EditClass.gdou',
		onSubmit:function(){
			return $(this).form('validate');
		},
		success:function(result){
			  var result = eval('('+result+')');
		      if (result.errorMsg){
		    	  if(result.errorMsg=="1"){
		    		  alert("班级已经存在,不需要再创建");
		    	  }else{
		    		  $.messager.show({
		                    title: '错误信息',
		                    msg: result.errorMsg
		    		  });
		    	  }
	           } else {
	                $('#editclass_dlg').dialog('close');
	                $('#dg_class').datagrid('reload');   
	                $.messager.show({
	                    title: '提示',
	                    msg: result.success
	                });
	           }
	        }
		
	});
}

function destroyClass(){
	 var row = $('#dg_class').datagrid('getSelected');
	 if (row){
	        $.messager.confirm('警告','确定删除该班级的信息吗?',function(r){
	            if (r){
	            	var url = adminPath + "base/class_role0DestoryClass.gdou";
	                $.post(url, {classId:row.classId}, function(result) {
	                 
	      		      if (result.errorMsg){
	      	                $.messager.show({
	      	                    title: '错误信息',
	      	                    msg: result.errorMsg
	      	                });
	      	           } else {
	      	                $('#dg_class').datagrid('reload');   
	      	                $.messager.show({
	      	                    title: '提示',
	      	                    msg: result.success
	      	                });
	      	           }
	                },'json');
	            }
	        });
	    }
}
