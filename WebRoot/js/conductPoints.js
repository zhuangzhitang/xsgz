// JavaScript Document
$(function(){
		   
	     $('.info_text').validatebox({ 
              required:true
          }); 


		 $('#add').linkbutton({    
    				iconCls: 'icon-add'   
		});
		 
		 $('#add').unbind('click').bind('click', function(){
			 $("#littlewindow").css("display","block").window({
					height:300,
					width:450,
					modal:"true",
					resizable:false,
					maximizable:false,
					title:"添加操行分项"
				});  
		 });
        	
		 $('#little_sure').linkbutton({    
    				iconCls: 'icon-ok'   
			});
		  
		 $('#little_no').linkbutton({    
    				iconCls: 'icon-no'   
			});
		 
		  $('#sure').linkbutton({    
    				iconCls: 'icon-ok'   
			});
		 
		 $('#sure_1').linkbutton({    
    				iconCls: 'icon-ok'   
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
     	          $('#main_table').css('display','block');
     	          $('#point').css('display','block');
     	          $('#dg_academy').datagrid({  
                     url:'conductpoints/conduct_getStudent.gdou?classId='+rec.classId,  
                     title:'班级学生信息',
                     pagination:true,
                     rownumbers:true,
                     fitColumns:true,
                     singleSelect:false,
                     pageList:[35],
                     columns:[[  
                      {field:'ck',checkbox:true},      
				      {field:'studentNum',title:'学号',width:30},  
				      {field:'className',title:'班级', width:30},  
				      {field:'studentName',title:'学生姓名',width:30}  
				   ]]  
				 }); 

     	    }
		 });
		 
		
   		
	
		  
		  $('#sure').bind('click', function(){    
        		$("#table").datagrid({
					rownumbers:true,	   
					columns:[[ 
					{field:"ck",checkbox:true},
        			{field:'code',title:'ѧ��',width:300, align:'center'},    
        			{field:'name',title:'����',width:300, align:'center'},    
        			{field:'price',title:'�༶',width:700,align:'center'}    
    				]]    			   
			});  
		});    
		  
		  $('#sure_1').click(function(){
			 $('#insertConduct').form('submit',{
					url: adminPath+'conductpoints/conduct_insertConductScore.gdou',
					onSubmit:function(){
						var array=$('#dg_academy').datagrid('getSelections');
						var i= array.length;
						if(i==0){
							 $.messager.alert("提示信息",'请选择学生',"info");
						}
						var s='';
						for(var i=0;i<=array.length-1;i++){
							s+=array[i].studentNum+'D';
							if(i==array.length-1){
								s+=array[i].studentNum;
							}
						}
						$('#selectStudent').val(s);
						return $(this).form('validate');
					},
					success:function(result){
						var result=eval('('+result+')');
						$.messager.alert("提示信息",result.message,"info");
					}
				});
			  
		  });
		  
		  $('#year').combobox({
			  editable:false,
			  missingMessage:'请选择学年',
			  required:true,
			  valueField:'schoolYear',
			  textField:'schoolYear',
			  url:'conductpoints/conduct_getSchooltyear.gdou',
			  onSelect: function(rec){   
		            var url = 'conductpoints/conduct_getConductItem.gdou?schoolYear='+rec.schoolYear;  
		            $('#conductitem').combobox('clear');    
		            $('#conductitem').combobox('reload', url);   
				 }
		  });
		  
		  $('#conductitem').combobox({
			  editable:false,
			  missingMessage:'请选择操行分项',
			  required:true,
			  valueField:'id',
			  textField:'text'
		 });
		   
});

function saveConduct(){
	$('#form1').form('submit',{
		url: adminPath+'conductpoints/conduct_insertConduct.gdou',
		onSubmit:function(){
			return $(this).form('validate');
		},
		success:function(result){
		//	quxiaoConduct();
			var result=eval('('+result+')');
		    $.messager.alert("提示信息",result.message,"info");
		}
	});
}

function quxiaoConduct(){
	$('#littlewindow').window({
		closed:true
	});
}



