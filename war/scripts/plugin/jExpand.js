(function($){
    $.fn.jExpand = function(){
        var element = this;

        $(element).find("tr:odd").addClass("odd");
        $(element).find("tr:not(.odd)").hide();
        $(element).find("tr:first-child").show();

        $(element).find("tr.odd").click(function() {
//            $(this).next("tr").toggle();
//            $(#selid).value($(this).next("tr").children('td:eq(2)').text());
        });
        
    }    
})(jQuery); 