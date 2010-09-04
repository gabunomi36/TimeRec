<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link type="text/css" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.0/themes/start/jquery-ui.css" rel="stylesheet" />
<script type="text/javascript" src="http://www.google.com/jsapi"></script>
<script type="text/javascript">
	google.load("jquery","1");
	google.load("jqueryui","1.8");

	function initialize() {
        $("#btn_1").click(function(){
            $.json2table.parse("/employeeList","#tbl");
        });
	}
	
	google.setOnLoadCallback(initialize);
</script>
<script type="text/javascript" src="scripts/plugin/jquery.plugin_trgrid.js"></script>
<script type="text/javascript" src="scripts/plugin/jExpand.js"></script>

<script type="text/javascript">
	$(function(){
		$('.arraive').live('click', function(){
			var data = {"kind": "0", "id":$(this).closest('tr').children('td:eq(2)').text()};			
			$.post('/arrival', data, function(resp){
				$('#status').val(resp);
			});
		});

		$('.leave').live('click', function(){
			var data = {"kind": "1", "id":$(this).closest('tr').children('td:eq(2)').text()};			
			$.post('/arrival', data, function(resp){
				$('#status').val(resp);
			});
		});

		$('.goingout').live('click', function(){
			var kind = "2";
			if(!this.checked)
				var kind = "3";
				
			var data = {"kind": kind, "id":$(this).closest('tr').children('td:eq(2)').text()};			
			$.post('/arrival', data, function(resp){
				$('#status').val(resp);
			});
		});

		$('.paidvacation').live('click', function(){
			var data = {"kind": "4", "id":$(this).closest('tr').children('td:eq(2)').text()};			
			$.post('/arrival', data, function(resp){
				$('#status').val(resp);
			});
		});

		$('.absence').live('click', function(){
			var data = {"kind": "5", "id":$(this).closest('tr').children('td:eq(2)').text()};			
			$.post('/arrival', data, function(resp){
				$('#status').val(resp);
			});
		});
});
</script>

<title>暫定版</title>

    <style type="text/css">
        body { font-family:Arial, Helvetica, Sans-Serif; font-size:0.8em;}
        #tbl { border-collapse:collapse;}
        #tbl h4 { margin:0px; padding:0px;}
        #tbl img { float:right;}
        #tbl ul { margin:10px 0 10px 40px; padding:0px;}
        #tbl th { background:#7CB8E2 url(scripts/plugin/header_bkg.png) repeat-x scroll center left; color:#fff; padding:7px 15px; text-align:left;}
        #tbl td { background:#C7DDEE none repeat-x scroll center left; color:#000; padding:7px 15px; }
        #tbl tr.odd td {cursor:pointer; }
        #tbl div.arrow { background:transparent url(scripts/plugin/arrows.png) no-repeat scroll 0px -16px; width:16px; height:16px; display:block;}
        #tbl div.up { background-position:0px 0px;}
    </style>
</head>
<body>
    <input id="btn_1" type="button" value="プラグイン呼び出し" />
	<input type="text" id="status" width= "300px" value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"/>
 	<table id="tbl">
		<tr>
			<th width = '120px'>写真</th>
			<th width = '150px'>名前</th>
			<th width = '250px'>コメント</th>
            <th></th>
		</tr>
	</table>
	
	<form id="arrival" method="post" action="">
		<input type="submit" value="出社"/>
	</form>
	<form id="leave" method="post" action="/leave">
		<input type="submit" value="退社"/>
	</form>	
</body>
</html>