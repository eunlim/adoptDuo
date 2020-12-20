
var commonUtil = {
	
		//빈값 확인
		isEmpty : function(value){
			if( value == "" || value == null || value == undefined || ( value != null && typeof value == "object" && !Object.keys(value).length ) ){ 
				return true 
			}else { 
				return false 
			}
		},
		
		
		//Input Elements 초기화
		clearInputElements: function(elId) {
			$("#"+elId).find("input[type='text']").val("");
			$("#"+elId).find("input[type='password']").val("");
			$("#"+elId).find("input[type='file']").val("");
			$("#"+elId).find("input[type='hidden']").val("");
			$("#"+elId).find("img").attr("src", "");
			$("#"+elId).find("textarea").val("");
			$("#"+elId).find("input[type='text']").prop("disabled", false);
			$("#"+elId).find("button").prop("disabled", false);
			$("#"+elId).find("textarea").prop("disabled", false);
			$("#"+elId).find("select").prop("disabled", false);
			$("#"+elId).find("span").prop("disabled", false);
			$("#"+elId).find("input[type='checkbox']").prop("disabled", false);
		},
		
		//공통 validation check Handler
		invalidHandler: function(tagEl, form) {
			
			var validFlag = false;
			//필수체크
			if($(tagEl).attr("required")){
				if(commonUtil.isEmpty($.trim($(tagEl).val())) && $.trim($(tagEl).val()).length <= 0){
					var label = $("#"+form+" label[for='"+$(tagEl).attr("name")+"']").text();
					var msg = label+" 은/는 필수입력사항입니다.";
					$("#"+form+" :input[name="+$(tagEl).attr("name")+"]").focus();
					alert(msg);
					return false;
				}else {
					validFlag = true;
				}
			}
			
			//글자수 체크
			if($(tagEl).attr("min") && $(tagEl).attr("max")){
				var min = $(tagEl).attr("min")
				var max = $(tagEl).attr("max")
				if($.trim($(tagEl).val()).length == 0){
					validFlag = true;
				}else if($.trim($(tagEl).val()).length < min || $.trim($(tagEl).val()).length > max){
					var label = $("#"+form+" label[for='"+$(tagEl).attr("name")+"']").text();
					var msg = label+" 은/는 "+min+"이상 "+max+"이하의 문자를 입력해주세요."
					$("#"+form+" :input[name="+$(tagEl).attr("name")+"]").focus();
					alert(msg);
					return false;
				}else {
					validFlag = true;
				}
				
			}
			
			//한글있는지 체크
			if($(tagEl).attr("koreaCheck")){
				
				var str = $(tagEl).val();
				var check = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
				if(check.test(str)){
					var label = $("#"+form+" label[for='"+$(tagEl).attr("name")+"']").text();
					var msg = label+" 은/는 한글 문자열을 포함할 수 없습니다.";
					$("#"+form+" :input[name="+$(tagEl).attr("name")+"]").focus();
					alert(msg);
					return false;
				}else {
					validFlag = true;
				}
				
			}
			
			
			//숫자 체크
			if($(tagEl).attr("number")){
				
				var str = $(tagEl).val();
				
				if($.isNumeric( str )){
					validFlag = true;
				}else {
					var label = $("#"+form+" label[for='"+$(tagEl).attr("name")+"']").text();
					var msg = label+" 은/는 숫자만 입력가능합니다.";
					$("#"+form+" :input[name="+$(tagEl).attr("name")+"]").focus();
					alert(msg);
					return false;
				}
				
			}
			
			
			if(!$(tagEl).attr("required") || !$(tagEl).attr("min") || !$(tagEl).attr("max") || !$(tagEl).attr("koreaCheck") || !$(tagEl).attr("number")){
				validFlag = true;
			}
			
			return validFlag;
			
		},
		
		//elId안에 금액필드 콤마 value set
		settingComma: function(elId) {
			$("#"+elId+" .comma").each(function() {
				var num = $(this).val();
				var commaNum = commonUtil.numberWithCommas(num);
				$(this).val(commaNum);
			});
		},
		
		numberWithCommas: function(x) {
			return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		},
		
		
		//elId안에 금액필드 콤마 value remove set
		removeComma: function(elId) {
			$("#"+elId+" .comma").each(function() {
				var num = $(this).val();
				var commaNum = num.replace(/,/g, '');
				$(this).val(commaNum);
			});
		},
		
		
		//Select 위치정보
		getLocation: function() {
			
			var tags = "";
			var condition = {};
			
			$.ajax({
				type: "POST", 
				url: contextPath +  '/common/getLocation.json',
				data: condition,
				dataType: "json",
				async: false,
				success: function(data) {
					
					if(!commonUtil.isEmpty(data)){
						for(var i=0; i<data.length; i++) {
							tags += "<option value=\""+data[i].IDX+"\">"+data[i].EQIF_NAME+"</option>";
						}
					}
					
				},
				error: function(XMLHttpRequest,textStatus,errorThrown) {
					alert("[Error] 위치정보 SELECT BOX 조회 실패: "+textStatus);
				}
			});
			return tags;
			
		},
		
		
		
		
}


$(function() {
	
	
	
});	