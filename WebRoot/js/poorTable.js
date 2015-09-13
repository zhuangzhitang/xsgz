// JavaScript Document
var url;
function getSelections(){
	var ids = [];
	var s;
	var rows = $('#table2').datagrid('getSelections');
	for(var i=0; i<rows.length; i++){
		ids.push(rows[i].studentNum);
	}
	s = ids.join("-");
	window.location.href = adminPath+"workstudy/admin_saveallot.gdou?studentnums="+s;
}
$(function() {
	
	//第一个按钮
	
	//第一个下拉列表事件
	$('#cc_1').combobox({
		editable:false,
		missingMessage:'请选择',
		required:true,
		valueField:'classId',
		textField:'className',
		url:'admin_queryClasses.gdou',
		onSelect: function(record){  
			var id = record.classId;
			if(id!=null){
				$('#table').datagrid({ 
		   	    	url: "admin_showpoorstudent.gdou?classId=" + id
		   				}); 
		   				$('#table').datagrid('reload');   
   			}
		}
	});
	//第二个
	$('#cc_2').combobox({
		editable:false,
		missingMessage:'请选择',
		required:true,
		valueField:'classId',
		textField:'className',
		url:'admin_queryClasses.gdou',
		onSelect: function(record){  
			var id = record.classId;
			if(id!=null){
				$('#table2').datagrid({ 
		   	    	url: "admin_allotStudent.gdou?classId=" + id
		   				}); 
		   				$('#table2').datagrid('reload');   
   			}
		}
	});
	
	//第三个
	$('#cc_3').combobox({
		editable:false,
		missingMessage:'请选择',
		required:true,
		valueField:'classId',
		textField:'className',
		url:'admin_queryClasses.gdou',
		onSelect: function(record){  
			var id = record.classId;
			if(id!=null){
				$('#table3').datagrid({ 
		   	    	url: "admin_showResult.gdou?classId=" + id
		   				}); 
		   				$('#table3').datagrid('reload');   
   			}
		}
	});
	
	
	$("#search_student").bind("click", function() {
		$("#applytable").show();
		$("#allottable").hide();
		$("#result").hide();
		$("#s_button").hide();
		$("#list_1").show();
		$("#list_2").hide();
		$("#list_3").hide();
		$("#table").datagrid({
			width:1150,
			height:300,
			url:'admin_showpoorstudent.gdou',
			rownumbers : true,
			columns : [ [ {
				field : 'studentNum',
				title : '学号',
				width : 150,
				align : 'center'
			}, {
				field : 'studentName',
				title : '姓名',
				width : 100,
				align : 'center'
			}, {
				field : 'className',
				title : '班级',
				width : 150,
				align : 'center'
			}, {
				field : 'familySize',
				title : '家庭人口',
				width : 150,
				align : 'center'
			}, {
				field : 'monthlyIncome',
				title : '人均收入',
				width : 150,
				align : 'center'
			}, {
				field : 'comment',
				title : '备注',
				width : 200,
				align : 'center'
			}, 
			] ]
		});
	});
	
	//第三个按钮
	$("#search_result").bind("click", function() {
		$("#allottable").hide();
		$("#applytable").hide();
		$("#result").show();
		$("#s_button").hide();
		$("#list_1").hide();
		$("#list_2").hide();
		$("#list_3").show();
		$("#table3").datagrid({
			width:1150,
			height:300,
			url:'admin_showResult.gdou',
			rownumbers : true,
			columns : [ [ {
				field : 'studentNum',
				title : '学号',
				width : 150,
				align : 'center'
			}, {
				field : 'studentName',
				title : '姓名',
				width : 100,
				align : 'center'
			}, {
				field : 'className',
				title : '班级',
				width : 150,
				align : 'center'
			}, {
				field : 'level',
				title : '贫困等级',
				width : 100,
				align : 'center'
			},
			] ]
			});

	});
	//第二个按钮
	$("#search_allot").bind("click", function() {  
		$("#allottable").show();
		$("#applytable").hide();
		$("#result").hide();
		$("#s_button").show();
		$("#list_1").hide();
		$("#list_2").show();
		$("#list_3").hide();
		$("#table2").datagrid({
			width:1150,
			height:300,
			url:'admin_allotStudent.gdou',
			rownumbers : true,
			columns : [ [ {
				field : 'ck',
				checkbox : true
			}, {
				field : 'studentName',
				title : '姓名',
				width : 300,
				align : 'center'
			}, {
				field : 'studentNum',
				title : '学号',
				width : 300,
				align : 'center'
			}, {
				field : 'className',
				title : '班级',
				width : 500,
				align : 'center'
			},
			] ]
		});
		
		$("#search_student_button").linkbutton({
			iconCls:'icon-search',
			text:"确定",
		});
		
	});

});

