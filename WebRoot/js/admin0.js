$(document).ready(function () {
	// 绑定cbx_academy的change事件
	$('#cbx_academy').combobox({
		onSelect: function(record){  
			var unit = $("input[name='unit']:checked").val();
			
			if(unit == "major"){
				var academyId = record.academyId;
				if(academyId!=null && academyId!=""){
    				$('#adminDatagrid').datagrid({ 
    	    			url: adminPath + "system/admin_getMajorAdmins.gdou?academyId=" + academyId
    				});  
    				$('#adminDatagrid').datagrid('reload');   
    			}
			}
		
		}
	});
	
	// 绑定unit的click事件
	$("input[name='unit']").bind("click",function(){ 
		var unit = $(this).val();
		if(unit == 'academy'){
			$('#adminDatagrid').datagrid({ 
    			url: adminPath + "system/admin_getAcademyAdmins.gdou"
			});  
			$('#adminDatagrid').datagrid('reload');   
		}else{
			var academyId = $('#cbx_academy').combobox('getValue');
			if(academyId!=null && academyId!=""){
				$('#adminDatagrid').datagrid({ 
					url: adminPath + "system/admin_getMajorAdmins.gdou?academyId=" + academyId
				});  
				$('#adminDatagrid').datagrid('reload');   
			}
			
		}
	});  
});

function addAcademyAdmin(){
    $('#add0_dlg').dialog('open').dialog('setTitle','添加【院级】管理员');
    $('#add0_fm').form('clear');
}

function addMajorAdmin(){
    $('#add1_dlg').dialog('open').dialog('setTitle','添加【专业级】管理员');
    $('#add1_fm').form('clear');
}

function changePassword(){
    var row = $('#adminDatagrid').datagrid('getSelected');
    if (row){
        $('#cp_dlg').dialog('open').dialog('setTitle','修改密码');
        $('#cp_fm').form('clear');
        $('#cp_fm').form('load',row);// 将选中的行的数据加载到弹窗
    }
}

function saveAcademyAdmin(){
    $('#add0_fm').form('submit',{
    	url: adminPath + 'system/admin_addAdmin.gdou?roleId=1',
        onSubmit: function(){
            return $(this).form('validate');
        },
        success: function(result){
            var result = eval('('+result+')');
            if (result.errorMsg){
                $.messager.show({
                    title: '错误信息',
                    msg: result.errorMsg
                });
            } else {
                $('#add0_dlg').dialog('close');   
                $('#adminDatagrid').datagrid('reload');   
                $.messager.show({
                    title: '提示',
                    msg: result.success
                });
            }
        }
    });
}

function saveMajorAdmin(){
    $('#add1_fm').form('submit',{
    	url: adminPath + 'system/admin_addAdmin.gdou?roleId=2',
        onSubmit: function(){
            return $(this).form('validate');
        },
        success: function(result){
            var result = eval('('+result+')');
            if (result.errorMsg){
                $.messager.show({
                    title: '错误信息',
                    msg: result.errorMsg
                });
            } else {
                $('#add1_dlg').dialog('close');   
                $('#adminDatagrid').datagrid('reload');   
                $.messager.show({
                    title: '提示',
                    msg: result.success
                });
            }
        }
    });
}

function saveChangedPwd(){
    $('#cp_fm').form('submit',{
    	url: adminPath + 'system/admin_changePassword.gdou',
        onSubmit: function(){
            return $(this).form('validate');
        },
        success: function(result){
            var result = eval('('+result+')');
            if (result.errorMsg){
                $.messager.show({
                    title: '错误信息',
                    msg: result.errorMsg
                });
            } else {
                $('#cp_dlg').dialog('close');    
                $.messager.show({
                    title: '提示',
                    msg: result.success
                });
            }
        }
    });
}

function deleteAdmin(){
    var row = $('#adminDatagrid').datagrid('getSelected');
    if (row){
        $.messager.confirm('警告！','确定删除该管理员吗?',function(r){
            if (r){
            	var url = adminPath + 'system/admin_deleteAdmin.gdou';
                $.post(url, {adminId:row.adminId}, function(result) {
                			
                    if (result.success){
                        $('#adminDatagrid').datagrid('reload');   
                        $.messager.show({
                            title: '恭喜~~',
                            msg: result.success
                        });
                    } else {
                        $.messager.show({ 
                            title: '出错了~~',
                            msg: result.errorMsg
                        });
                    }
                },'json');
            }
        });
    }
}