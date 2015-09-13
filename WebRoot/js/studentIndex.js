$(document).ready(function(){
	$('#applyDiv').hide();
	$('#download').hide();
	$('#attention').hide();
	$('#detail').hide();
	//页面的切换
	
	//点击首页
	$('#showMain').click(function(e) {
        $('#download').hide();
		$('#attention').hide();
		$('#applyDiv').hide();
		$('#detail').hide();
		$('#main').show();
    });
	//点击公告
	$('#showAttention').click(function(e) {
        $('#download').hide();
		$('#main').hide();
		$('#detail').hide();
		$('#attention').show();
    });
	
	//点击文档下载
	$('#showDownload').click(function(e) {
		showDownFiles();//获取下载文档列表信息
        $('#main').hide();
		$('#attention').hide();
		$('#detail').hide();
		$('#download').show();
    });
	
	//点击申请按键，弹出申请框
	$('.apply').on('click',function(){
		$('#applyDiv').hide();
		
		var toggle=$(this).attr('toggle');
		$('.panel-heading').empty().append(toggle);
		
		if(toggle=="申请贫困生"){
			$("#applyWord").hide();
			$("#add_1").show();
			$("#add_2").hide();
			$("#add_3").hide();
		}else if(toggle=="申请勤工岗位"){
			$("#applyWord").show();
			$("#add_2").show();
			$("#add_1").hide();
			$("#add_3").hide();
		}else if(toggle=="申请助学贷款"){
			$("#applyWord").show();
			$("#add_3").show();
			$("#add_1").hide();
			$("#add_2").hide();
		}
		else {
			$("#applyWord").show();
			$("#add_3").hide();
			$("#add_1").hide();
			$("#add_2").hide();
		}
		
		$('#applyDiv').fadeIn();
		
		});
	//点击导航栏中的申请，弹出对话框
	$('#navApply li').click(function(e) {
		$('#download').hide();
		$('#attention').hide();
		$('#applyDiv').hide();
		$('#detail').hide();
		$('#main').show();
		var toggle=$(this).attr('toggle');
		$('.panel-heading').empty().append(toggle);
		
        $('#applyDiv').hide();
		$('#applyDiv').fadeIn();
    });
	
	$('#applySubmitBtn').click(function(e) {
		//通过申请提交的标题控制提交申请的类型
		alert("hi");
		var applyTypeStr = $('.panel-heading').html();
		if(applyTypeStr == '申请国家助学金'){
			$('#applyType').attr('value',1);
		} else if(applyTypeStr == '申请国家奖学金'){
			$('#applyType').attr('value',2);
		} else if(applyTypeStr == '申请勤工岗位'){
			$('#applyType').attr('value',3);
		} else if(applyTypeStr == '申请助学贷款'){
			$('#applyType').attr('value',4);
		} else if(applyTypeStr == '申请国家励志奖学金'){
			$('#applyType').attr('value',5);
		}else if(applyTypeStr == '申请贫困生'){
			$('#applyType').attr('value',6);
		}
		
		if(applyNullTest()){
			//申请提交
			$('#applyForm').submit();
		} else{
			return false;
		}
    });
	
	$('.close,#cancel').click(function(e) {
        $('#applyDiv').hide();
    });
	//修改密码
	$("#alertPass").click(function(){
		$("#panel1").show();
	});
	$("#panel1_sub").click(
			function(){
			if($("#oldpass").val()==$("#newpass").val()){
				alert("新密码不能与旧密码相同");
			}
			if($("#newpass").val()==""||$("#newpass1").val()==""||$("#oldpass").val()==""){
				alert("密码不能为空");
			}
			if(!($("#newpass").val()==$("#newpass1").val())&&!($("#newpass1").val()=="")&&!($("#newpass").val()=="")){
				alert("两次新密码不相同");
				
			}
			
			}
			);
	
	$("#panel1_cal").click(function(){
		$("#panel1").hide();
	});
	
	
	$('.menu >li').hover(function(event){
		if(!$(this).find('ul').is(":animated"))
			$(this).find('ul').slideDown('slow').show();
			   
		},
		function(){
				$(this).find('ul').slideUp('slow');
	});

});

