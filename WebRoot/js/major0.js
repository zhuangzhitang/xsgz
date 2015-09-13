$(document).ready(function () {
	// 绑定cbx_academy的change事件
	$('#cbx_academy').combobox({
		onSelect: function(record){  
		    	var academyId = record.academyId;
				if(academyId!=null && academyId!=""){
					$('#dg_major').datagrid({ 
    	    			url:adminPath+"base/major_getMajorsByAcademyId.gdou?academyId=" + academyId
    				});  
    				$('#dg_major').datagrid('reload');   
    			}
		}
	});
});

function addMajor(){
	$('#addmajor_dlg').dialog('open').dialog('setTitle','添加专业');
	 $('#addmajor_dlg').form('clear');
}

function saveMajor(){
	$('#addmajor_fm').form('submit',{
		url:adminPath + 'base/major_role0AddMajor.gdou',
		onSubmit:function(){
			return $(this).form('validate');
		},
		success:function(result){
			  var result = eval('('+result+')');
		      if (result.errorMsg){
		    	  if(result.errorMsg=="1"){
		    		  alert("专业已经存在,不需要再创建");
		    	  }else{
		    		  $.messager.show({
		                    title: '错误信息',
		                    msg: result.errorMsg
		    		  });
		    	  }
	           } else {
	                $('#addmajor_dlg').dialog('close');
	                $('#dg_major').datagrid('reload');   
	                $.messager.show({
	                    title: '提示',
	                    msg: result.success
	                });
	            }
	        }
		
	});
}

function editMajor(){
	 var row = $('#dg_major').datagrid('getSelected');
	 if(row){
		 $('#editmajor_dlg').dialog('open').dialog('setTitle','编辑专业');
		 $('#editmajor_fm').form('load',row);// 将选中的行的数据加载到弹窗
	 }
}
function saveMajor1(){
	$('#editmajor_fm').form('submit',{
		url:adminPath + 'base/major_role0EditMajor.gdou',
		onSubmit:function(){
			return $(this).form('validate');
		},
		success:function(result){
			  var result = eval('('+result+')');
		      if (result.errorMsg){
		    	  if(result.errorMsg=="1"){
		    		  alert("专业已经存在,不需要再创建");
		    	  }else{
		    		  $.messager.show({
		                    title: '错误信息',
		                    msg: result.errorMsg
		    		  });
		    	  }
	           } else {
	                $('#editmajor_dlg').dialog('close');
	                $('#dg_major').datagrid('reload');   
	                $.messager.show({
	                    title: '提示',
	                    msg: result.success
	                });
	           }
	        }
		
	});
}

function destroyMajor(){
	 var row = $('#dg_major').datagrid('getSelected');
	 if (row){
	        $.messager.confirm('警告','确定删除该专业的信息吗?',function(r){
	            if (r){
	            	var url = adminPath + "base/major_role0DestoryMajor.gdou";
	                $.post(url, {majorId:row.majorId}, function(result) {
	                 
	      		      if (result.errorMsg){
	      	                $.messager.show({
	      	                    title: '错误信息',
	      	                    msg: result.errorMsg
	      	                });
	      	           } else {
	      	                $('#dg_major').datagrid('reload');   
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