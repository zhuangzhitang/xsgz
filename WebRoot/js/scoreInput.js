// JavaScript Document
$(function(){  
        	 $("#addtable").window({
        		title:'课程属性选择及学分导入',
				height:360,
				width:600,
				modal:"true"		
			});    
        	 var message=$("#hiddenmessage").val();
        	 if(message!=""){
        		 $.messager.alert("提示信息",message,"info");
        	 }
        	 
        	 $('#academyScore').combobox({    
    			 editable:false,
    			 missingMessage:'请选择学院',
    			 required:true,
                 valueField: 'academyId', 
                 textField:  'academyName',
                 url:adminPath+'conductpoints/conduct_getAcademy.gdou',
    			 onSelect: function(rec){   
    	            var url = 'conductpoints/conduct_getMajor.gdou?academyId='+rec.academyId;  
    	            $('#majorScore').combobox('clear');    
    	            $('#majorScore').combobox('reload', url);   
    			 }
    		 });
    		 
    		 $('#majorScore').combobox({    
    			 editable:false,
    			 missingMessage:'请选择专业',
    			 required:true,
                 valueField: 'majorId', 
                 textField:  'majorName',   
    			 onSelect: function(rec){   
    	            var url = 'conductpoints/conduct_getClassWithMajor.gdou?majorId='+rec.majorId;  
    	            $('#claScore').combobox('clear');    
    	            $('#claScore').combobox('reload', url);   
    			 }
    		 });
    		 /*
    		 $('#btn').linkbutton({    
    	    		iconCls: 'icon-cut'   
    		});
    		*/
    		 $('#claScore').combobox({
    			 editable:false,
    			 missingMessage:'请选择班级',
    			 required:true,
                 valueField: 'className', 
                 textField:  'className'
    		 }); 	 
    		 
    		 $('#bn').click(function(){
    			 $.messager.confirm('消息提醒','请反复确定数据的正确性，提交后数据将不可再更改，请慎重！！！',function(r){  
    				 if(r){  
    					 $('#fm').submit();
    				 }  
    			 }); 
    		});
	});