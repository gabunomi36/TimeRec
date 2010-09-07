<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link type="text/css" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.0/themes/start/jquery-ui.css" rel="stylesheet" />
<script type="text/javascript" src="http://www.google.com/jsapi"></script>

<link type="text/css" href="css/TimeRec.css" rel="stylesheet" />
<link type="text/css" href="css/jquery.jgrowl.css" rel="stylesheet" />
<script type="text/javascript">
	google.load("jquery","1");
	google.load("jqueryui","1.8");

	function initialize() {
        $.json2list.parse("/employeeList","#list");
	}
	
	google.setOnLoadCallback(initialize);
</script>
<script type="text/javascript" src="scripts/plugin/jquery.plugin_trgrid.js"></script>
<script type="text/javascript" src="scripts/plugin/jquery.plugin.timereclist.js"></script>
<script type="text/javascript" src="scripts/plugin/jquery.curvycorners.min.js"></script>
<script type="text/javascript" src="scripts/plugin/jquery.jgrowl_compressed.js"></script>
<script type="text/javascript" src="scripts/plugin/jExpand.js"></script>

<script type="text/javascript">

	$(function(){
		$('.maskStatus').live('change', function(){
			var mask = parseInt($(this).val());
			
			var stat = "";
			if((mask & 0x10) == 0x10){
				stat = '外出中';
			}
			else{
				switch(mask){
				case 1:
					stat = '在席';
					break;
				case 2:
					stat = '不在';
					break;
				case 4:
					stat = '有給';
					break;
				case 8:
					stat = '欠勤';
					break;
				}
			}

			$(this).getRootItem().getStatusElement().text(stat);
		});

		$('.arraive').live('click', function(){
			var mask = parseInt($(this).getRootItem().getMaskValueElement().val());
			if((mask & 1) != 0){
				$.jGrowl("既に出社しています");
				return;
			}

			mask = (mask & 0x10) | 1;
			$(this).getRootItem().getMaskValueElement().val(mask);
			
			var data = {"kind": "1", "id":$('#selid').val()};
			$.post('/arrival', data, function(resp){
				$.jGrowl(resp);
			});
			$(this).getRootItem().getMaskValueElement().change();
		});

		$('.leave').live('click', function(){
			var mask = parseInt($(this).getRootItem().getMaskValueElement().val());
			if((mask & 2) != 0){
				$.jGrowl("既に退出しています");
				return;
			}
			
			mask = (mask & 0x10) | 2;
			$(this).getRootItem().getMaskValueElement().val(mask);
			
			var data = {"kind": "-1", "id":$('#selid').val()};			
			$.post('/arrival', data, function(resp){
				$.jGrowl(resp);
			});
			$(this).getRootItem().getMaskValueElement().change();
		});

		$('.goingout').live('click', function(){
			var mask = parseInt($(this).getRootItem().getMaskValueElement().val());

			mask = (mask & 0x0F);
			
			var kind = "-2";
			if(this.checked){
				mask |= 0x10;
				var kind = "2";
			}
			$(this).getRootItem().getMaskValueElement().val(mask);
				
			var data = {"kind": kind, "id":$('#selid').val()};			
			$.post('/arrival', data, function(resp){
				$.jGrowl(resp);
			});
			$(this).getRootItem().getMaskValueElement().change();
		});

		$('.paidvacation').live('click', function(){
			var mask = parseInt($(this).getRootItem().getMaskValueElement().val());
			if((mask & 4) != 0){
				return;
			}
			
			mask = (mask & 0x10) | 4;
			$(this).getRootItem().getMaskValueElement().val(mask);

			var data = {"kind": "3", "id":$('#selid').val()};			
			$.post('/arrival', data, function(resp){
				$.jGrowl(resp);
			});
			$(this).getRootItem().getMaskValueElement().change();
		});

		$('.absence').live('click', function(){
			var mask = parseInt($(this).getRootItem().getMaskValueElement().val());
			if((mask & 8) != 0){
				return;
			}
			
			mask = (mask & 0x10) | 8;
			$(this).getRootItem().getMaskValueElement().val(mask);

			var data = {"kind": "4", "id":$('#selid').val()};			
			$.post('/arrival', data, function(resp){
				$.jGrowl(resp);
			});
			$(this).getRootItem().getMaskValueElement().change();
		});
});
</script>
<title>暫定版</title>
</head>

	<body>
		<div>
			<div style="background:#ccc;border:solid 2px #333;">
				<img src='data/cloudTimeCard.png'/>
				<img src='data/bannerTitle.png' style='float:right'/>
				<img src="http://code.google.com/appengine/images/appengine-silver-120x30.gif" style='display:block' alt="Powered by Google App Engine" />
				<input type='hidden' id = 'selid'/>
			</div> 	
		 	<div>
				<ul id="list">
				</ul>
	 		</div>
		</div>
	</body>
</html>