// JavaScript Document
$(function(){
			//if($("input:text").val()){} 获取文本框的值，是string
			//parseInt("1234blue"); 转化为数值类型
			//var t=$("#id").val();//这个就是我们要判断的值了
				/*if(!isNaN(t)){
  					alert("是数字"); false为数值
				}else{
  					alert("不全是数字");
				}*/
			//遍历每一个text
			 $('input:text').attr("readonly","readonly");	
			$("input:text").each(function(){
  					var x=parseInt($(this).val());
					if(x<60){
						$(this).css({color:"red"});
					}else{}
				});
			
			//点击搜索按钮事件
			$('#search').bind('click', function(){ 
			    var schoolyear = $('#schoolyear').combobox('getValue');
			    var studentNum = $('#studentNum').val();
			    if(schoolyear==""||schoolyear==null){
			    	alert("请输入学年");
			    }else{
			    	$.ajax({
			    		url:adminPath + 'base/studentInfo1_getStudentScoreBynum.gdou?schoolyear='+schoolyear+'&studentNum='+studentNum,
			    		async:false,
			    		 success: function(result){
			    	            var result = eval('('+result+')');
			    	            $.each(result,function(name,value) {
			    	               $.each(result[name],function(name1,value1){
			    	            	  
			    	               });
			    	            });
			    	        }
			    	});
			    }
				$("#main").css("display","block");
			
			}) ;
			
			//学年
			 $('#schoolyear').combobox({
				 editable:false,
				 missingMessage:'请选择学年',
				 url:adminPath+'conductpoints/conduct_getSchooltyear.gdou' 
			 });
});