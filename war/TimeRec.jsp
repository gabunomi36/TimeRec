<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link type="text/css" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.0/themes/start/jquery-ui.css" rel="stylesheet" />
<script type="text/javascript" src="http://www.google.com/jsapi"></script>

<link type="text/css" href="css/TimeRec.css" rel="stylesheet" />
<script type="text/javascript">
	google.load("jquery","1");
	google.load("jqueryui","1.8");

	function initialize() {
        $("#btn_1").click(function(){
   //         $.json2table.parse("/employeeList","#tbl");
            $.json2list.parse("/employeeList","#list");
        });
        $("#dialog-modal").dialog({autoOpen: false});

        $("#show").click(function(){
        	$("#dialog-modal").dialog({
        		height: 100,
        		width: 350,
        		modal: true
        	});
        });
        
		$("#dialog-modal").buttonset();
        
        // a workaround for a flaw in the demo system (http://dev.jqueryui.com/ticket/4375), ignore!
		$("#dialog-modal").dialog("destroy");
		}
	
	google.setOnLoadCallback(initialize);
</script>
<script type="text/javascript" src="scripts/plugin/jquery.plugin_trgrid.js"></script>
<script type="text/javascript" src="scripts/plugin/jquery.plugin.timereclist.js"></script>
<script type="text/javascript" src="scripts/plugin/jquery.curvycorners.min.js"></script>
<script type="text/javascript" src="scripts/plugin/jExpand.js"></script>

<script type="text/javascript">

	$(function(){
		$('.item').live('click', function(){
			$('#selid').val($(this).children('.empid').val());
        	$("#dialog-modal").dialog({
        		top:10,
        		left:10,
        		height: 100,
        		width: 350,
        		modal: true
        	});
		});
		
		$('.arraive').live('click', function(){
			var data = {"kind": "0", "id":$('#selid').val()};
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
</head>

	<body>
		<div>
			<div style="background:#ccc;border:solid 2px #333;">
				<input id="btn_1" type="button" value="プラグイン呼び出し" />
				<input type="text" id="status" width= "300px" value="aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"/>
				<input id="show" type="button" value="$.fixedUI" />
				<input id="hide" type="button" value="$.unfixedUI" />
				<input type='text' id = 'selid'/>
			</div> 	
		 	<div>
			 	<table id="tbl">
					<tr>
						<th width = '120px'>写真</th>
						<th width = '150px'>名前</th>
						<th width = '250px'>コメント</th>
			            <th></th>
					</tr>
				</table>
				<ul id="list">
				</ul>
	 		</div>
		</div>
		<div id="dialog-modal" title="Basic modal dialog">
				<input class = 'arraive' type='radio' id = 'arraive' name='radio' /><label for='arraive'>出勤</label>
				<input class = 'leave' type='radio' id = 'leave' name='radio' /><label for='leave'>退出</label>
				<input class = 'goingout' type='checkbox' id = 'goingout'/><label for='goingout'>外出</label>
				<input class = 'paidvacation' type='checkbox' id = 'paidvacation'/><label for='paidvacation'>有給</label>
				<input class = 'absence' type='checkbox' id = 'absence'/><label for='absence'>欠勤</label>
		</div>
	</body>
</html>