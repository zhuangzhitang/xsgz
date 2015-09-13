// JavaScript Document
$(function(){
		   
		 $('.cc').combobox({    
			});  
  		$('#btn').linkbutton({    
    		iconCls: 'icon-cut'   
			});  
  		
  		 $('#data').combobox({
			  editable:false,
			  missingMessage:'请选择要导出的表格',
			  required:true,
	          valueField: 'id', 
	          textField:  'excelname',
	          data: [{'id':-1,'excelname':'请选择要导出的表格','selected':true},{'id':1,'excelname':'班级综合测评表'},{'id':2,'excelname':'全系综合测评表'},{'id':3,'excelname':'全系奖学金获得者名单'},{'id':4,'excelname':'全系奖学金发放表'}],
	          onSelect: function(rec){   
			            if(rec.id==1){
			            	$('#classli').css('display','block');
			            }else{
			            	$('#classli').css('display','none');
			            }
			 }
	                
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
			 textField:'schoolYear',
			 url:'conductpoints/conduct_getSchooltyear.gdou'
		 });
		 
  		$('#btn').click(function(){
  			$('#form').form('submit',{
  				url: adminPath+'scholarships/scholarships_downDataTable.gdou',
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