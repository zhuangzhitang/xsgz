function test() {
	var selRows = $('#dg').datagrid('getSelected');
	var s2 = selRows.studentNum;
	if(s2.length !=0){
	window.location.href = adminPath
			+ "workstudy/admin_showStudent.gdou?studentnums=" + s2 + "&type="+type;

	}else
		alert("请选择");
}
$(document).ready(function () {
	// 绑定cbx_academy的change事件
	$('#cc').combobox({
		 editable:false,
		missingMessage:'请选择',
		 required:true,
		valueField:'classId',
		textField:'className',
		url:'admin_queryClasses.gdou',
		onSelect: function(record){  
			var id = record.classId;
			if(id!=null){
    		$('#dg').datagrid({ 
    	    	url: adminPath + "workstudy/admin_getApplyStudents.gdou?classId=" + id+"&type="+type
    				});  
    				$('#dg').datagrid('reload');   
    			}
		}
	});
	
});

function getSelections() {
	var ids = [];
	var s;
	var rows = $('#dg').datagrid('getSelections');
	if(rows.length!=0){
	for ( var i = 0; i < rows.length; i++) {
		ids.push(rows[i].studentNum);
		}
	s = ids.join("-");
	window.location.href = adminPath+"workstudy/todo_allotManyMoney.gdou?studentnums="+s+"&type="+type;
	}
	else
		alert("请选择");
}