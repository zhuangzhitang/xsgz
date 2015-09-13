// JavaScript Document

$(function(){
		   //正常时大小
		   	var width=$(document.body).width(); 
			var height=$(document.body).height(); 
			var width1=$(document.body).width()*0.8;
			 $("#z_index").css({ left:'83%',top:160+"px"});
		});

	$(function(){
		   var width=0;
		   var height=0;
		   var width1=0;
		   //窗口改变大小是触发
		   window.onresize = function () {
			  	 width=$(document.body).width(); 
				 height=$(document.body).height(); 
				 width1=$(document.body).width()*0.8;
				 $("#z_index").css({ left:'83%',top:160+"px"});
			}
			   
			  //滑动滚动条是触发
			$(window).scroll(function() { 
				var top = $(window).scrollTop()+5; 
				var left= $(window).scrollLeft()+$(document.body).width()*0.8; 
			 	 //width=$(document.body).width(); 
				 //height=$(document.body).height(); 
				 //width1=$(document.body).width()*0.9;	
			 $("#z_index").css({ left:'83%',top:top+160+"px"});
			$("#hidebox").css({ left:left*0.35 + "px",top:top+35+"px"});
			
			
			}); 
		  });
function opene(s) {
	var a = document.getElementsByTagName("a");
	var url = basePath+"file/up/word_2/"+s+".htm";
	window.open(url,
			"newwindow","height=400, width=800,left=400  top=200 toolbar=no, menubar=no, scrollbars=no, 															                          resizable=no, location=no, status=no")

}


