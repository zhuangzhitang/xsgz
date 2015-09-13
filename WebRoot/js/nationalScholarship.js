// JavaScript Document
/*$("input[name=items]").each(function() {  
            if ($(this).attr("checked")) {  
                text += ","+$(this).val();  
            }  
        });  */
			/*
			     $(this).attr('disabled','disabled');
06
            if($("input[name='group1']:checked").length >= 4)
07
            {
08
                //alert("test");
09
                $("input[name='group1']").attr('disabled','disabled');
10
            }
11
        });
12
         
13
        $("#compute").click(function(){
14
            $('input').live('click',function(){
15
                //alert($('input:checked').length);
16
                $("#show").html($('input:checked').length);
17
            });
18
        })
		
		 $("input[class=info_chex]").each(function(){
			if($(this).attr("checked")){
				
						
				}
				
													  
		});
			*/


$(function(){
		  
	  $('#sea_buton').bind('click', function(){ 
				$("#sure_buton").show();
				$("#search_buton").hide();
				$(".info_chex").show();
				
										
				});
	  
	  $("#sur_button").bind("click",function(){
			
		if($("input[name='group1']:checked").length <=0){
				alert("ÇëÑ¡ÔñÃûµ¥");
			}
			else{
				$("#out_buton").show();
				$("#search_buton").show();
				$(".info_chex").hide();
				$("#sure_buton").hide();
					
				}
			
		});
	  
	 
		   
		   
		   
		   });