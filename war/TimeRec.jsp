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
		$('.arraive').live('click', function(){
			var data = {"kind": "0", "id":$('#selid').val()};
			$.post('/arrival', data, function(resp){
				$.jGrowl(resp);
			});
		});

		$('.leave').live('click', function(){
			var data = {"kind": "1", "id":$('#selid').val()};			
			$.post('/arrival', data, function(resp){
				$.jGrowl(resp);
			});
		});

		$('.goingout').live('click', function(){
			var kind = "2";
			if(!this.checked)
				var kind = "3";
				
			var data = {"kind": kind, "id":$('#selid').val()};			
			$.post('/arrival', data, function(resp){
				$.jGrowl(resp);
			});
		});

		$('.paidvacation').live('click', function(){
			var data = {"kind": "4", "id":$('#selid').val()};			
			$.post('/arrival', data, function(resp){
				$.jGrowl(resp);
			});
		});

		$('.absence').live('click', function(){
			var data = {"kind": "5", "id":$(this).closest('tr').children('td:eq(2)').text()};			
			$.post('/arrival', data, function(resp){
				$.jGrowl(resp);
			});
		});
});
</script>
<title>暫定版</title>
</head>

	<body>
		<div>
			<div style="background:#ccc;border:solid 2px #333;">
				<input type="text" id="status" width= "300px" value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"/>
				<input type='text' id = 'selid'/>
			</div> 	
		 	<div>
				<ul id="list">
				</ul>
	 		</div>
		</div>
	</body>
</html>