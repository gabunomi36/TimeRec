(function($){
	$.extend({
		// namespace:json2table
		json2table :new function(){
			// parseメソッド追加
			this.parse = function(target_url, table){
				$.getJSON(target_url, function(json){
					var rows = "";

					for(i = 0; i< json.length; i++){
						rows += "<tr>";

						// 顔写真
						rows += "<td>";
						rows += "<img width='80px' height='80px' src='" + json[i]["imageUrl"] + "'/>";
						rows += "</td>";

						// 名前
						rows += "<td Valign='top'>";
						rows += json[i]["firstName"] + " " + json[i]["lastName"];
						rows += "</td>";

						// 出勤
						rows += "<td>";
						rows += "<input class='arraive' width='80px' height='80px' type='button' value='出'/>";
						rows += "</td>";

						// 外出
						rows += "<td>";
						rows += "<input class='leave' width='80px' height='80px' type='button' value='外'/>";
						rows += "</td>";
						
						// 有給
						rows += "<td>";
						rows += "<input width='80px' height='80px' type='button' value='有'/>";
						rows += "</td>";
						
						// 欠勤
						rows += "<td>";
						rows += "<input width='80px' height='80px' type='button' value='欠'/>";
						rows += "</td>";
						
						// 状態
						rows += "<td>";
						rows += json[i]["status"];
						rows += "</td>";
	
						// id
						rows += "<td>";
						rows += json[i]["employeeID"];
						rows += "</td>";
						rows += "</tr>";
					}
					$(table).append(rows);
				});
			};
		}
	});
	
	$.fn.extend({
		json2table :$.json2table.parse
	});
})(jQuery);