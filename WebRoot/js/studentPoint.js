$(document).ready(function () {
	 $('#schoolyear').combobox({
		  editable:false,
		  missingMessage:'请选择学年',
		  required:true,
         onSelect: function(data){   
        	 $('#dg_studentPoint').datagrid({ 
	    			url:adminPath+"base/studentInfo1_getStudentPoint.gdou?schoolyear=" +data.schoolYear+"&studentNum="+studentNum
				});  
			$('#dg_studentPoint').datagrid('reload'); 
			
		 }
               
	  });
	 
	 $('#editPoint_dlg').window({
			top:100
		});
});

function editPoint(){
	 var row = $('#dg_studentPoint').datagrid('getSelected');
	 if(row){
		 $('#editPoint_dlg').dialog('open').dialog('setTitle','修改操行分');
		 $('#editPoint_fm').form('load',row);// 将选中的行的数据加载到弹窗
	 }
	 
}

function savePoint(){
	$('#editPoint_fm').form('submit',{
		url:adminPath + 'base/studentInfo_updateStudentPoint.gdou',
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
	                $('#editPoint_dlg').dialog('close');
	                $('#dg_studentPoint').datagrid('reload');   
	                $.messager.show({
	                    title: '提示',
	                    msg: result.success
	                });
	           }
	        }
		
	});
}


