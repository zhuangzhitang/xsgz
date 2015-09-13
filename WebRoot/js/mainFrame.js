$(function () {
    	InitLeftMenu();
    });

function InitLeftMenu() {
    	$('.easyui-accordion li a').click(function () {
    		var tabTitle = $(this).text();
    		var url = $(this).attr("href");
    		addTab(tabTitle, url);
    		$('.easyui-accordion .menu_list li a').removeClass("selected");
    		$(this).addClass("selected");
    	}).hover(function () {
    		$(this).addClass("hover");
    	}, function () {
    		$(this).removeClass("hover");
    	});
    }

    function addTab(tabtitle, url) {
    	if (!$('#tabs').tabs('exists', tabtitle)) {
    		$('#tabs').tabs('add', {
    			title: tabtitle,
    			content: createFrame(url),
    			closable: true,
    			width: $('#mainPanle').width() - 10,
    			height: $('#mainPanle').height() - 26
    		});
    	} else {
    		$('#tabs').tabs('select', tabtitle);
    	}
    }

    function createFrame(url) {
    	var s = '<iframe name="mainFrame" scrolling="yes" frameborder="0"  src="' + url + '" style="width:100%;height:100%;"></iframe>';
    	return s;
    }