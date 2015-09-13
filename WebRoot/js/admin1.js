function addAdmin(){
    $('#add_dlg').dialog('open').dialog('setTitle','添加管理员');
    $('#add_fm').form('clear');
}

function changePassword(){
    var row = $('#dg_role2').datagrid('getSelected');
    if (row){
        $('#cp_dlg').dialog('open').dialog('setTitle','修改密码');
        $('#cp_fm').form('load',row);// 将选中的行的数据加载到弹窗
    }
}

function saveNewAdmin(){
    $('#add_fm').form('submit',{
        url: adminPath + 'system/admin_role1AddMajorAdmin.gdou',
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
                $('#add_dlg').dialog('close');   
                $('#dg_role2').datagrid('reload');   
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
    	url: adminPath + 'system/admin_role1ChangeRole2Pwd.gdou',
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
    var row = $('#dg_role2').datagrid('getSelected');
    if (row){
        $.messager.confirm('警告！','确定删除该管理员吗?',function(r){
            if (r){
            	var url = adminPath + "system/admin_role1DeleteMajorAdmin.gdou";
                $.post(url,{adminId:row.adminId}, function(result) {
                	
                    if (result.success){
                        $('#dg_role2').datagrid('reload');   
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