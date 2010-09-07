var selectedItem = null;
(function($){
	$.extend({
		// namespace:json2list
		json2list :new function(){
			
			// ボタンコンテナ
			$.fn.getButtonContainer = function(){
//				return $(this).find('.buttonContainer');
				return $('.buttonContainer', this);
			};
		
			// 社員IDの取得
			$.fn.getEmploeeID = function(){
				return $('.empid', this).val();
			};
			
			// 子要素から親を取得 
			$.fn.getRootItem = function(){
				return $(this).closest('li');
			};
			
			// マスク値のを格納するエレメントの取得
			$.fn.getMaskValueElement = function(){
				return $('.maskStatus', this);
			};

			// マスク値のを格納するエレメントの取得
			$.fn.getStatusElement = function(){
				return $('.status', this);
			};
		
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

						// ステータス
						rows += "<div class='status'>";
						rows += json[i]["status"];
						rows += "</div>";

						// コメント
						rows += "<span class='profile'>";
						rows += json[i]["profile"];
						rows += "</span>";

						// ID
						rows += "<input type='hidden' class='empid' value='" + json[i]["employeeID"] + "'/>";
						rows += "<input type='hidden' class='maskStatus' value='0'/>";

						// ボタンコンテナ
						rows += "<div class='buttonContainer' style='display:none'>"
						rows += "<div id='arraival'>";
						rows += "<input class = 'arraive' type='radio' id = 'radio1_" + i + "' name='radio_" + i +"' /><label for='radio1_" + i + "'>出社</label>"
						rows += "<input class = 'leave' type='radio' id = 'radio2_" + i + "' name='radio_" + i +"' /><label for='radio2_" + i + "'>退出</label>"
						rows += "<input class = 'goingout' type='checkbox' id = 'radio3_" + i + "'/><label for='radio3_" + i + "'>外出</label>"
						rows += "<input class = 'paidvacation' type='radio' id = 'radio5_" + i  + "' name='radio_" + i　+ "'/><label for='radio5_" + i + "'>有給</label>"
						rows += "<input class = 'absence' type='radio' id = 'radio6_" + i + "' name='radio_" + i + "'/><label for='radio6_" + i + "'>欠勤</label>"
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
			        	var nowSelect = $(this).closest('div');
			        	
						$('#selid').val($(nowSelect).getEmploeeID());
						
						if(selectedItem != null){
							$(selectedItem).getButtonContainer().fadeOut();
							$(selectedItem).animate({
								height:"130px",
							    backgroundColor:"#EEEEEE"
							},100);
							$('img', selectedItem).animate({
								height:"130px",
							    width:"130px"
							},100);

//							$(selectedItem).height(130);
//							$('img', selectedItem).height(130).width(130);
						}

						if(selectedItem == null || (selectedItem.getEmploeeID() != nowSelect.getEmploeeID())){
							selectedItem = nowSelect;
							$(nowSelect).getButtonContainer().fadeIn(100);
//							$(nowSelect).height(180);
							$(nowSelect).animate({
								height:"180px",
							    backgroundColor:"#FFEEEE"
							},100);
							$(this).animate({
								height:"170px",
							    width:"170px"
							},100);
//							$(this).height(170).width(170);
			        	}
						else{
							selectedItem = null;
						}
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