var url;

function newAcademy(){
    $('#dlg').dialog('open').dialog('setTitle','新增学院');
    $('#fm').form('clear');
    url = adminPath + 'base/academy_add.gdou';
}

function editAcademy(){
    var row = $('#dg_academy').datagrid('getSelected');
    if (row){
        $('#dlg').dialog('open').dialog('setTitle','编辑学院');
        $('#fm').form('load',row);// 将选中的行的数据加载到弹窗
    }
    url = adminPath + 'base/academy_update.gdou'; 
}

function saveAcademy(){
    $('#fm').form('submit',{
        url: url,
        onSubmit: function(){
            return $(this).form('validate');
        },
        success: function(result){
            var result = eval('('+result+')');
            if (result.errorMsg){
            	 if(result.errorMsg=="1"){
		    		  alert("学院已经存在,不需要再创建");
		    	  }else{
		    		  $.messager.show({
		                    title: '错误信息',
		                    msg: result.errorMsg
		    		  });
		    	  }
            } else {
                $('#dlg').dialog('close');        // close the dialog
                $('#dg_academy').datagrid('reload');    // reload the user data
            }
        }
    });
}

function destroyAcademy(){
    var row = $('#dg_academy').datagrid('getSelected');
    if (row){
        $.messager.confirm('警告','确定删除该学院的信息吗?',function(r){
            if (r){
            	var url = adminPath + "base/academy_delete.gdou";
                $.post(url, {academyId:row.academyId}, function(result) {
                			
                    if (result.success){
                        $('#dg_academy').datagrid('reload');    // reload the data
                    } else {
                        $.messager.show({    // show error message
                            title: '哦哦，出错了~~',
                            msg: result.errorMsg
                        });
                    }
                },'json');
            }
        });
    }
}