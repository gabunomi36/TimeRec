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
						rows += "<img width='80px' height='80px' src='" + json[i]["imageUrl"] + "'/>";

						// 名前
						rows += json[i]["firstName"] + " " + json[i]["lastName"];

						// コメント
						rows += json[i]["profile"];

						// コメント
						rows += "<input type='text' class='empid' value='" + json[i]["employeeID"] + "'/>";
						
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
/*					
			        $(".item",target).click(function(){
			        	alert('aaaaaaaaaaa');
			        });
*/
				});
			};
		}
	});
	
	$.fn.extend({
		json2list :$.json2list.parse
	});
})(jQuery);