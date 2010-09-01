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
						for(j = 0; j < json[i].length; j++){
							rows += "<td>";
							rows += json[i][j];
							rows += "</td>";
						}
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