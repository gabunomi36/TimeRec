(function($){
	$.extend({
		// namespace:json2list
		json2list :new function(){
			// parseメソッド追加
			this.parse = function(target_url, target){
				$.getJSON(target_url, function(json){
					var rows = "";

					for(i = 0; i< json.length; i++){
						// マスターの行を生成
						rows += "<li>";
						rows += "<div class='item'>"

						// 顔写真
						rows += "<img width='120px' height='120px' src='" + json[i]["imageUrl"] + "'/>";

						// 名前
						rows += "<span class='epname'>";
						rows += json[i]["firstName"] + " " + json[i]["lastName"];
						rows += "</span>";

						// コメント
						rows += "<span class='profile'>";
						rows += json[i]["profile"];
						rows += "</span>";

						// ID
						rows += "<input type='hidden' class='empid' value='" + json[i]["employeeID"] + "'/>";

						// ボタンコンテナ
						rows += "<div class='buttonContainer' style='display:none'>"
						rows += "<div id='arraival'>";
						rows += "<input class = 'arraive' type='radio' id = 'radio1_" + i + "' name='radio_" + i +"' /><label for='radio1_" + i + "'>出勤</label>"
						rows += "<input class = 'leave' type='radio' id = 'radio2_" + i + "' name='radio_" + i +"' /><label for='radio2_" + i + "'>退出</label>"
						rows += "<input class = 'goingout' type='checkbox' id = 'radio3_" + i + "'/><label for='radio3_" + i + "'>外出</label>"
						rows += "<input class = 'paidvacation' type='checkbox' id = 'radio5_" + i + "'/><label for='radio5_" + i + "'>有給</label>"
						rows += "<input class = 'absence' type='checkbox' id = 'radio6_" + i + "'/><label for='radio6_" + i + "'>欠勤</label>"
						rows += "</div>"
							
						rows += "</div>"

						rows += "</div>"

						rows += "</li>";
					}
					$(target).append(rows);
					
					var settings = {
					          tl: { radius: 15 },
					          tr: { radius: 15 },
					          bl: { radius: 15 },
					          br: { radius: 15 },
					          antiAlias: true,
					          autoPad: true,
					          validTags: ["div"]
					      };
					$(".item", target).corner(settings);

			        $('img',target).click(function(){
						$('#selid').val($(this).closest('li').children('div').children('.empid').val());
						$(".buttonContainer",target).fadeOut();
						$(".buttonContainer", $(this).closest('li')).fadeIn(1000);
			        });
					
					$("#arraival",target).buttonset();
				});
			};
		}
	});
	
	$.fn.extend({
		json2list :$.json2list.parse
	});
})(jQuery);