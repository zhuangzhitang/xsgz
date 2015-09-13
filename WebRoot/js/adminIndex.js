function editPassword(){
	$('#dlg_editPwd').dialog('open').dialog('setTitle','修改密码');
    $('#editForm').form('clear');
}
function saveChangedPwd(){
    $('#editForm').form('submit',{
        url: adminPath + "system/admin_updateOwnerPassword.gdou",
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
                $('#dlg_editPwd').dialog('close');   
                $.messager.show({
                    title: '提示',
                    msg: result.success
                });
            }
        }
    });
}