

$(function() {


	$.ajax({
        url : "https://limy1118.cafe24.com/adoptDuo/login",
        type : 'POST',
       	data : {id : "admin", pw : "1234"},
        success : function(result) {// return이 없을경우 success는
     	  console.log(result)
        },
    });

	
});