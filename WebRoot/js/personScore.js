// JavaScript Document

$(document).ready(function () {
	 $('#schoolyear').combobox({
		  editable:false,
		  missingMessage:'请选择学年',
		  required:true,
         onSelect: function(data){  
        	$('#personScore').datagrid({ 
	    			url:adminPath+"base/studentInfo1_getStudentScoreBynum.gdou?schoolyear=" +data.schoolYear+"&studentNum="+studentNum
				});  
			$('#personScore').datagrid('reload'); 
			
		 }
               
	  });
});
 var users = {total:5,rows:[
            {name:'高数',score:1,price:1,price1:1,price2:1}
           
        ]};
$(function(){
	
		$('#personScore').datagrid({
		title:'学生成绩',
		//url : 'datagrid_data.json',
		toolbar:'#toolbar',

		columns : [ [
		{
			field:"ck",checkbox:true
		},
		{
			field : 'courseName',
			title : '课程名',
			width : 250,
			editor:'text'
		},
		{
			field : 'id',
			title : '课程id',
			width : 250,
			hidden:true
		},

		{
			field : 'grade',
			title : '成绩',
			width : 200,
			editor:'numberbox'
		},

		{
			field : 'bukao',
			title : '补考成绩',
			width : 200,
			editor:'numberbox'
		},
		
		{
			field : 'chongkao',
			title : '重考成绩',
			width : 200,
			editor:'numberbox'
		},
		
		{
			field : 'qingkao',
			title : '清考成绩',
			width : 200,
			editor:'numberbox'
		}
		] ],
		
		 onBeforeEdit:function(index,row){    
		        $('#personScore').datagrid('refreshRow', index);  
		    },  
		    onAfterEdit:function(index,row){    
		        $('#personScore').datagrid('refreshRow', index);  
		    },  
		    onCancelEdit:function(index,row){    
		        $('#personScore').datagrid('refreshRow', index);  
		    }  

	});  
		
	$('#editScore_dlg').window({
		top:100
	});

	});
function editScore(){
	 var row = $('#personScore').datagrid('getSelected');
	 if(row){
		 $('#editScore_dlg').dialog('open').dialog('setTitle','修改成绩');
		 $('#editScore_fm').form('load',row);// 将选中的行的数据加载到弹窗
	 }
	 
}


function saveScore(){
	$('#editScore_fm').form('submit',{
		url:adminPath + 'base/studentInfo1_updateStudentScore.gdou',
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
	                $('#editScore_dlg').dialog('close');
	                $('#personScore').datagrid('reload');   
	                $.messager.show({
	                    title: '提示',
	                    msg: result.success
	                });
	           }
	        }
		
	});
}
