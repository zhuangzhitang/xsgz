// JavaScript Document
$(function(){
	$('#basic_info').linkbutton({    
    			iconCls: 'icon-redo'
				
				
			});
	$('#score_info').linkbutton({    
    			iconCls: 'icon-redo'
				
			});
	$('#conduct_info').linkbutton({    
    			iconCls: 'icon-redo' 
				
			});
	$('#save').linkbutton({    
    			iconCls: 'icon-save' 
				
			});
	$('#edit').linkbutton({    
    			iconCls: 'icon-edit' 
				
			});
	
	//三个按钮点击事件
	//基本信息点击按钮
	 $('#basic_info').bind('click', function(){ 
			$("#base_main").toggle();						   
			$("#main_score").hide();
			$("#main_poin").hide();
		}) ;
	 
	 //成绩点击事件
	 $('#score_info').bind('click', function(){ 
										   
			$("#base_main").hide();						   
			$("#main_score").toggle();
			$("#main_poin").hide();
		}) ;
	 
	 //操行分点击事件
	 $('#conduct_info').bind('click', function(){ 
										   
			$("#base_main").hide();						   
			$("#main_score").hide();
			$("#main_poin").toggle();
		}) ;
	
		    	   
		   
		   
	});