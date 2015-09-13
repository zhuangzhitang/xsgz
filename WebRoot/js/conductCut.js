// JavaScript Document
$(function(){
		   
		 $('.cc').combobox({    
			 width:180
			});  
  		$('#btn').linkbutton({    
    		iconCls: 'icon-cut'   
			});  
  		$('#academy').combobox({    
			 editable:false,
			 missingMessage:'请选择学院',
			 required:true,
            valueField: 'academyId', 
            textField:  'academyName',
            url:adminPath+'conductpoints/conduct_getAcademy.gdou',
			 onSelect: function(rec){   
	            var url = 'conductpoints/conduct_getMajor.gdou?academyId='+rec.academyId;  
	            $('#major').combobox('clear');    
	            $('#major').combobox('reload', url);   
			 }
		 });
		 
		 $('#major').combobox({    
			 editable:false,
			 missingMessage:'请选择专业',
			 required:true,
            valueField: 'majorId', 
            textField:  'majorName',   
			 onSelect: function(rec){   
	            var url = 'conductpoints/conduct_getClassWithMajor.gdou?majorId='+rec.majorId;  
	            $('#cla').combobox('clear');    
	            $('#cla').combobox('reload', url);   
			 }
		 });
		 
		 $('#cla').combobox({
			 editable:false,
			 missingMessage:'请选择班级',
			 required:true,
            valueField: 'classId', 
            textField:  'className',
            onSelect: function(rec){   
	            var url = 'conductpoints/conduct_getSchooltyear.gdou';  
	            $('#schoolyear').combobox('clear');    
	            $('#schoolyear').combobox('reload', url);   
	    }
	 });
	 
	 $('#schoolyear').combobox({
		 editable:false,
		 missingMessage:'请选择学年', 
		 required:true,
		 valueField:'schoolYear',
		 textField:'schoolYear'
	 });
	 
	 $('#btn').click(function(){
			$('#form').form('submit',{
				url: adminPath+'conductpoints/conductOut_downDataTable.gdou',
				onSubmit:function(){
					return $(this).form('validate');
				},
				success:function(result){
					var result=eval('('+result+')');
					 $.messager.show({
		                 title: '提示信息',
		                 msg: result.message
		             });
				}
			});
		});
});