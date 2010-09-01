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

<script type="text/javascript">
	function getKey(object)
	{
		alert($(object).closest('tr').children('td:eq(1)').text());
	}
</script>
<title>暫定版</title>

</head>
<body>
    <input id="btn_1" type="button" value="プラグイン呼び出し" />
	
	<table id="tbl">
		<tbody>
			<tr>
				<th>名前</th>
				<th>所属</th>
			</tr>
		</tbody>
	
	</table>
	
	<form id="arrival" method="post" action="">
		<input type="submit" value="出社"/>
	</form>
	<form id="leave" method="post" action="/leave">
		<input type="submit" value="退社"/>
	</form>
</body>
</html>