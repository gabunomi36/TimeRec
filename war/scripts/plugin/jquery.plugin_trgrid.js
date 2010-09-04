(function($){
	$.extend({
		// namespace:json2table
		json2table :new function(){
			// parseメソッド追加
			this.parse = function(target_url, target){
				$.getJSON(target_url, function(json){
					var rows = "";

					for(i = 0; i< json.length; i++){
						// マスターの行を生成
						rows += "<tr>";

						// 顔写真
						rows += "<td>";
						rows += "<img width='80px' height='80px' src='" + json[i]["imageUrl"] + "'/>";
						rows += "</td>";

						// 名前
						rows += "<td Valign='top'>";
						rows += json[i]["firstName"] + " " + json[i]["lastName"];
						rows += "</td>";

						// コメント
						rows += "<td Valign='top'>";
						rows += json[i]["profile"];
						rows += "</td>";
/*
						// 状態
						rows += "<td>";
						rows += json[i]["status"];
						rows += "</td>";	
*/
						rows += "<td>";
						rows += "<div class='arrow'></div>";
						rows += "</td>";	

						rows += "</tr>";
						
						// サブの行を生成
						rows += "<tr>";

						// 出勤
						rows += "<td>";
						rows += "<div id='arraival'>";
						rows += "<input class = 'arraive' type='radio' id = 'radio1_" + i + "' name='radio_" + i +"' /><label for='radio1_" + i + "'>出勤</label>"
						rows += "<input class = 'leave' type='radio' id = 'radio2_" + i + "' name='radio_" + i +"' /><label for='radio2_" + i + "'>退出</label>"
						rows += "</div>"
						rows += "</td>";

						// 外出
						rows += "<td colspan='2'>";
						rows += "<div id='other'>";
						rows += "<input class = 'goingout' type='checkbox' id = 'radio3_" + i + "'/><label for='radio3_" + i + "'>外出</label>"
						rows += "<input class = 'paidvacation' type='checkbox' id = 'radio5_" + i + "'/><label for='radio5_" + i + "'>有給</label>"
						rows += "<input class = 'absence' type='checkbox' id = 'radio6_" + i + "'/><label for='radio6_" + i + "'>欠勤</label>"
						rows += "</div>";

						// id
						rows += "<td>";
						rows += json[i]["employeeID"];
						rows += "</td>";
					}
					$(target).append(rows);
					
			        $("tr:odd",target).addClass("odd");
			        $("tr:not(.odd)",target).hide();
			        $("tr:first-child",target).show();

			        $("tr.odd",target).click(function(){
			            $(this).next("tr").toggle();
			            $(this).find('.arrow').toggleClass("up");
			        });
			        
		    		$("#arraival",target).buttonset();
		    		$("#other",target).buttonset();
				});
			};
		}
	});
	
	$.fn.extend({
		json2table :$.json2table.parse
	});
})(jQuery);