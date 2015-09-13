// JavaScript Document
$(function() {
	$('#save').linkbutton({
		iconCls : 'icon-save'

	});
	$('#edit').linkbutton({
		iconCls : 'icon-edit'

	});
	$('input:text').attr("readonly", "readonly");

	// 点击保存事件
	$('#save').bind('click', function() {

		$('input:text').attr("readonly", "readonly");

		// 提交学生信息
		$('#infos_fm').form('submit', {
			url : adminPath + 'base/studentInfo1_editStudentInfos.gdou',
			onSubmit : function() {
				return $(this).form('validate');
			},
			success : function(result) {
				var result = eval('(' + result + ')');
				if (result.errorMsg) {
					$.messager.show({
						title : '错误信息',
						msg : result.errorMsg
					});
				} else {
					$.messager.show({
						title : '提示',
						msg : result.success
					});
				}
			}
		});

	});
	// 点击修改事件
	$('#edit').bind('click', function() {

		$('input:text').removeAttr("readonly");
		$('input:text').css('border','none');

	});

});

function showPicture() {

	document.getElementById("imgShow").src = getFullPath(this);

	alert(document.getElementById("imgShow").src);
}

function getFullPath(obj) {
	if (obj) {
		// ie
		if (window.navigator.userAgent.indexOf("MSIE") >= 1) {
			obj.select();
			return document.selection.createRange().text;
		}
		// firefox
		else if (window.navigator.userAgent.indexOf("Firefox") >= 1) {
			if (obj.files) {
				return obj.files.item(0).getAsDataURL();
			}
			return obj.value;
		}
		return obj.value;
	}
}