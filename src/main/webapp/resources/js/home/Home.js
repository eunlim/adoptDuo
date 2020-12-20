
var contents = {

	el : {
		
	},
		
	setOption: function() {//검색조건 select box

	},
	
	uploadFile : function() {
		
		 // 등록할 파일 리스트
        var uploadFileList = Object.keys(fileList);

        // 파일이 있는지 체크
        if (uploadFileList.length == 0) {
            // 파일등록 경고창
            alert("등록할 파일이 없습니다.");
            return;
        }

        // 용량을 500MB를 넘을 경우 업로드 불가
        if (totalFileSize > maxUploadSize) {
            // 파일 사이즈 초과 경고창
            alert("총 용량 초과\n총 업로드 가능 용량 : " + maxUploadSize + " MB");
            return;
        }

        if (confirm("등록 하시겠습니까?")) {
            // 등록할 파일 리스트를 formData로 데이터 입력
            var form = $('#uploadForm')[0];
            var formData = new FormData(form);
            for (var i = 0; i < uploadFileList.length; i++) {
                formData.append('files', fileList[uploadFileList[i]]);
            }

            $.ajax({
                url : contextPath + "/uploadAjax.json",
                data : formData,
                type : 'POST',
                enctype : 'multipart/form-data',
                processData : false,
                contentType : false,
                dataType: 'text',
                cache : false,
                success : function(result) {// return이 없을경우 success는
												// 실행되지 않는다 -> void일 경우
             	  alert(result)
             	  
             	  
                },
                error : function(result) {
                	
                }
            });
        }
		
	}


}


$(function() {

	 $("#input_file").bind('change', function() {
         selectFile(this.files);
     });
     
     // 파일 드롭 다운
     fileDropDown();
	
});