function showDetail(){
	$('#attention').hide();
	$('#detail').show();
};

function applyNullTest(){
	var applyType = $('#applyType').val();
	var applyWord = $('#applyWord').val();
	if(applyType == 0){
		alert("请选择申请的类型！");
		return false;
	}
	if(applyType!=6 && applyWord == ""){
		alert("请先选择填好的申请文件！");
		return false;
	}
	
	return true;
}

/**
 * 显示下载文件列表
 */
function showDownFiles(){
	$('#mytable')
	.dataTable(
			{
				"sDom": '<"top"l>rt<"bottom_left"i><"bottom_right"p><"clear">',
				"bFilter" : false,// 去掉搜索框
				"bSort" : false,
//				"aaSorting" : false,
				"bAutoWidth" : false, // 自适应宽度
				"bLengthChange" : true,
				"sPaginationType" : "full_numbers",
				// "sAjaxDataProp" : "aData",
				"bDestroy" : true,
				"bProcessing" : true,//加载提示
				"sAjaxSource" : downfileUrl+'getDownloadFiles.gdou',
//				"sAjaxSource" : fyToolUrl+'&toolAction=getApplicationList'
//								+ '&selectType=' + selectType,
				"bServerSide" : true,
				// "bStateSave" : true, //这句话导致了"aaSorting" : [ [ 1,
				// 'desc' ] ],失效
				"aoColumns" : [ {
					"mDataProp" : "number",
					"sClass" : "center",
					"bSortable" : false
				},  {
					"mDataProp" : "wordName",
					"sClass" : "center",
					"bSortable" : false
				}, {
					"mDataProp" : "wordDownUrl",
					"sClass" : "center",
					"bSortable" : false
				}, 
				],
				"oLanguage" : {
					"sProcessing" : "正在加载中......",
					"sLengthMenu" : "每页显示 _MENU_ 条记录",
					"sZeroRecords" : "没有数据！",
					"sEmptyTable" : "表中无数据存在！",
					"sInfo" : "当前显示 _START_ 到 _END_ 条，共 _TOTAL_ 条记录",
					"sInfoEmpty" : "显示0到0条记录",
					"sInfoFiltered" : "数据表中共为 _MAX_ 条记录",
					
					// "sSearch" : "搜索",
					"oPaginate" : {
						"sFirst" : "首页",
						"sPrevious" : "上一页",
						"sNext" : "下一页",
						"sLast" : "末页"
					}
				},
				"fnRowCallback" : function(nRow, aaData, iDisplayIndex,
						iDisplayIndexFull) {
//					// 修改第2列的内容，fileName作为resName
					var fileName = encodeURI(encodeURI(aaData.wordName));//encodeURI();
					var result = '<a href="${pageContext.request.contextPath}'+downfileUrl+'download.gdou';
					result += '?res='+fileName+'&resType=application/msword&resName='+fileName+'">下载</a>';
					//项目审核
//					if (projectStatus == '0') {
//						result = btnPre2+"未审核"+btnTail;
//						$('td:eq(5)', nRow).html('<a onclick="getDetails(\''+aaData.applicationId+'\')">申请详情</a>');
//					} else if(projectStatus=='1'){
//							result = btnPre3+"已通过"+btnTail;
//							$('td:eq(5)', nRow).html('<a onclick="getDetails(\''+aaData.applicationId+'\')">审核结果</a>');
//					}
//						else{
//							result = btnPre1+"未通过"+btnTail;
//							$('td:eq(5)', nRow).html('<a onclick="getDetails(\''+aaData.applicationId+'\')">审核结果</a>');
//							}
					$('td:eq(2)', nRow).html(result);
//					
					return nRow;
				},
				"fnDrawCallback" : function(oSettings) {
					// jAlert( 'DataTables 重绘了' );
				},
				"fnFooterCallback" : function(nFoot, aData, iStart,
						iEnd, aiDisplay) {
					// jAlert("FooterCallback");
				},
			});
}