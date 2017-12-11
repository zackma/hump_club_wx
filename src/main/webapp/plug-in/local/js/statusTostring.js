/**
 * Created by Administrator on 2017/6/22.
 */
$(function () {
    $(".status").each(function () {
    	var statusNum =  $(this).text();
    	var code = $("#configCode").val();
        if(code == 'eventInfo'){
	        switch (statusNum){
	            case '1':
	                $(this).text("事件上报").addClass("btn-sjsb");
	                break;
	            case '2':
	                //$(this).text("事件立案").addClass("btn-sjla");
					$(this).text("案件核实").addClass("btn-ajhs");
	                break;
	            case '3':
	                //$(this).text("案件核实").addClass("btn-ajhs");
					$(this).text("虚报事件").addClass("btn-xbsj");
	                break;
	            case '4':
	                //$(this).text("虚报事件").addClass("btn-xbsj");
					$(this).text("实报事件").addClass("btn-sbsj");
	                break;
	            case '5':
	                //$(this).text("实报事件").addClass("btn-sbsj");
					$(this).text("事件立案").addClass("btn-sjla");
	                break;
	            case '6':
	                $(this).text("处置中").addClass("btn-czz");
	                break;
	            case '7':
	                $(this).text("处置结束").addClass("btn-czjs");
	                break;
	            case '8':
	                $(this).text("核查中").addClass("btn-shz");
	                break;
	            case '9':
	                $(this).text("核查未通过").addClass("btn-shwtg");
	                break;
	            case '10':
	                $(this).text("核查通过").addClass("btn-shtg");
	                break;
	            case '11':
	                $(this).text("案件结案").addClass("btn-ajja");
	                break;
	            case '12':
	                $(this).text("案件未通过").addClass("btn-ajwtg");
	                break;
	        }
        }else if(code == 'eventCheck'){
        	 switch (statusNum){
		        case '1':
		            $(this).text("待核实").addClass("btn-sjsb");
		            break;
		        case '2':
		            $(this).text("虚报").addClass("btn-sjla");
		            break;
		        case '3':
		            $(this).text("实报").addClass("btn-sjla");
		            break;
		      }
        }else if(code == 'dealInfo'){
        	 switch (statusNum){
		        case '0':
		            $(this).text("处置中").addClass("btn-sjsb");
		            break;
		        case '1':
		            $(this).text("处置完成").addClass("btn-sjla");
		            break;
		    }
        }else if(code == 'dealVerify'){
       	 switch (statusNum){
	        case '1':
	            $(this).text("核查中").addClass("btn-sjsb");
	            break;
	        case '2':
	            $(this).text("未通过").addClass("btn-sjla");
	            break;
	        case '3':
	            $(this).text("通过").addClass("btn-sjla");
	            break;
			}
		 }

    });

})